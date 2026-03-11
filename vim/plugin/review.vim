vim9script

const REVIEW_EFM = '%f:%l:%c: %m'
const REVIEW_LINE_PATTERN = '^.\+:\d\+:\d\+:\s'

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

def RunCodexReview(): list<string>
	var output_file = tempname()
	var prompt = BuildPrompt()
	var cmd = 'codex exec review --uncommitted --output-last-message '
		.. shellescape(output_file)
		.. ' '
		.. shellescape(prompt)

	var command_output = systemlist(cmd)
	var exit_code = v:shell_error
	var review_output: list<string> = []

	if filereadable(output_file)
		review_output = readfile(output_file)
		delete(output_file)
	endif

	if exit_code != 0 && empty(review_output)
		throw 'codex review failed: ' .. join(command_output, "\n")
	endif

	return review_output
enddef

def ReviewCommand()
	if !executable('codex')
		echoerr 'Review: codex executable not found in $PATH'
		return
	endif

	try
		if !HasUncommittedChanges()
			setqflist([], 'r', {'title': 'Codex Review', 'items': []})
			cclose
			echomsg 'Review: no changed files.'
			return
		endif

		var review_output = RunCodexReview()
		var findings: list<string> = []
		for line in review_output
			if line =~# REVIEW_LINE_PATTERN
				add(findings, line)
			endif
		endfor

		setqflist([], 'r', {'title': 'Codex Review', 'lines': findings, 'efm': REVIEW_EFM})

		if !empty(getqflist())
			copen
		else
			cclose
			echomsg 'Review: no findings.'
		endif
	catch
		echoerr 'Review: ' .. v:exception
	endtry
enddef

command! -bar Review ReviewCommand()
