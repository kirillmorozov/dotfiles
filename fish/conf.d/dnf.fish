#!/usr/bin/env fish

# Oh-My-Zsh dnf plugin abbreviations.
# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/dnf/dnf.plugin.zsh

abbr -a dnfc --description='clean all DNF caches' -- "sudo dnf clean all"
abbr -a dnfi --description='install DNF packages' -- "sudo dnf install"
abbr -a dnfl --description='list DNF packages' -- "dnf list"
abbr -a dnfli --description='list installed DNF packages' -- "dnf list installed"
abbr -a dnfp --description='show DNF package information' -- "dnf info"
abbr -a dnfr --description='remove DNF packages' -- "sudo dnf remove"
abbr -a dnfs --description='search DNF packages' -- "dnf search"
abbr -a dnfu --description='upgrade DNF packages' -- "sudo dnf upgrade"
