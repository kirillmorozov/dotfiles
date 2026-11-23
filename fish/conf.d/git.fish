#!/usr/bin/env fish

# Oh-My-Zsh git plugin abbreviations.
# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh

abbr -a g --description='run git' -- git
abbr -a grt --description='change to repository root' -- 'cd (git rev-parse --show-toplevel || echo .)'

# add
abbr -a ga --description='stage changes' -- 'git add'
abbr -a gaa --description='stage all changes' -- 'git add --all'
abbr -a gapa --description='stage selected changes' -- 'git add --patch'
abbr -a gau --description='stage tracked changes' -- 'git add --update'
abbr -a gav --description='stage changes verbosely' -- 'git add --verbose'
abbr -a gwip --description='commit work in progress' -- 'git add -A; git rm (git ls-files --deleted) 2>/dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'

# am
abbr -a gam --description='apply mailbox patch' -- 'git am'
abbr -a gama --description='abort mailbox patch application' -- 'git am --abort'
abbr -a gamc --description='continue mailbox patch application' -- 'git am --continue'
abbr -a gams --description='skip mailbox patch' -- 'git am --skip'
abbr -a gamscp --description='show current mailbox patch' -- 'git am --show-current-patch'

# apply
abbr -a gap --description='apply patch' -- 'git apply'
abbr -a gapt --description='apply patch with three-way merge' -- 'git apply --3way'

# bisect
abbr -a gbs --description='manage binary search' -- 'git bisect'
abbr -a gbsb --description='mark bisect revision bad' -- 'git bisect bad'
abbr -a gbsg --description='mark bisect revision good' -- 'git bisect good'
abbr -a gbsn --description='mark bisect revision new' -- 'git bisect new'
abbr -a gbso --description='mark bisect revision old' -- 'git bisect old'
abbr -a gbsr --description='reset binary search' -- 'git bisect reset'
abbr -a gbss --description='start binary search' -- 'git bisect start'

# blame
abbr -a gbl --description='show blame ignoring whitespace' -- 'git blame -w'

# branch
abbr -a gb --description='list branches' -- 'git branch'
abbr -a gbD --description='force delete branch' -- 'git branch --delete --force'
abbr -a gba --description='list all branches' -- 'git branch --all'
abbr -a gbd --description='delete branch' -- 'git branch --delete'
abbr -a gbg --description='list branches with gone upstreams' -- "LANG=C git branch -vv | grep ': gone\\]'"
abbr -a gbgD --description='force delete branches with gone upstreams' -- "LANG=C git branch --no-color -vv | grep ': gone\\]' | cut -c 3- | awk '{print \$1}' | xargs git branch -D"
abbr -a gbgd --description='delete branches with gone upstreams' -- "LANG=C git branch --no-color -vv | grep ': gone\\]' | cut -c 3- | awk '{print \$1}' | xargs git branch -d"
abbr -a gbm --description='rename branch' -- 'git branch --move'
abbr -a gbnm --description='list unmerged branches' -- 'git branch --no-merged'
abbr -a gbr --description='list remote branches' -- 'git branch --remote'

# checkout
abbr -a gcB --description='create or reset branch and check out' -- 'git checkout -B'
abbr -a gcb --description='create and check out branch' -- 'git checkout -b'
abbr -a gco --description='check out revision' -- 'git checkout'
abbr -a gcor --description='check out with submodules' -- 'git checkout --recurse-submodules'

# cherry-pick
abbr -a gcp --description='cherry-pick commit' -- 'git cherry-pick'
abbr -a gcpa --description='abort cherry-pick' -- 'git cherry-pick --abort'
abbr -a gcpc --description='continue cherry-pick' -- 'git cherry-pick --continue'

# clean
abbr -a gclean --description='interactively clean untracked directories' -- 'git clean --interactive -d'

# clone
abbr -a gcl --description='clone repository with submodules' -- 'git clone --recurse-submodules'
abbr -a gclf --description='partially clone with shallow submodules' -- 'git clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules'

