[ -d "$BASHY" ] || exit

VISUAL="subl -n"
EDITOR="$VISUAL"


HOST_PATTERNS=(${BASHY}/bash_library/{global.d,applications.d,languages.d}/${HOSTNAME}.host)
GLOBAL_PATTERNS=(${BASHY}/bash_library/{global.d,applications.d,languages.d})
HOST_FILES=$(find ${HOST_PATTERNS[@]} -maxdepth 1 -type f 2>/dev/null)
GLOBAL_FILES=$(find ${GLOBAL_PATTERNS[@]} -maxdepth 1 -type f 2>/dev/null)

for FILE in ${HOST_FILES} ${GLOBAL_FILES};
do
    source ${FILE};
done



alias cd-bash="cd $BASHY"
alias edit-bash="$EDIT $BASHY"
alias reload="NOBANNER=true source $BASHY/bash_profile"

add-application() {
    touch $BASHY/bash_library/applications.d/$1
    subl -n -a $BASHY $BASHY/bash_library/applications.d/$1
}
export VISUAL
export EDITOR
