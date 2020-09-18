# Enable colors and change prompt:
autoload -U colors && colors
# TODO change to my prompt --- also check
# - https://github.com/denysdovhan/spaceship-prompt
# - https://github.com/sindresorhus/pure
# for ideas/solutions

# except for the "command number \#" the prompt is like the one I use for bash
# there is no use for \# anyway so I removed it
# the history number is +2 instead of bash with +1 for the last command - why?
PS1="%B%F{blue}%D{%Y%m%d %H:%M} %(?.%F{green}.%F{red})[%? %!] %F{yellow}%n@%m:%F{magenta}%~%f%b
%# "

# History in cache directory (not saved at all as default)
# TODO save from all sessions into one file
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/shell/zsh_history
setopt INC_APPEND_HISTORY # --- save not only at exit - if not used lose history from multiple shells?

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist                   # I did not see the colours nee also to set ZLS_COLOURS (http://zsh.sourceforge.net/Doc/Release/Zsh-Modules.html#The-zsh_002fcomplist-Module)
compinit
_comp_options+=(globdots)		# Include hidden files.

###
### vi mode
###
bindkey -v
#export KEYTIMEOUT=1 since 5.2 no longer needed - could be usefull to set to 5 (defualt 2) --- wait and see

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char # vi-... will only delete till /insert/
bindkey -v '^R' history-incremental-search-backward # like with bash
bindkey -v '^N' history-incremental-search-forward # C-s is not used, but not working - add C-p for backward to be /consistant/
bindkey -v '^P' history-incremental-search-backward

# # # # # # TODO # # # # # #
# use history search
# https://unix.stackexchange.com/questions/97843/how-can-i-search-history-with-text-already-entered-at-the-prompt-in-zsh
# https://unix.stackexchange.com/questions/44115/how-do-i-perform-a-reverse-history-search-in-zshs-vi-mode
# different movement
# https://stackoverflow.com/questions/32686012/rebind-normal-mode-controls-vi-zsh
# key mapping
# https://unix.stackexchange.com/questions/116562/key-bindings-table

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# TODO compare to this solution https://superuser.com/questions/151803/how-do-i-customize-zshs-vim-mode


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shell/shortcutrc" ]    && . "$HOME/.config/shell/shortcutrc"
[ -f "$HOME/.config/shell/aliasrc" ]       && . "$HOME/.config/shell/aliasrc"
[ -f "$HOME/.config/shell/bashrc_fcts" ]   && . "$HOME/.config/shell/bashrc_fcts"

# Load zsh-syntax-highlighting; should be last.
# https://github.com/zsh-users/zsh-syntax-highlighting
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

setopt interactivecomments
setopt auto_cd
