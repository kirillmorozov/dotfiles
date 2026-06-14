#!/usr/bin/env fish

# Oh-My-Zsh git plugin abbreviations.
# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh

abbr -a g -- git
abbr -a grt -- 'cd (git rev-parse --show-toplevel || echo .)'

# add
abbr -a ga -- 'git add'
abbr -a gaa -- 'git add --all'
abbr -a gapa -- 'git add --patch'
abbr -a gau -- 'git add --update'
abbr -a gav -- 'git add --verbose'
abbr -a gwip -- 'git add -A; git rm (git ls-files --deleted) 2>/dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'

# am
abbr -a gam -- 'git am'
abbr -a gama -- 'git am --abort'
abbr -a gamc -- 'git am --continue'
abbr -a gams -- 'git am --skip'
abbr -a gamscp -- 'git am --show-current-patch'

# apply
abbr -a gap -- 'git apply'
abbr -a gapt -- 'git apply --3way'

# bisect
abbr -a gbs -- 'git bisect'
abbr -a gbsb -- 'git bisect bad'
abbr -a gbsg -- 'git bisect good'
abbr -a gbsn -- 'git bisect new'
abbr -a gbso -- 'git bisect old'
abbr -a gbsr -- 'git bisect reset'
abbr -a gbss -- 'git bisect start'

# blame
abbr -a gbl -- 'git blame -w'

# branch
abbr -a gb -- 'git branch'
abbr -a gbD -- 'git branch --delete --force'
abbr -a gba -- 'git branch --all'
abbr -a gbd -- 'git branch --delete'
abbr -a gbg -- "LANG=C git branch -vv | grep ': gone\\]'"
abbr -a gbgD -- "LANG=C git branch --no-color -vv | grep ': gone\\]' | cut -c 3- | awk '{print \$1}' | xargs git branch -D"
abbr -a gbgd -- "LANG=C git branch --no-color -vv | grep ': gone\\]' | cut -c 3- | awk '{print \$1}' | xargs git branch -d"
abbr -a gbm -- 'git branch --move'
abbr -a gbnm -- 'git branch --no-merged'
abbr -a gbr -- 'git branch --remote'

# checkout
abbr -a gcB -- 'git checkout -B'
abbr -a gcb -- 'git checkout -b'
abbr -a gco -- 'git checkout'
abbr -a gcor -- 'git checkout --recurse-submodules'

# cherry-pick
abbr -a gcp -- 'git cherry-pick'
abbr -a gcpa -- 'git cherry-pick --abort'
abbr -a gcpc -- 'git cherry-pick --continue'

# clean
abbr -a gclean -- 'git clean --interactive -d'

# clone
abbr -a gcl -- 'git clone --recurse-submodules'
abbr -a gclf -- 'git clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules'

# commit
abbr -a 'gc!' -- 'git commit --verbose --amend'
abbr -a 'gca!' -- 'git commit --verbose --all --amend'
abbr -a 'gcan!' -- 'git commit --verbose --all --no-edit --amend'
abbr -a 'gcann!' -- 'git commit --verbose --all --date=now --no-edit --amend'
abbr -a 'gcans!' -- 'git commit --verbose --all --signoff --no-edit --amend'
abbr -a 'gcn!' -- 'git commit --verbose --no-edit --amend'
abbr -a gc -- 'git commit --verbose'
abbr -a gca -- 'git commit --verbose --all'
abbr -a gcam -- 'git commit --all --message'
abbr -a gcas -- 'git commit --all --signoff'
abbr -a gcasm -- 'git commit --all --signoff --message'
abbr -a gcfu -- 'git commit --fixup'
abbr -a gcmsg -- 'git commit --message'
abbr -a gcn -- 'git commit --verbose --no-edit'
abbr -a gcs -- 'git commit --gpg-sign'
abbr -a gcsm -- 'git commit --signoff --message'
abbr -a gcss -- 'git commit --gpg-sign --signoff'
abbr -a gcssm -- 'git commit --gpg-sign --signoff --message'

# config
abbr -a gcf -- 'git config --list'

# describe
abbr -a gdct -- 'git describe --tags (git rev-list --tags --max-count=1)'

# diff
abbr -a gd -- 'git diff'
abbr -a gdca -- 'git diff --cached'
abbr -a gdcw -- 'git diff --cached --word-diff'
abbr -a gds -- 'git diff --staged'
abbr -a gdt -- 'git diff-tree --no-commit-id --name-only -r'
abbr -a gdup -- 'git diff @{upstream}'
abbr -a gdw -- 'git diff --word-diff'

# fetch
abbr -a gf -- 'git fetch'
abbr -a gfa -- 'git fetch --all --tags --prune --jobs=10'
abbr -a gfo -- 'git fetch origin'

# help
abbr -a ghh -- 'git help'

