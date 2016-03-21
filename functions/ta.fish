function ta
    if test (count $argv) = 0
        tmux attach
    else
        tmux attach -t $argv
    end
end
