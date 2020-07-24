set -x PYTHONSTARTUP ~/.pythonstartup
set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
set -x CCACHE_COMPRESS ""
set -x USE_SCHEDULER "icecc-scheduler.corp.tpe1.mozilla.com"
#set -x Qt5_DIR (brew --prefix)/opt/qt5
set -x CCACHE_COMPRESS ""
#set -x PAGER "diff-so-fancy | less --tabs=4 -RFX"
# eval (thefuck --alias)
set -x PATH $PATH ~/stgit
# set -x PATH $PATH ~/git-cinnabar ~/.mozbuild/version-control-tools/git/commands ~/stgit ~/moz-git-tools ~/.cargo/bin
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
#set -x PATH /usr/local/Cellar/git/2.8.4/bin /usr/local/sbin /usr/local/opt/coreutils/libexec/gnubin $PATH $OBJDIR/dist/bin $GOPATH/bin ~/rr/rr/obj/bin ~/git-cinnabar ~/moz-git-tools ~/stgit
#set -x DYLD_LIBRARY_PATH $OBJDIR/dist/lib $OBJDIR/dist/sdk/lib
#set -x DYLD_LIBRARY_PATH /Users/jonathan/Workspace/fxos-package-signing-tool/lib

alias g="git grep -a -n"
alias f="find . -name"
alias sshb "ssh ssh.booking.com"
alias tk="tmux kill-session -t"
alias tls="tmux ls"
alias tsf="tmux source-file ~/.tmux.conf"
alias g11="g++ -std=c++11 -g -DCPP11"
alias gco="git checkout"
alias gb="git branch"
alias gst="git status"
alias gsh="git show"
alias ga="git add"
alias gd="git diff"
alias gpu="git push"
alias gpl="git pull --rebase"
alias gf="git fetch"
alias gm="git merge"
alias gci="git commit"
alias gg="git grep -n"
alias dcj="~/Workspace/competitive-programming/DCJ/dcj_mac_os/dcj.sh"
alias tmux="tmux -S /tmp/tmux-socket"
alias sse="stg series -d"
alias spo="stg pop"
alias spu="stg push"
alias sref="stg refresh"
alias snew="stg new"
alias ssho="stg show"
alias ssq="stg squash"
alias sd="stg diff"

#set -x DYLD_LIBRARY_PATH /Volumes/gecko/mozilla-central/obj-x86_64-apple-darwin14.5.0/dist/lib/ /Volumes/gecko/mozilla-central/obj-x86_64-apple-darwin14.5.0/dist/sdk/lib/ /Volumes/gecko/mozilla-central/obj-x86_64-apple-darwin14.5.0/dist/bin/

thefuck --alias | source