# log
abbr -a glg -- 'git log --stat'
abbr -a glgg -- 'git log --graph'
abbr -a glgga -- 'git log --graph --decorate --all'
abbr -a glgm -- 'git log --graph --max-count=10'
abbr -a glgp -- 'git log --stat --patch'
abbr -a glo -- 'git log --oneline --decorate'
abbr -a glod -- 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
abbr -a glods -- 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
abbr -a glog -- 'git log --oneline --decorate --graph'
abbr -a gloga -- 'git log --oneline --decorate --graph --all'
abbr -a glol -- 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
abbr -a glola -- 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
abbr -a glols -- 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
abbr -a gwch -- 'git log --patch --abbrev-commit --pretty=medium --raw'

# ls-files
abbr -a gfg -- 'git ls-files | grep'
abbr -a gignored -- 'git ls-files -v | grep "^[[:lower:]]"'

# merge
abbr -a gm -- 'git merge'
abbr -a gma -- 'git merge --abort'
abbr -a gmc -- 'git merge --continue'
abbr -a gmff -- 'git merge --ff-only'
abbr -a gms -- 'git merge --squash'
abbr -a gmtl -- 'git mergetool --no-prompt'
abbr -a gmtlvim -- 'git mergetool --no-prompt --tool=vimdiff'

# pull
abbr -a gl -- 'git pull'
abbr -a gpr -- 'git pull --rebase'
abbr -a gpra -- 'git pull --rebase --autostash'
abbr -a gprav -- 'git pull --rebase --autostash -v'
abbr -a gprv -- 'git pull --rebase -v'

# push
abbr -a 'gpf!' -- 'git push --force'
abbr -a gp -- 'git push'
abbr -a gpd -- 'git push --dry-run'
abbr -a gpf -- 'git push --force-with-lease --force-if-includes'
abbr -a gpoat -- 'git push origin --all && git push origin --tags'
abbr -a gpod -- 'git push origin --delete'
abbr -a gpu -- 'git push upstream'
abbr -a gpv -- 'git push --verbose'

# rebase
abbr -a grb -- 'git rebase'
abbr -a grba -- 'git rebase --abort'
abbr -a grbc -- 'git rebase --continue'
abbr -a grbi -- 'git rebase --interactive'
abbr -a grbo -- 'git rebase --onto'
abbr -a grbs -- 'git rebase --skip'

# reflog
abbr -a grf -- 'git reflog'

# remote
abbr -a gr -- 'git remote'
abbr -a gra -- 'git remote add'
abbr -a grmv -- 'git remote rename'
abbr -a grrm -- 'git remote remove'
abbr -a grset -- 'git remote set-url'
abbr -a grup -- 'git remote update'
abbr -a grv -- 'git remote --verbose'

# reset
abbr -a gpristine -- 'git reset --hard && git clean --force -dfx'
abbr -a grh -- 'git reset'
abbr -a grhh -- 'git reset --hard'
abbr -a grhk -- 'git reset --keep'
abbr -a grhs -- 'git reset --soft'
abbr -a gru -- 'git reset --'
abbr -a gwipe -- 'git reset --hard && git clean --force -df'

# restore
abbr -a grs -- 'git restore'
abbr -a grss -- 'git restore --source'
abbr -a grst -- 'git restore --staged'

# rev-list
abbr -a gunwip -- 'git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'

# revert
abbr -a grev -- 'git revert'
abbr -a greva -- 'git revert --abort'
abbr -a grevc -- 'git revert --continue'

# rm
abbr -a grm -- 'git rm'
abbr -a grmc -- 'git rm --cached'

# shortlog
abbr -a gcount -- 'git shortlog --summary --numbered'

# show
abbr -a gsh -- 'git show'
abbr -a gsps -- 'git show --pretty=short --show-signature'

# stash
abbr -a gsb -- 'git status --short --branch'
abbr -a gss -- 'git status --short'
abbr -a gst -- 'git status'
abbr -a gsta -- 'git stash push'
abbr -a gstaa -- 'git stash apply'
abbr -a gstall -- 'git stash --all'
abbr -a gstc -- 'git stash clear'
abbr -a gstd -- 'git stash drop'
abbr -a gstl -- 'git stash list'
abbr -a gstp -- 'git stash pop'
abbr -a gsts -- 'git stash show --patch'
abbr -a gstu -- 'git stash push --include-untracked'

# submodule
abbr -a gsi -- 'git submodule init'
abbr -a gsu -- 'git submodule update'

# switch
abbr -a gsw -- 'git switch'
abbr -a gswc -- 'git switch --create'

# tag
abbr -a gta -- 'git tag --annotate'
abbr -a gts -- 'git tag --sign'
abbr -a gtv -- 'git tag | sort -V'

# update-index
abbr -a gignore -- 'git update-index --assume-unchanged'
abbr -a gunignore -- 'git update-index --no-assume-unchanged'

# worktree
abbr -a gwt -- 'git worktree'
abbr -a gwta -- 'git worktree add'
abbr -a gwtls -- 'git worktree list'
abbr -a gwtmv -- 'git worktree move'
abbr -a gwtrm -- 'git worktree remove'
