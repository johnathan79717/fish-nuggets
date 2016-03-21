function tn
    if test (count $argv) = 0
        tmux new
    else
        tmux new -s $argv
    end
end
