local rvm=''
if which rvm-prompt &> /dev/null; then
  rvm='%{%F{green}%}‹$(rvm-prompt i v p g)›%{%f%}'
fi

local nvm=''
if which nvm &> /dev/null; then
  nvm='%{%F{magenta}%}‹node $(nvm current)›%{%f%}'
fi

local perlbrew=''
if which perlbrew &> /dev/null; then
	perlbrew="%{%F{blue}%}‹perl $(perlbrew use | sed 's/.*-//')›%{%f%}"
fi

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{%F{red}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{blue}%}) %{%F{yellow}✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{blue}%})"

# Removed Bits
# %{$fg_bold[red]%}➜
# %{$fg_bold[green]%}%p

# PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%}
# %{$fg[cyan]%}${PWD/#$HOME/~} %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

PROMPT='%{%F{magenta}%}%n%{%f%} at %{%F{yellow}%}%m%{%f%} %{%F{cyan}%}${PWD/#$HOME/~}%{%f%} %{%B%}%{%F{blue}%}$(git_prompt_info)%{%b%}%{%f%} '
RPROMPT="${nvm} ${rvm} ${perlbrew}"
