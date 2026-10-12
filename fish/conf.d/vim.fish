#!/usr/bin/env fish

if command -q vimx
    alias vim vimx
end

abbr -a nv -- nvim
abbr -a nvr -- 'nvim -R'
abbr -a nvri -- 'nvim -R -'
abbr -a v -- vim
abbr -a vr -- 'vim -R'
abbr -a vri -- 'vim -R -'
