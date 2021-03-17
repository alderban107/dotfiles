#!/usr/bin/env fish

function git_open
    if git remote get-url --all origin > /dev/null ^ /dev/null
        set -l REPOSITORY (git remote get-url --all origin | sed 's/git@//' | sed 's/:/\//')
        xdg-open $REPOSITORY
    else
        echo "ERROR: You are not in a git repository"
    end
end
