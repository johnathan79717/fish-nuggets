for p in /usr/bin /usr/local/bin ~/bin ~/.config/fish/bin 
  if test -d $p
    set -x PATH $p $PATH
  end
end

set -x EDITOR "vim"
set -x BROWSER open
set -x CLICOLOR 1
set fish_greeting ""

# pull in a local, ignored-by-git config file
if test -f ~/.config/fish/config.local.fish
  . ~/.config/fish/config.local.fish
end
