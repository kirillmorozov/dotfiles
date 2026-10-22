#!/usr/bin/env fish

# Oh-My-Zsh brew plugin abbreviations.
# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/brew/brew.plugin.zsh

abbr -a ba --description='remove unused formulae' -- 'brew autoremove'
abbr -a bcn --description='clean up cached downloads' -- 'brew cleanup'
abbr -a bdr --description='diagnose Homebrew issues' -- 'brew doctor'
abbr -a bi --description='install a formula or cask' -- 'brew install'
abbr -a bl --description='list installed packages' -- 'brew list'
abbr -a bo --description='list outdated packages' -- 'brew outdated'
abbr -a br --description='reinstall a package' -- 'brew reinstall'
abbr -a bs --description='search available packages' -- 'brew search'
abbr -a bu --description='update Homebrew' -- 'brew update'
abbr -a bubo --description='update Homebrew and list outdated packages' -- 'brew update; and brew outdated'
abbr -a bubu --description='update Homebrew and upgrade packages' -- 'brew update; and brew outdated; and brew upgrade'
abbr -a bup --description='upgrade outdated packages' -- 'brew upgrade'
