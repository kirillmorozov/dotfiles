compiler go

if executable("gofumpt")
	setlocal formatprg=gofumpt
elseif executable("gofmt")
	setlocal formatprg=gofmt
endif
