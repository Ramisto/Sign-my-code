#!/usr/bin/bash

# ----------------------------------
# Functions
# ----------------------------------

banner () {
echo -e "\033[0;35m     _______. __    _______ .__   __.    .___  ___. ____    ____      ______   ______    _______   _______ \033[0m";
echo -e "\033[0;35m    /       ||  |  /  _____||  \ |  |    |   \/   | \   \  /   /     /      | /  __  \  |       \ |   ____|\033[0m";
echo -e "\033[0;35m   |   (----\|  | |  |  __|\|  |    |    \  /  |  \  \/   /   |    ,----'|  | | |  |  .--.  ||   ||__   \033[0m";
echo -e "\033[0;35m    \   \    |  | |  | |_ | | .\`   |     |  |\/|  |   \_    _/      |    |    | |  |  | | |  |  |||   __|  \033[0m";
echo -e "\033[0;35m.----)   |   |  | |  |__| | |  |\   |    |  |  |  |     |  |        |    \`--. |  \`--' | |  '--'  ||____ \033[0m";
echo -e "\033[0;35m|_______/    |__|  \______| |__| \__|    |__|  |__|     |__|         \______| \______/  |_______/ |_______|\033[0m";
echo -e "";
echo "";
echo "";    
}

gpg-git-install () {
    # Function for install gpg and git packages 
    echo -e '\033[0;35m--- Installing GPG ---\033[0m';
    apt -y install gpg
    echo -e '\033[0;35m-----------------------\033[0m';

    echo -e '\033[0;35m--- Installing Git ---\033[0m';
    apt -y install git
    echo -e '\033[0;35m-----------------------\033[0m';
}

check-GPG-key () {
    # Check for existing GPG keys
    # This command to list the long form of the GPG keys
    echo -e '\033[0;35m--- Check for existing GPG keys ---\033[0m';
    gpg --list-secret-keys --keyid-format=long
    echo -e '\033[0;35m-----------------------\033[0m';
}

generate-new-GPG-key () {
    echo 'hello';
}

add-gpg-key-github () {
    echo 'hello';
}

configure-git-cli () {
    echo 'hello';
}

sign-commit-examples () {
    echo 'hello';
}


# ----------------------------------
# Select menu
# ----------------------------------

banner

PS3='Please enter your choice: '
options=("Install gpg and git packages" "Check for existing GPG keys" "Generate a new GPG key" "Add a GPG key to your GitHub account" "Tell Git about your signing key" "Sign commits examples" "Quit")

select opt in "${options[@]}";
do
    case $opt in
        "Install gpg and git packages")
            gpg-git-install
            ;;
        "Check for existing GPG keys")
            check-GPG-key
            ;;
        "Generate a new GPG key")
            generate-new-GPG-key
            ;;
        "Add a GPG key to your GitHub account")
            add-gpg-key-github
            ;;
        "Tell Git about your signing key")
            configure-git-cli
            ;;
        "Sign commits examples")
            sign-commit-examples
            ;;
        "Quit")
            break
            ;;
        *) 
            echo "Invalid option $REPLY"
            ;;
    esac
done