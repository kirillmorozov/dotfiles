vim9script

compiler go
setlocal formatprg=gofmt

if executable("gofumpt")
    setlocal formatprg=gofumpt
endif
