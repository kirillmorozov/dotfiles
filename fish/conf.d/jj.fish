#!/usr/bin/env fish

function __jj_normalize_bookmark_part \
    --argument-names part \
    --description 'Normalize text for use as part of a jj bookmark name'

    set -l normalized_part (
        string lower -- "$part" \
        | string replace --all --regex '[^a-z0-9]+' '-' \
        | string trim --chars '-'
    )
    test -n "$normalized_part"
    or return 1

    echo "$normalized_part"
end

function __jj_bookmark_name_from_description \
    --argument-names description \
    --description 'Convert a Conventional Commit description to a jj bookmark name'

    set -l conventional_commit
    set -l bookmark_parts
    if set conventional_commit (
        string match \
            --regex '^([[:alnum:]-]+)\(([^)]+)\)!?:[[:space:]]*(.+)$' \
            -- \
            "$description"
    )
        set bookmark_parts $conventional_commit[2..4]
    else if set conventional_commit (
        string match \
            --regex '^([[:alnum:]-]+)!?:[[:space:]]*(.+)$' \
            -- \
            "$description"
    )
        set bookmark_parts $conventional_commit[2..3]
    else
        echo 'the working-copy description is not a conventional commit' >&2
        return 1
    end

    set -l normalized_parts
    for part in $bookmark_parts
        set -l normalized_part (__jj_normalize_bookmark_part "$part")
        if test $status -ne 0
            echo 'the working-copy description cannot be converted into a bookmark name' >&2
            return 1
        end
        set -a normalized_parts "$normalized_part"
    end

    string join / $normalized_parts
end

function __jj_working_copy_has_bookmark \
    --description 'Check whether a bookmark points to the jj working copy'
    jj log --no-graph --revision @ --template 'local_bookmarks.len() > 0'
end

function __jj_working_copy_description \
    --description 'Print the first line of the jj working-copy description'
    jj log --no-graph --revision @ --template 'description.first_line()'
end

function __jj_git_push_new \
    --description 'Push the working copy, creating a bookmark from its description if needed' \
    --wraps 'jj git push'
    set -l has_bookmark (__jj_working_copy_has_bookmark)
    or return

    if test "$has_bookmark" = true
        echo 'jjgpn: nothing to do; the working copy is already bookmarked' >&2
        return
    end

    set -l description (__jj_working_copy_description)
    or return

    set -l bookmark (__jj_bookmark_name_from_description "$description")
    or return

    jj git push --named "$bookmark=@" $argv
end

# Oh-My-Zsh jj plugin abbreviations.
# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/jj/jj.plugin.zsh

abbr -a jja --description='abandon revision' -- 'jj abandon'
abbr -a jjb --description='manage bookmarks' -- 'jj bookmark'
abbr -a jjba --description='advance bookmark' -- 'jj bookmark advance'
abbr -a jjbc --description='create bookmark' -- 'jj bookmark create'
abbr -a jjbd --description='delete bookmark' -- 'jj bookmark delete'
abbr -a jjbf --description='forget bookmark' -- 'jj bookmark forget'
abbr -a jjbl --description='list bookmarks' -- 'jj bookmark list'
abbr -a jjbm --description='move bookmark' -- 'jj bookmark move'
abbr -a jjbr --description='rename bookmark' -- 'jj bookmark rename'
abbr -a jjbs --description='set bookmark' -- 'jj bookmark set'
abbr -a jjbt --description='track bookmark' -- 'jj bookmark track'
abbr -a jjbu --description='untrack bookmark' -- 'jj bookmark untrack'
abbr -a jjc --description='commit changes' -- 'jj commit'
abbr -a jjcmsg --description='commit with message' -- 'jj commit --message'
abbr -a jjd --description='show diff' -- 'jj diff'
abbr -a jjdfs --description='diff revision stack' -- 'jj diff --revision "stack()"'
abbr -a jjdmsg --description='set description message' -- 'jj desc --message'
abbr -a jjds --description='edit description' -- 'jj desc'
abbr -a jje --description='edit revision' -- 'jj edit'
abbr -a jjgcl --description='clone Git repository' -- 'jj git clone'
abbr -a jjgf --description='fetch Git remotes' -- 'jj git fetch'
abbr -a jjgfa --description='fetch all Git remotes' -- 'jj git fetch --all-remotes'
abbr -a jjgp --description='push to Git remote' -- 'jj git push'
abbr -a jjgpa --description='push all bookmarks' -- 'jj git push --all'
abbr -a jjgpd --description='push deleted bookmarks' -- 'jj git push --deleted'
abbr -a jjgpn --description='push new bookmarked revision' -- __jj_git_push_new
abbr -a jjgpt --description='push all tracked bookmarks' -- 'jj git push --tracked'
abbr -a jjl --description='show revision log' -- 'jj log'
abbr -a jjla --description='show all revisions' -- 'jj log --revision "all()"'
abbr -a jjls --description='show revision stack' -- 'jj log --revision "stack()"'
abbr -a jjn --description='create new revision' -- 'jj new'
abbr -a jjnt --description='create revision on trunk' -- 'jj new "trunk()"'
abbr -a jjrb --description='rebase revision' -- 'jj rebase'
abbr -a jjrbm --description='rebase revision onto trunk' -- 'jj rebase --onto "trunk()"'
abbr -a jjrs --description='restore files' -- 'jj restore'
abbr -a jjrt --description='change to repository root' -- 'cd (jj root || echo .)'
abbr -a jjsp --description='split revision' -- 'jj split'
abbr -a jjsq --description='squash revision' -- 'jj squash'
abbr -a jjsqp --description='squash revision and push' -- 'jj squash && jj git push'
abbr -a jjsqs --description='squash revision stack' -- 'jj squash --revision "stack()"'
abbr -a jjst --description='show repository status' -- 'jj status'
