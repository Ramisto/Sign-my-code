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

gh-install () {
    # Function for install github cli package
    type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
}

check-GPG-key () {
    # Function for check for existing GPG keys
    # This command to list the long form of the GPG keys
    echo -e '\033[0;35m--- Check for existing GPG keys ---\033[0m';
    gpg --list-secret-keys --keyid-format=long
    echo -e '\033[0;35m-----------------------\033[0m';
}

generate-new-GPG-key () {
    # Function for generate a new GPG key
    echo -e '\033[0;35m--- Check for existing GPG keys ---\033[0m';
    echo -e '\033[0;35m1) for specify the kind of key you want, press Enter to accept the default.\033[0m';
    echo -e '\033[0;35m2) for specify the key size you want, press Enter to accept the default.\033[0m';
    echo -e '\033[0;35m3) for specify the length of time the key should be valid, indicate '90' and press Enter to accept (90 days).\033[0m';
    echo -e '\033[0;35m4) enter your realname (John Doe)\033[0m';
    echo -e '\033[0;35m5) enter your professional e-mail address (john.doe@business.com)\033[0m';
    echo -e '\033[0;35m5) enter your passphrase (ideally with dashlane, 1password, etc...)\033[0m';
    gpg --full-generate-key
    
    check-GPG-key
    echo -e '\033[0;35m-----------------------\033[0m';
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