# /etc/profile
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# path
export PATH=/usr/local/bin:/usr/local/sbin:/bin:/usr/bin

# colors
export LS_COLORS="di=1;31:ln=31:so=32:pi=33:ex=37:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# prompt
# square brackets around directories
# export PS1="\[$(tput setaf 0)\]inxiti\[$(tput bold)\]\[$(tput setaf 0)\]morningtide \[$(tput sgr0)\]\[$(tput setaf 0)\][\[$(tput bold)\]\[$(tput setaf 7)\]\w\[$(tput sgr0)\]\[$(tput setaf 0)\]] \\$ \[$(tput sgr0)\]"

# parenthesis around directories
export PS1="\[$(tput setaf 0)\]\u\[$(tput bold)\]\[$(tput setaf 0)\]\h \[$(tput sgr0)\]\[$(tput setaf 0)\](\[$(tput bold)\]\[$(tput setaf 7)\]\w\[$(tput sgr0)\]\[$(tput setaf 0)\]) \\$ \[$(tput sgr0)\]"

# use rg with fzf
export FZF_DEFAULT_COMMAND='rg --files --ignore-case --no-messages --follow --no-ignore --hidden --color auto --glob "!.git/*"'

# programs
export EDITOR=nvim
export VISUAL=vimr

# aliases
alias ls='ls -FGh'
alias pip='pip3'
alias python='python3'
alias buu='brew update && brew upgrade'
