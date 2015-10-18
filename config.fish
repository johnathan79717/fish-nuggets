# pull in a local, ignored-by-git config file
if test -f ~/.config/fish/config.local.fish
  . ~/.config/fish/config.local.fish
end

# load rvm default settings
if test -f ~/.rvm/scripts/rvm
  # if the fish version is not exist, or the bash version is newer(modified)
  if test ! -f ~/.config/fish/rvm.local.fish -o ~/.rvm/script/rvm -nt ~/.config/fish/rvm.local.fish
    set -l env_file (mktemp -t rvm.fish.XXXXXXXXXX)
    bash -c 'source ~/.rvm/scripts/rvm; rvm "$@"; status=$?; env > "$0"; exit $status' $env_file $argv
    
    # apply rvm_* and *PATH variables from the captured environment
    # omit rvm_error_message, which is problematic
    grep '^rvm\|^[^=]*PATH' $env_file | sed '/^[^=]*PATH/y/:/ /; s/\(.*\)=\(.*\)$/set -xg \1 "\2";/' | grep -v 'rvm_error_message' > ~/.config/fish/rvm.local.fish

    # clean up
    rm -f $env_file
  end

  . ~/.config/fish/rvm.local.fish
end

for p in ~/bin
  if test -d $p
    set -x PATH $p $PATH
  end
end

set -x EDITOR "vim"
set -x BROWSER open
set -x CLICOLOR 1
set fish_greeting ""

set -x PATH /usr/local/opt/coreutils/libexec/gnubin /usr/local/git/bin $PATH /Volumes/gecko/mozilla-central/obj-x86_64-apple-darwin14.5.0/dist/bin
alias tk="tmux kill-session -t"
alias tn="tmux new -s"
alias ta="tmux attach"
alias tat="tmux attach -t"
alias tls="tmux ls"
alias tsf="tmux source-file ~/.tmux.conf"
alias g11="g++ -std=c++11 -g"
alias gco="git checkout"
alias gb="git branch"
alias gst="git status"

#set -x DYLD_LIBRARY_PATH /Volumes/gecko/mozilla-central/obj-x86_64-apple-darwin14.5.0/dist/lib/ /Volumes/gecko/mozilla-central/obj-x86_64-apple-darwin14.5.0/dist/sdk/lib/ /Volumes/gecko/mozilla-central/obj-x86_64-apple-darwin14.5.0/dist/bin/
