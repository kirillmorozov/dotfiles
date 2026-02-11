compiler yamllint
nnoremap <buffer> <Leader>m :make<Space>%<CR>
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2

if executable("yq")
    setlocal formatprg=yq\ '.'
endif

if executable("yamlfmt")
    setlocal formatprg=yamlfmt
                \\ -formatter
                \\ include_document_start=true
                \\ -formatter
                \\ max_line_length=80
                \\ -formatter
                \\ pad_line_comments=2
                \\ -formatter
                \\ retain_line_breaks=true
                \\ -formatter
                \\ retain_line_breaks_single=true
                \\ -formatter
                \\ scan_folded_as_literal=true
                \\ -in
endif
