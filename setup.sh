#!/bin/bash

#  ███████╗███████╗████████╗██╗   ██╗██████╗ 
#  ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
#  ███████╗█████╗     ██║   ██║   ██║██████╔╝
#  ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝ 
#  ███████║███████╗   ██║   ╚██████╔╝██║     
#  ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝     

# VARIABLES
sshash_url="https://github.com/Trabbit0ne/SSHash"
hetter_url="https://github.com/TrabbitOne/hetter"
xsstrike_url="https://github.com/TrabbitOne/XSStrike"
admin_finder_url="https://github.com/C4ssif3r/admin-panel-finder"

# installations

function clone_repos() {
    git clone $sshash_url
    git clone $hetter_url
    git clone $xsstrike_url
    git clone $admin_finder_url
}

function install_tools() {
    pip3 install subfinder
    pip3 install wpscan
    pip3 install sqlmap
    pip3 install paramspider
    apt install ffuf -y
    apt install nmap -y
}

# main function
main() {
    clone_repos
    install_tools
}

# call the main function
main
