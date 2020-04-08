export PATH=~/bin:$PATH
export PERL5LIB=$REPOS/workspace/perlscripts/system/

alias Gnc="cd $REPOS/notes/collect/"
alias Gwd="cd $REPOS/workspace/documentation"
alias G64="cd $REPOS/C64"

alias sdcv="sdcv --color"

#https://stackoverflow.com/questions/103857/what-is-your-favorite-bash-prompt
#
export FG="\[\033[0m\]"    # unsets color to term's fg color
# regular colors
export K="\[\033[0;30m\]"    # black
export R="\[\033[0;31m\]"    # red
export G="\[\033[0;32m\]"    # green
export Y="\[\033[0;33m\]"    # yellow
export B="\[\033[0;34m\]"    # blue
export M="\[\033[0;35m\]"    # magenta/purple
export C="\[\033[0;36m\]"    # cyan
#export W="\[\033[0;37m\]"    # white
#
## empahsized (bolded) colors
#export EMK="\[\033[1;30m\]"
#export EMR="\[\033[1;31m\]"
#export EMG="\[\033[1;32m\]"
#export EMY="\[\033[1;33m\]"
#export EMB="\[\033[1;34m\]"
#export EMM="\[\033[1;35m\]"
#export EMC="\[\033[1;36m\]"
#export EMW="\[\033[1;37m\]"
#
## background colors
#export BGK="\[\033[40m\]"
#export BGR="\[\033[41m\]"
#export BGG="\[\033[42m\]"
#export BGY="\[\033[43m\]"
#export BGB="\[\033[44m\]"
#export BGM="\[\033[45m\]"
#export BGC="\[\033[46m\]"
#export BGW="\[\033[47m\]"
#
#
#    if [ "${EXITSTATUS}" -eq 0 ]
#    then
#        PS1="${PROMPT} [${GREEN}${EXITSTATUS}${RED}]${OFF}\n$ "
#    else
#        PS1="${PROMPT} [${BOLD}${EXITSTATUS}${RED}]${OFF}\n$ "
#    fi

# not sure how usefull, as many code parts are in patebin or other none existing locations (>10y)
# http://www.reddit.com/r/programming/comments/697cu/bash_users_what_do_you_have_for_your_ps1/

# set in bashrc:
# - BGR = BackGRound colour used for input
# - PHC = Prompt Host Colour
PS1="$B\D{%Y%m%d} \t \`if (( \$? == 0 )); then echo '$G'; else echo '$R'; fi;\` [\$? \! \#] $Y\u@$PHC\h$Y:$M\w${FG}\n${BGR}\$ "
trap 'printf \\e[0m' DEBUG

# https://unix.stackexchange.com/questions/20803/customizing-bash-shell-bold-color-the-command
# https://unix.stackexchange.com/questions/198723/change-color-of-input-text-not-output
# https://stackoverflow.com/questions/39305476/bash-prompt-with-background-color-extending-to-end-of-line
