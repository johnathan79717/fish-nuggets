while not git push
    git fetch origin trunk
    if stg rebase origin/trunk
        git clean -df ~/workspace/main
        stg clean
    else
        break
    end
end
stg commit -a
