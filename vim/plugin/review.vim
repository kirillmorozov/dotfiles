vim9script

const REVIEW_EFM = '%f:%l:%c: %m'
const REVIEW_LINE_PATTERN = '^.\+:\d\+:\d\+:\s'

var review_job: job

def BuildPrompt(): string
	var prompt =<< trim END
	Review only the changed files in this git repository.
	Report only actionable issues that should be fixed before merge.
	Output strictly one finding per line in this exact format:
	path/to/file:line:column: message
	Use relative file paths and 1-based line/column numbers.
	Do not output markdown, headings, bullets, code fences, or summary text.
	If there are no issues, output nothing.
	END
	return join(prompt, "\n")
enddef

def HasUncommittedChanges(): bool
	system('git rev-parse --is-inside-work-tree')
	if v:shell_error != 0
		throw 'not inside a git repository'
	endif

	var status = systemlist('git status --porcelain')
	if v:shell_error != 0
		throw 'unable to read git status'
	endif

	return !empty(status)
enddef

def OnReviewOutput(output: list<string>)
	var findings: list<string> = []
	for line in output
		if line =~# REVIEW_LINE_PATTERN
			add(findings, line)
		endif
	endfor

	setqflist([], 'r', {'title': 'Claude Review', 'lines': findings, 'efm': REVIEW_EFM})

	if !empty(getqflist())
		copen
	else
		cclose
		echomsg 'Review: no findings.'
	endif
enddef

def OnReviewClose(channel: channel)
	var output: list<string> = []
	while ch_status(channel, {'part': 'out'}) ==# 'buffered'
		add(output, ch_read(channel, {'part': 'out'}))
	endwhile

	OnReviewOutput(output)
enddef

def OnReviewExit(job: job, exit_code: number)
	var channel = job_getchannel(job)
	OnReviewClose(channel)

	if exit_code != 0 && empty(getqflist())
		echoerr 'Review: claude exited with code ' .. exit_code
	endif
enddef

def ReviewCommand()
	if !executable('claude')
		echoerr 'Review: claude executable not found in $PATH'
		return
	endif

	if type(review_job) == v:t_job && job_status(review_job) ==# 'run'
		echomsg 'Review: already running.'
		return
	endif

	try
		if !HasUncommittedChanges()
			setqflist([], 'r', {'title': 'Claude Review', 'items': []})
			cclose
			echomsg 'Review: no changed files.'
			return
		endif

		var prompt = BuildPrompt()
		var cmd = ['claude', '-p', '--permission-mode', 'plan', '--model', 'sonnet', prompt]

		echomsg 'Review: running...'
		review_job = job_start(cmd, {
			'out_mode': 'nl',
			'close_cb': OnReviewClose,
			'exit_cb': OnReviewExit,
		})
	catch
		echoerr 'Review: ' .. v:exception
	endtry
enddef

command! -bar Review ReviewCommand()
