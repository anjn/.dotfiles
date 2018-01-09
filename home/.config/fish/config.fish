function fish_prompt
  set -l git_branch (git branch ^ /dev/null | sed -n '/\* /s///p')
  set -l host_bg 444444
  set -l host_fg white
  set -l pwd_bg 222222
  set -l pwd_fg white
  set_color -b $host_bg $host_fg
  echo -n (whoami)'@'(hostname)' '
  set_color -b $pwd_bg $host_bg
  echo -n ''
  set_color -b $pwd_bg $pwd_fg
  echo -n ' '(prompt_pwd)' '
  
  if [ -z "$git_branch" ]
    set_color normal
    set_color $pwd_bg
    echo -n ''
  else
    set_color -b green $pwd_bg
    echo -n ''
    set_color -b green brblack
    echo -n ' '"$git_branch"' '
    set_color normal
    set_color green
    echo -n ''
  end

  echo
  set_color normal
  set_color --bold
  #echo -n '▸ '
  echo -n '$ '
end
