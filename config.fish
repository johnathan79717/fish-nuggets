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

set -x GOPATH ~/go

set -x OBJDIR /Users/jonathan/Workspace/mozilla-central/obj-x86_64-apple-darwin15.0.0
set -x PATH /usr/local/sbin /usr/local/opt/coreutils/libexec/gnubin /usr/local/git/bin $PATH $OBJDIR/dist/bin $GOPATH/bin ~/rr/rr/obj/bin ~/src/git-cinnabar ~/moz-git-tools ~/stgit
#set -x DYLD_LIBRARY_PATH $OBJDIR/dist/lib $OBJDIR/dist/sdk/lib
#set -x DYLD_LIBRARY_PATH /Users/jonathan/Workspace/fxos-package-signing-tool/lib

set -x LC_ALL en_US.UTF-8
set -x LANG=en_US.UTF-8

alias tk="tmux kill-session -t"
alias tls="tmux ls"
alias tsf="tmux source-file ~/.tmux.conf"
alias g11="g++ -std=c++11 -g -DCPP11"
alias gco="git checkout"
alias gb="git branch"
alias gst="git status"
alias ga="git add"
alias gd="git diff"
alias gp="git push"
alias gf="git fetch"
alias gm="git merge"
alias gci="git commit"
alias gsh="git stash"
alias dcj="/Users/jonathan/Workspace/competitive-programming/DCJ/dcj_mac_os/dcj.sh"
alias tmux="tmux -S /tmp/tmux-socket"
alias gse="stg series -d"
alias gpo="stg pop"
alias gpu="stg push"

#set -x DYLD_LIBRARY_PATH /Volumes/gecko/mozilla-central/obj-x86_64-apple-darwin14.5.0/dist/lib/ /Volumes/gecko/mozilla-central/obj-x86_64-apple-darwin14.5.0/dist/sdk/lib/ /Volumes/gecko/mozilla-central/obj-x86_64-apple-darwin14.5.0/dist/bin/
