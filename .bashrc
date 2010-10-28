# http://henrik.nyh.se/2008/12/git-dirty-prompt

# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/

function proml {
  local BLUE="\[\033[0;34m\]"
  local RED="\[\033[0;31m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local WHITE="\[\033[1;37m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
}

proml

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1 $(parse_git_dirty)]/"
}

export PS1='\[\033[0;32m\]\h\[\033[0;36m\] \w \[\033[0;31m\]$(parse_git_branch)\[\033[00m\]: '
