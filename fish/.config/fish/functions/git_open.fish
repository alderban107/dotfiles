#!/usr/bin/env fish

function git_open
    if git remote get-url --all origin > /dev/null ^ /dev/null
        if git remote get-url --all origin | grep -q "github.com\|gitlab.com\|bitbucket.org\|gitea.com"
            if git remote get-url --all origin | grep -q "https"
                set REPOSITORY (git remote get-url --all origin)
            else
                set REPOSITORY (git remote get-url --all origin | sed 's/git@//' | sed 's/:/\//')
            end
            xdg-open $REPOSITORY
        else
            echo "ERROR: Repository not on a supported host"
        end
    else
        echo "ERROR: You are not in a git repository"
    end
end