# commit
abbr -a 'gc!' --description='amend commit verbosely' -- 'git commit --verbose --amend'
abbr -a 'gca!' --description='amend all changes verbosely' -- 'git commit --verbose --all --amend'
abbr -a 'gcan!' --description='amend all changes without editing' -- 'git commit --verbose --all --no-edit --amend'
abbr -a 'gcann!' --description='amend all changes with current date' -- 'git commit --verbose --all --date=now --no-edit --amend'
abbr -a 'gcans!' --description='sign off amended all-changes commit' -- 'git commit --verbose --all --signoff --no-edit --amend'
abbr -a 'gcn!' --description='amend commit without editing' -- 'git commit --verbose --no-edit --amend'
abbr -a gc --description='commit verbosely' -- 'git commit --verbose'
abbr -a gca --description='commit all changes verbosely' -- 'git commit --verbose --all'
abbr -a gcam --description='commit all changes with message' -- 'git commit --all --message'
abbr -a gcas --description='commit all changes with signoff' -- 'git commit --all --signoff'
abbr -a gcasm --description='sign off all-changes commit with message' -- 'git commit --all --signoff --message'
abbr -a gcfu --description='create fixup commit' -- 'git commit --fixup'
abbr -a gcmsg --description='commit with message' -- 'git commit --message'
abbr -a gcn --description='commit without editing message' -- 'git commit --verbose --no-edit'
abbr -a gcs --description='create GPG-signed commit' -- 'git commit --gpg-sign'
abbr -a gcsm --description='sign off commit with message' -- 'git commit --signoff --message'
abbr -a gcss --description='create GPG-signed signoff commit' -- 'git commit --gpg-sign --signoff'
abbr -a gcssm --description='create GPG-signed signoff commit with message' -- 'git commit --gpg-sign --signoff --message'

# config
abbr -a gcf --description='list Git configuration' -- 'git config --list'

# describe
abbr -a gdct --description='describe latest tag' -- 'git describe --tags (git rev-list --tags --max-count=1)'

# diff
abbr -a gd --description='show unstaged changes' -- 'git diff'
abbr -a gdca --description='show cached changes' -- 'git diff --cached'
abbr -a gdcw --description='show cached changes by word' -- 'git diff --cached --word-diff'
abbr -a gds --description='show staged changes' -- 'git diff --staged'
abbr -a gdt --description='list changed files in tree' -- 'git diff-tree --no-commit-id --name-only -r'
abbr -a gdup --description='compare with upstream' -- 'git diff @{upstream}'
abbr -a gdw --description='show changes by word' -- 'git diff --word-diff'

# fetch
abbr -a gf --description='fetch remotes' -- 'git fetch'
abbr -a gfa --description='fetch all remotes, tags, and prune' -- 'git fetch --all --tags --prune --jobs=10'
abbr -a gfo --description='fetch origin' -- 'git fetch origin'

# help
abbr -a ghh --description='show Git help' -- 'git help'

# log
abbr -a glg --description='show log with statistics' -- 'git log --stat'
abbr -a glgg --description='show graphical log' -- 'git log --graph'
abbr -a glgga --description='show graphical log of all refs' -- 'git log --graph --decorate --all'
abbr -a glgm --description='show last ten commits graphically' -- 'git log --graph --max-count=10'
abbr -a glgp --description='show log with statistics and patches' -- 'git log --stat --patch'
abbr -a glo --description='show one-line decorated log' -- 'git log --oneline --decorate'
abbr -a glod --description='show graphical detailed log' -- 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
abbr -a glods --description='show graphical log with short dates' -- 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
abbr -a glog --description='show one-line graphical log' -- 'git log --oneline --decorate --graph'
abbr -a gloga --description='show one-line graph of all refs' -- 'git log --oneline --decorate --graph --all'
abbr -a glol --description='show graphical log with relative dates' -- 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
abbr -a glola --description='show graphical log of all refs with relative dates' -- 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
abbr -a glols --description='show graphical log with statistics' -- 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
abbr -a gwch --description='show complete change history' -- 'git log --patch --abbrev-commit --pretty=medium --raw'

# ls-files
abbr -a gfg --description='search tracked files' -- 'git ls-files | grep'
abbr -a gignored --description='list ignored tracked files' -- 'git ls-files -v | grep "^[[:lower:]]"'

# merge
abbr -a gm --description='merge branch' -- 'git merge'
abbr -a gma --description='abort merge' -- 'git merge --abort'
abbr -a gmc --description='continue merge' -- 'git merge --continue'
abbr -a gmff --description='fast-forward merge only' -- 'git merge --ff-only'
abbr -a gms --description='squash merge' -- 'git merge --squash'
abbr -a gmtl --description='open merge tool without prompt' -- 'git mergetool --no-prompt'
abbr -a gmtlvim --description='open Vim diff merge tool' -- 'git mergetool --no-prompt --tool=vimdiff'

# pull
abbr -a gl --description='pull changes' -- 'git pull'
abbr -a gpr --description='pull with rebase' -- 'git pull --rebase'
abbr -a gpra --description='pull with rebase and autostash' -- 'git pull --rebase --autostash'
abbr -a gprav --description='verbosely pull with rebase and autostash' -- 'git pull --rebase --autostash -v'
abbr -a gprv --description='verbosely pull with rebase' -- 'git pull --rebase -v'

# push
abbr -a 'gpf!' --description='force push' -- 'git push --force'
abbr -a gp --description='push changes' -- 'git push'
abbr -a gpd --description='dry-run push' -- 'git push --dry-run'
abbr -a gpf --description='force push safely' -- 'git push --force-with-lease --force-if-includes'
abbr -a gpoat --description='push all branches and tags to origin' -- 'git push origin --all && git push origin --tags'
abbr -a gpod --description='delete remote branch on origin' -- 'git push origin --delete'
abbr -a gpu --description='push to upstream' -- 'git push upstream'
abbr -a gpv --description='push verbosely' -- 'git push --verbose'

