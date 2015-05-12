NOBANNER=${NOBANNER:-false}
if [ "$NOBANNER" = "false" ]
then
echo "--------------------------------------------------------------------------------"
echo "I don't usually use the terminal. But when I do, I feel like god."
echo ""
. ~/.bash_library/bash
. ~/.bash_library/env
. ~/.bash_library/languages
. ~/.bash_library/applications
. ~/.bash_library/aliases
. ~/.bash_library/projects
. $SCRIPTS/z.sh
echo ""
echo "To edit profile/library: edit-bash"
echo "--------------------------------------------------------------------------------"
fi

export BASHY=~/Work/Personal/bash
export PATH=/usr/local/sbin:/usr/local/bin:~/Library/Scripts:$PATH
export EDIT="subl -n"

alias edit-bash="$EDIT $BASHY"
alias reload="NOBANNER=true source ~/.bash_profile"
ulimit -n 4096

add-application() {
    touch $BASHY/bash_library/applications.d/$1
    subl -n -a $BASHY $BASHY/bash_library/applications.d/$1
}
