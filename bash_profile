if [ -d "$BASHY" ];
then
    VISUAL="subl -n"
    EDITOR="$VISUAL"

    pathmunge() {
        case ":${PATH}:" in
            *:"$1":*)
                ;;
            *)
                PATH=$1:$PATH
        esac
    }

    HOST_PATTERNS=(${BASHY}/bash_library/{global.d,applications.d,languages.d}/${HOSTNAME}.host)
    GLOBAL_PATTERNS=(${BASHY}/bash_library/{global.d,applications.d,languages.d})
    HOST_FILES=$(find ${HOST_PATTERNS[@]} -maxdepth 1 -type f 2>/dev/null)
    GLOBAL_FILES=$(find ${GLOBAL_PATTERNS[@]} -maxdepth 1 -type f 2>/dev/null)

    for FILE in ${HOST_FILES} ${GLOBAL_FILES};
    do
        source ${FILE};
    done

    unset -f pathmunge

    alias cd-bashy="cd $BASHY"
    alias edit-bashy="$EDITOR $BASHY"
    alias reload-bashy="source $BASHY/bash_profile"

    export VISUAL
    export EDITOR
    export PATH
else
    echo "Failed to load bashy: BASHY environment variable is not set"
fi
