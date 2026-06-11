#!/usr/bin/env fish

set -l __eza_base "eza -l --total-size --time-style long-iso --group-directories-first --icons"

abbr -a e $__eza_base
abbr -a ea "$__eza_base -a"
abbr -a et "$__eza_base -T"
