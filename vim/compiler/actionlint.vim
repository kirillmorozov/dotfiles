vim9script

if exists('g:current_compiler')
	finish
endif
g:current_compiler = 'actionlint'

execute 'CompilerSet makeprg=' .. escape('actionlint -format ''{{range .}}{{.Filepath}}:{{.Line}}:{{.Column}}:{{.EndColumn}}: {{.Message}}{{println}}{{end}}''', ' \|"')
CompilerSet errorformat=%f:%l:%c:%k:\ %m
