#!/bin/sh
current_branch=`git branch | grep '*' | sed 's/* //'`

if [ "$current_branch" = "master" ]; then
    echo "You are about to push on branch. Lets try to build the code first"
    
    # code build statement


    if [ $? -eq 0 ]; then
        # tests passed, proceed to prepare commit message
        exit 0
    else
        # some tests failed, prevent from committing broken code on master
        echo "Some tests failed. You are not allowed to commit broken code on master! Aborting the commit."
        echo "Note: you can still commit broken code on feature branches"
        exit 1
    fi
fi
