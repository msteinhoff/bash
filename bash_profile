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
echo ""
echo "To edit profile/library: edit-bash"
echo "--------------------------------------------------------------------------------"
fi

export PATH=/usr/local/sbin:/usr/local/bin:$PATH

alias edit-bash="subl -n ~/Work/Personal/bash"
alias reload="NOBANNER=true source ~/.bash_profile"
