#!/usr/bin/env fish

set -l __eza_base "eza -l --total-size --time-style long-iso --group-directories-first --icons"

abbr -a e --description='list files with details' $__eza_base
abbr -a ea --description='list all files with details' "$__eza_base -a"
abbr -a et --description='list files as a tree' "$__eza_base -T"
