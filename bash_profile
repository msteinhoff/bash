[ -d "$BASHY" ] || exit

export EDIT="subl -n"


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


export PATH="$SCRIPTS:$PATH"

alias cd-bash="cd $BASHY"
alias edit-bash="$EDIT $BASHY"
alias edit-bash-projects="$EDIT $BASHPROJECTS"
alias reload="NOBANNER=true source $BASHY/bash_profile"

add-application() {
    touch $BASHY/bash_library/applications.d/$1
    subl -n -a $BASHY $BASHY/bash_library/applications.d/$1
}
