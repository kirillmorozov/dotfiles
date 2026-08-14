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

abbr -a jja -- 'jj abandon'
abbr -a jjb -- 'jj bookmark'
abbr -a jjba -- 'jj bookmark advance'
abbr -a jjbc -- 'jj bookmark create'
abbr -a jjbd -- 'jj bookmark delete'
abbr -a jjbf -- 'jj bookmark forget'
abbr -a jjbl -- 'jj bookmark list'
abbr -a jjbm -- 'jj bookmark move'
abbr -a jjbr -- 'jj bookmark rename'
abbr -a jjbs -- 'jj bookmark set'
abbr -a jjbt -- 'jj bookmark track'
abbr -a jjbu -- 'jj bookmark untrack'
abbr -a jjc -- 'jj commit'
abbr -a jjcmsg -- 'jj commit --message'
abbr -a jjd -- 'jj diff'
abbr -a jjdfs -- 'jj diff --revision "stack()"'
abbr -a jjdmsg -- 'jj desc --message'
abbr -a jjds -- 'jj desc'
abbr -a jje -- 'jj edit'
abbr -a jjgcl -- 'jj git clone'
abbr -a jjgf -- 'jj git fetch'
abbr -a jjgfa -- 'jj git fetch --all-remotes'
abbr -a jjgp -- 'jj git push'
abbr -a jjgpa -- 'jj git push --all'
abbr -a jjgpd -- 'jj git push --deleted'
abbr -a jjgpn -- __jj_git_push_new
abbr -a jjgpt -- 'jj git push --tracked'
abbr -a jjl -- 'jj log'
abbr -a jjla -- 'jj log --revision "all()"'
abbr -a jjls -- 'jj log --revision "stack()"'
abbr -a jjn -- 'jj new'
abbr -a jjnt -- 'jj new "trunk()"'
abbr -a jjrb -- 'jj rebase'
abbr -a jjrbm -- 'jj rebase --onto "trunk()"'
abbr -a jjrs -- 'jj restore'
abbr -a jjrt -- 'cd (jj root || echo .)'
abbr -a jjsp -- 'jj split'
abbr -a jjsq -- 'jj squash'
abbr -a jjsqp -- 'jj squash && jj git push'
abbr -a jjsqs -- 'jj squash --revision "stack()"'
abbr -a jjst -- 'jj status'
