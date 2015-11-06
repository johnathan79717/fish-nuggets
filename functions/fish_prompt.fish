function fish_prompt --description "Write out the prompt"
  printf '%s%s %s%s%s%s%s>' (set_color cyan) (whoami) (set_color green) (prompt_pwd) (parse_git_branch) (set_color white)
  set_color normal
  printf ' '
end
