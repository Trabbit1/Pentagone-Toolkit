#!/bin/bash

###########################
#            __           #
#   ___ ___ / /___ _____  #
#  (_-</ -_) __/ // / _ \ #
# /___/\__/\__/\_,_/ .__/ #
#                 /_/     #
###########################
# Pentagone-Toolkit Setup #
###########################

# VARIABLES
fuzzing_wordlist_url="https://raw.githubusercontent.com/six2dez/OneListForAll/refs/heads/main/onelistforallmicro.txt"
fuzzing_wordlist_file="onelistforallmicro.txt"

# GITHUB REPOS LIST
REPOS=(
    "https://github.com/Trabbit0ne/SSHash"
    "https://github.com/TrabbitOne/hetter"
    "https://github.com/TrabbitOne/XSStrike"
    "https://github.com/C4ssif3r/admin-panel-finder"
    "https://github.com/gwen001/cloudflare-origin-ip"
    "https://github.com/Trabbit0ne/loctrac_textonly"
)

# PIP3 LIST
TOOLS=(
    "subfinder"
    "wpscan"
    "sqlmap"
    "arjun"
)

# APT LIST
APT_TOOLS=(
    "ffuf"
    "nmap"
)

# FUNCTIONS

# function to clone Github repos
clone_repos() {
    for repo in "${REPOS[@]}"; do
        repo_name=$(basename "$repo" .git)
        if [ -d "$repo_name" ]; then
            echo "Repository $repo_name already exists, skipping..."
        else
            git clone "$repo" || { echo "Failed to clone $repo"; exit 1; }
        fi
    done
}

# function to install pip tools
install_tools() {
    if [ -f "$fuzzing_wordlist_file" ]; then
        echo "Wordlist $fuzzing_wordlist_file already exists, skipping..."
    else
        wget $fuzzing_wordlist_url || { echo "Failed to download $fuzzing_wordlist_url"; exit 1; }
    fi

    pip3 install -r cloudflare-origin-ip/requirements.txt
    for tool in "${TOOLS[@]}"; do
        if pip3 show "$tool" > /dev/null 2>&1; then
            echo "Python tool $tool is already installed, skipping..."
        else
            pip3 install "$tool" || { echo "Failed to install $tool"; exit 1; }
        fi
    done

    apt update || { echo "Failed to update package list"; exit 1; }

    for apt_tool in "${APT_TOOLS[@]}"; do
        if dpkg -l | grep -q "$apt_tool"; then
            echo "System tool $apt_tool is already installed, skipping..."
        else
            apt install -y "$apt_tool" || { echo "Failed to install $apt_tool"; exit 1; }
        fi
    done
    cp admin-panel-finder/.link.txt ../.link.txt
}

# main function of the script
main() {
    clone_repos
    install_tools
}

# EXECUTE
main
