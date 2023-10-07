#!/usr/bin/bash

# ----------------------------------
# Colors
# ----------------------------------
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'


# ----------------------------------
# Functions
# ----------------------------------

banner () {
echo "     _______. __    _______ .__   __.    .___  ___. ____    ____      ______   ______    _______   _______ ";
echo "    /       ||  |  /  _____||  \ |  |    |   \/   | \   \  /   /     /      | /  __  \  |       \ |   ____|";
echo "   |   (----\|  | |  |  __ |\|   |  |    \  /  |  \  \/   /   |    ,----'|  | | |  |  .--.  ||   ||__   ";
echo "    \   \    |  | |  | |_ | |  .\`  |    |  |\/|  |   \_    _/      |  |    | | |  |  | |  |  |  ||   __|  ";
echo ".----)   |   |  | |  |__| | |  |\   |    |  |  |  |     |  |        |  \`----.|  \`--'| |  '--'  ||____ ";
echo "|_______/    |__|  \______| |__| \__|    |__|  |__|     |__|         \______| \______/  |_______/ |_______|";
echo "                                                                                                           ";
}


gpg-install () {
    # Verify if gpg is already installed, if not, install the package
    pkg=gpg
    status="$(dpkg-query -W --showformat='${db:Status-Status}' "$pkg" 2>&1)"
    NOCOLOR='\033[0m'
    RED='\033[0;31m'

    if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
    echo -e '\033[0;31m### Installing GPG... ###\033[0m'
    sudo apt -y install $pkg
    fi
}

git-install () {
    # Verify if git is already installed, if not, install the package
    pkg=git
    status="$(dpkg-query -W --showformat='${db:Status-Status}' "$pkg" 2>&1)"

    if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
    echo -e '\033[0;31m### Installing GIT... ###\033[0m'
    sudo apt -y install $pkg
    fi
}

check-GPG-key () {
    # Checking for existing GPG keys
    # This command to list the long form of the GPG keys
    echo -e '\033[0;31m### Checking for existing GPG keys... ###\033[0m'
    gpg --list-secret-keys --keyid-format=long
    echo -e '\033[0;31m########\033[0m'
}

generate-new-GPG-key () {
}


# ----------------------------------
# Select menu
# ----------------------------------

PS3='Please enter your choice: '

options=("Option 1" "Option 2" "Option 3" "Quit")

select opt in "${options[@]}"
do
    case $opt in
        "Option 1")
            echo "you chose choice 1"
            ;;
        "Option 2")
            echo "you chose choice 2"
            ;;
        "Option 3")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done