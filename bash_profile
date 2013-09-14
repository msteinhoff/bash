ADDPATH=""

echo "--------------------------------------------------------------------------------"
echo "I don't usually use the terminal. But when I do, I feel like god."
echo ""
. ~/.bash_library/bash
. ~/.bash_library/env
. ~/.bash_library/projects

. ~/.bash_library/languages
. ~/.bash_library/applications
. ~/.bash_library/aliases
echo ""
echo "--------------------------------------------------------------------------------"

export PATH=/usr/local/sbin:/usr/local/bin:$ADDPATH:$PATH
