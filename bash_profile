[ -d "$BASHY" ] || exit 1
[ -d "$BASHPROJECTS" ] || exit 1

export EDIT="subl -n"
export WORK="$HOME/Work"
export PROJECTS="$WORK/Projects"
export DOTFILES="$WORK/Projects/msteinhoff/dotfiles"
export SCRIPTS="$WORK/Projects/msteinhoff/scripts"

NOBANNER=${NOBANNER:-false}
[ "$NOBANNER" = "false" ] && echo "--------------------------------------------------------------------------------"
[ "$NOBANNER" = "false" ] && echo "I don't usually use the terminal. But when I do, I feel like god."
[ "$NOBANNER" = "false" ] && echo ""

for section in global.d applications.d languages.d;
do
    if [ -d "${BASHY}/bash_library/${section}/${HOSTNAME}.host" ];
    then
        for file in ${BASHY}/bash_library/${section}/${HOSTNAME}.host/*;
        do
            source ${file};
        done
    fi

    for file in $(find ${BASHY}/bash_library/${section} -maxdepth 1 -type f);
        do source ${file};
    done
done

if [ -d "$BASHPROJECTS" ];
then
    for f in $BASHPROJECTS/*;
    do
        source $f;
    done
fi

[ "$NOBANNER" = "false" ] && echo "Aliases:"
[ "$NOBANNER" = "false" ] && echo -e "$HELP_ALIASES"
[ "$NOBANNER" = "false" ] && echo "Projects:"
[ "$NOBANNER" = "false" ] && echo "$HELP_PROJECTS"
[ "$NOBANNER" = "false" ] && echo "--------------------------------------------------------------------------------"

export PATH="$SCRIPTS:$PATH"

alias cd-bash="cd $BASHY"
alias edit-bash="$EDIT $BASHY"
alias edit-bash-projects="$EDIT $BASHPROJECTS"
alias reload="NOBANNER=true source $BASHY/bash_profile"

add-application() {
    touch $BASHY/bash_library/applications.d/$1
    subl -n -a $BASHY $BASHY/bash_library/applications.d/$1
}
