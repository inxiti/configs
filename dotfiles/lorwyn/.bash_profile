# /etc/profile
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

# source bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# bash completion
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
    . /usr/local/share/bash-completion/bash_completion
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# paths:
#	cargo: rust
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:$PATH"

# colors
export LS_COLORS="di=1;31:ln=31:so=32:pi=33:ex=37:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export BAT_THEME="1337"

# prompt
# square brackets around directories
# export PS1="\[$(tput setaf 0)\]inxiti\[$(tput bold)\]\[$(tput setaf 0)\]morningtide \[$(tput sgr0)\]\[$(tput setaf 0)\][\[$(tput bold)\]\[$(tput setaf 7)\]\w\[$(tput sgr0)\]\[$(tput setaf 0)\]] \\$ \[$(tput sgr0)\]"

# parenthesis around directories
export PS1="\[$(tput setaf 0)\]\u\[$(tput bold)\]\[$(tput setaf 0)\]\h \[$(tput sgr0)\]\[$(tput setaf 0)\](\[$(tput bold)\]\[$(tput setaf 7)\]\w\[$(tput sgr0)\]\[$(tput setaf 0)\]) \\$ \[$(tput sgr0)\]"

# use rg with fzf, not using --hidden for hidden files
export FZF_DEFAULT_COMMAND='rg --files --ignore-case --no-messages --follow --no-ignore --color auto --glob "!.git/*"'

# programs
export EDITOR=nvim
# hopefully this works, was vimr
export VISUAL=subl

# aliases
alias ls='ls -FGh'
#alias pip='pip3'
#alias python='python3'
alias buu='brew update && brew upgrade'
alias clearGoToFieldHistory='defaults delete com.apple.finder GoToField; defaults delete com.apple.finder GoToFieldHistory; killall Finder'
alias tks='tmux kill-server'
