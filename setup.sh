#!/usr/bin/env bash

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

# GITHUB REPOSITORIES TO CLONE
REPOS=(
    "https://github.com/Trabbit0ne/SSHash"
    "https://github.com/TrabbitOne/XSStrike"
    "https://github.com/Trabbit0ne/grs"
    "https://github.com/C4ssif3r/admin-panel-finder"
    "https://github.com/Trabbit0ne/loctrac_textonly"
    "https://github.com/Trabbit0ne/IPF"
    "https://github.com/Trabbit0ne/WPenum"
    "https://github.com/Trabbit0ne/DDoSer"
)

# PIP3 TOOLS TO INSTALL
TOOLS=(
    "sqlmap"
    "arjun"
)

# APT TOOLS TO INSTALL
APT_TOOLS=(
    "ffuf"
    "nmap"
)

# FUNCTIONS

# Clone GitHub repositories
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

# Install pip tools and download fuzzing wordlist
install_tools() {
    if [ ! -f "$fuzzing_wordlist_file" ]; then
        wget "$fuzzing_wordlist_url" || { echo "Failed to download $fuzzing_wordlist_url"; exit 1; }
    else
        echo "Wordlist $fuzzing_wordlist_file already exists, skipping..."
    fi

    # Install Python tools
    for tool in "${TOOLS[@]}"; do
        if pip3 show "$tool" > /dev/null 2>&1; then
            echo "Python tool $tool is already installed, skipping..."
        else
            pip3 install "$tool" > /dev/null 2>&1 || { echo "Failed to install $tool"; }
        fi
    done

    # Update package list and install APT tools
    apt update || { echo "Failed to update package list"; exit 1; }
    for apt_tool in "${APT_TOOLS[@]}"; do
        if apt -l | grep -q "$apt_tool"; then
            echo "System tool $apt_tool is already installed, skipping..."
        else
            apt install -y "$apt_tool" || { echo "Failed to install $apt_tool"; }
        fi
    done
}

# Main execution function
main() {
    clone_repos
    cp admin-panel-finder/.link.txt . || { echo "Failed to copy .link.txt"; exit 1; }
    install_tools

    # Download and set up subfinder
    wget "https://github.com/projectdiscovery/subfinder/releases/download/v2.6.7/subfinder_2.6.7_linux_amd64.zip"
    unzip subfinder_2.6.7_linux_amd64.zip
    cp subfinder "$(dirname "$(command -v bash)")/subfinder" || { echo "Failed to move subfinder"; exit 1; }
    chmod +x "$(dirname "$(command -v bash)")/subfinder" || { echo "Failed to set executable permission on subfinder"; exit 1; }
}

# EXECUTE
main