# rebase
abbr -a grb --description='rebase branch' -- 'git rebase'
abbr -a grba --description='abort rebase' -- 'git rebase --abort'
abbr -a grbc --description='continue rebase' -- 'git rebase --continue'
abbr -a grbi --description='interactively rebase' -- 'git rebase --interactive'
abbr -a grbo --description='rebase onto revision' -- 'git rebase --onto'
abbr -a grbs --description='skip rebase commit' -- 'git rebase --skip'

# reflog
abbr -a grf --description='show reference log' -- 'git reflog'

# remote
abbr -a gr --description='manage remotes' -- 'git remote'
abbr -a gra --description='add remote' -- 'git remote add'
abbr -a grmv --description='rename remote' -- 'git remote rename'
abbr -a grrm --description='remove remote' -- 'git remote remove'
abbr -a grset --description='set remote URL' -- 'git remote set-url'
abbr -a grup --description='update remotes' -- 'git remote update'
abbr -a grv --description='list remotes verbosely' -- 'git remote --verbose'

# reset
abbr -a gpristine --description='discard all changes and untracked files' -- 'git reset --hard && git clean --force -dfx'
abbr -a grh --description='reset changes' -- 'git reset'
abbr -a grhh --description='hard reset changes' -- 'git reset --hard'
abbr -a grhk --description='reset while keeping local changes' -- 'git reset --keep'
abbr -a grhs --description='soft reset changes' -- 'git reset --soft'
abbr -a gru --description='unstage changes' -- 'git reset --'
abbr -a gwipe --description='discard changes and untracked files' -- 'git reset --hard && git clean --force -df'

# restore
abbr -a grs --description='restore changes' -- 'git restore'
abbr -a grss --description='restore from source revision' -- 'git restore --source'
abbr -a grst --description='restore staged changes' -- 'git restore --staged'

# rev-list
abbr -a gunwip --description='remove latest work-in-progress commit' -- 'git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'

# revert
abbr -a grev --description='revert commit' -- 'git revert'
abbr -a greva --description='abort revert' -- 'git revert --abort'
abbr -a grevc --description='continue revert' -- 'git revert --continue'

# rm
abbr -a grm --description='remove tracked file' -- 'git rm'
abbr -a grmc --description='remove file from index' -- 'git rm --cached'

# shortlog
abbr -a gcount --description='count commits by author' -- 'git shortlog --summary --numbered'

# show
abbr -a gsh --description='show commit or object' -- 'git show'
abbr -a gsps --description='show commit with signature' -- 'git show --pretty=short --show-signature'

# stash
abbr -a gsb --description='show short status with branch' -- 'git status --short --branch'
abbr -a gss --description='show short status' -- 'git status --short'
abbr -a gst --description='show status' -- 'git status'
abbr -a gsta --description='stash changes' -- 'git stash push'
abbr -a gstaa --description='apply stash' -- 'git stash apply'
abbr -a gstall --description='manage all stashes' -- 'git stash --all'
abbr -a gstc --description='clear stashes' -- 'git stash clear'
abbr -a gstd --description='drop stash' -- 'git stash drop'
abbr -a gstl --description='list stashes' -- 'git stash list'
abbr -a gstp --description='pop stash' -- 'git stash pop'
abbr -a gsts --description='show stash patch' -- 'git stash show --patch'
abbr -a gstu --description='stash including untracked files' -- 'git stash push --include-untracked'

# submodule
abbr -a gsi --description='initialize submodules' -- 'git submodule init'
abbr -a gsu --description='update submodules' -- 'git submodule update'

# switch
abbr -a gsw --description='switch branch' -- 'git switch'
abbr -a gswc --description='create and switch branch' -- 'git switch --create'

# tag
abbr -a gta --description='create annotated tag' -- 'git tag --annotate'
abbr -a gts --description='create signed tag' -- 'git tag --sign'
abbr -a gtv --description='list version-sorted tags' -- 'git tag | sort -V'

# update-index
abbr -a gignore --description='assume file is unchanged' -- 'git update-index --assume-unchanged'
abbr -a gunignore --description='stop assuming file is unchanged' -- 'git update-index --no-assume-unchanged'

# worktree
abbr -a gwt --description='manage worktrees' -- 'git worktree'
abbr -a gwta --description='add worktree' -- 'git worktree add'
abbr -a gwtls --description='list worktrees' -- 'git worktree list'
abbr -a gwtmv --description='move worktree' -- 'git worktree move'
abbr -a gwtrm --description='remove worktree' -- 'git worktree remove'
