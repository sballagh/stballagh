trydir="/usr/local/src/geeknote"
if [[ -e "$trydir" ]];
then
    GEEKNOTE_HOME="$trydir"
else
    GEEKNOTE_HOME=$(find -L "$HOME" -type d -name "geeknote" 2>/dev/null)
fi

export GEEKNOTE_HOME
