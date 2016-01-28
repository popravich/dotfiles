alias greppy='grep -rnI -A2 -B2 --include=*.py'

# Make pytnon module by path

mkpymodule(){
    path=$1;
    if [ "${1}" != "" ]; then
        echo "mkdir $path && touch $path/__init__.py";
        mkdir $path && touch $path/__init__.py;
    else
        echo "no path";
    fi;
}

# hl function for stands for `--help | less`

hl(){
    if [ "${1}" != "" ]; then
        $1 --help | less;
    else
        echo 'hl -- is a wrapper for "$1 --help | less"';
    fi;
} && complete -A command -o default hl
