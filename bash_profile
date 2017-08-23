export BASHY=~/Work/Projects/msteinhoff/bash
export BASHPROJECTS=~/Work/Projects/msteinhoff/bash-projects

export EDIT="subl -n"

NOBANNER=${NOBANNER:-false}
[ "$NOBANNER" = "false" ] && echo "--------------------------------------------------------------------------------"
[ "$NOBANNER" = "false" ] && echo "I don't usually use the terminal. But when I do, I feel like god."
[ "$NOBANNER" = "false" ] && echo ""
. $BASHY/bash_library/bash
. $BASHY/bash_library/env
. $BASHY/bash_library/languages
. $BASHY/bash_library/applications
. $BASHY/bash_library/aliases
. $BASHY/bash_library/projects
[ "$NOBANNER" = "false" ] && echo ""
[ "$NOBANNER" = "false" ] && echo "To edit profile/library: edit-bash"
[ "$NOBANNER" = "false" ] && echo "--------------------------------------------------------------------------------"

export PATH="$SCRIPTS:$PATH"

alias cd-bash="cd $BASHY"
alias edit-bash="$EDIT $BASHY"
alias edit-bash-projects="$EDIT $BASHPROJECTS"
alias reload="NOBANNER=true source ~/.bash_profile"
ulimit -n 4096
