function push
<<<<<<< HEAD
    while not git push
        git fetch origin trunk
        if stg rebase origin/trunk
            git clean -df ~/workspace/main
            stg clean
=======
    while true
        if not git fetch origin trunk; or not stg rebase origin/trunk
            break
        end
        git clean -df ~/workspace/main
        stg clean
        if git push
            stg commit -a
            break
>>>>>>> kvm
        else
            break
        end
    end
<<<<<<< HEAD
    stg commit -a
=======
>>>>>>> kvm
end
