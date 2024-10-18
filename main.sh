#!/bin/bash

##########################################################################
# WARNING: This Tool Is Made For Pentesters And Ethical Purposes         #
##########################################################################

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ----------------------------------------
# Youtube: TrabbitOne
# BuyMeACoffee: trabbit0ne
# Bitcoin: bc1qehnsx5tdwkulamttzla96dmv82ty9ak8l5yy40
# ----------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ----------------------------------------
# Bug Bounty/Pentest Tools Framework
# Author: Trabbit
# Date: 2024-07-18
# ----------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define color codes
RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[1;33m'
BLUE='\e[0;34m'
MAGENTA='\e[0;35m'
CYAN='\e[0;36m'
WHITE='\e[1;37m'
BG_RED="\e[41m"
BG_GREEN="\e[42m"
BG_YELLOW="\e[43m"
BG_BLUE="\e[44m"
BG_PURPLE="\e[45m"
RESET='\e[0m'
BOLD='\e[1m'
UNDERLINE='\e[4m'

# Function to clear the screen
clear_screen() {
    clear
}

# Define the YouTube banner command
youtube_banner='echo -e " [ \e]8;;https://www.youtube.com/@trabbitone\a\033[41m ⯈  \033[0m YouTube \e]8;;\a ] "'
rumble_banner='" [ \e]8;;https://rumble.com/TrabbitOne\a   Rumble   \e]8;;\a ] "'

# Execute the YouTube banner command and capture output
banner_output=$(eval "$youtube_banner" "//" "$rumble_banner")

# Function to display the menu
display_menu() {
    clear_screen
    echo -e "${BLUE}"
    echo "██████╗ ███████╗███╗   ██╗████████╗ █████╗  ██████╗  ██████╗ ███╗   ██╗███████╗";
    echo "██╔══██╗██╔════╝████╗  ██║╚══██╔══╝██╔══██╗██╔════╝ ██╔═══██╗████╗  ██║██╔════╝";
    echo "██████╔╝█████╗  ██╔██╗ ██║   ██║   ███████║██║  ███╗██║   ██║██╔██╗ ██║█████╗  ";
    echo "██╔═══╝ ██╔══╝  ██║╚██╗██║   ██║   ██╔══██║██║   ██║██║   ██║██║╚██╗██║██╔══╝  ";
    echo "██║     ███████╗██║ ╚████║   ██║   ██║  ██║╚██████╔╝╚██████╔╝██║ ╚████║███████╗";
    echo "╚═╝     ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝";
    echo -e "${RESET}"
    echo -e "                                                  ${MAGENTA}Created By ${BG_PURPLE}${WHITE} Pentagone Group ${RESET}"
    echo "_______________________________________________________________________________"
    echo
    echo -e "$banner_output"
    echo "_______________________________________________________________________________"
    echo
    echo -e " - [${CYAN}1${RESET}]. Subdomain Scan (${GREEN}SubFinder${RESET}) - (${CYAN}Subdomain Enumeration Tool${RESET})"
    echo -e " - [${CYAN}2${RESET}]. Directory Fuzzing (${GREEN}FFuf${RESET}) - (${CYAN}Directory Fuzzing & Enumeration${RESET})"
    echo -e " - [${CYAN}3${RESET}]. Network Mapping (${GREEN}Nmap${RESET}) - (${CYAN}Network Mapping Tool${RESET})"
    echo -e " - [${CYAN}4${RESET}]. XSS Scan (${GREEN}XSStrike${RESET}) - (${CYAN}Cross Site Scripting Scanner${RESET})"
    echo -e " - [${CYAN}5${RESET}]. SQLi Scan (${GREEN}Sqlmap${RESET}) - (${CYAN}SQLi Vulnerability Scanner${RESET})"
    echo -e " - [${CYAN}6${RESET}]. Wordpress User Enumeration (${GREEN}wpscan${RESET}) - (${CYAN}Wordpress Multi-Usage Scanner${RESET})"
    echo -e " - [${CYAN}7${RESET}]. Admin Panel Finder - (${CYAN}Admin Panel Finder${RESET})"
    echo -e " - [${CYAN}8${RESET}]. Dorking Automation (${GREEN}Hetter${RESET}) - (${CYAN}Dorking & Google Search SERP${RESET})"
    echo -e " - [${CYAN}9${RESET}]. SShash (${GREEN}SSHash${RESET}) - (${CYAN}SSH/FTP Brute Forcing Tool${RESET})"
    echo -e " - [${CYAN}10${RESET}]. Http Parameter Finder (${GREEN}Paramspider${RESET}) - (${CYAN}Http Parameter Scan${RESET}) [1]"
    echo -e " - [${CYAN}11${RESET}]. Http Parameter Finder (${GREEN}Arjun${RESET}) - (${CYAN}Http Parameter Scan${RESET}) [2]"
    echo -e " - [${CYAN}12${RESET}]. Original Server IP Finder (${GREEN}Cloudflare-Origin-IP${RESET}) - (${CYAN}Original Server IP Finder${RESET})"
    echo -e " - [${CYAN}Q${RESET}]. QUIT (${GREEN}Quit the software${RESET})"
    echo
}

# Function to pause and wait for user input
pause() {
    read -rp "Press Enter To Return To Menu..." temp
}

# Main function
main() {
    version="1.6"

    while true; do
        prompt="${BLUE}╭─[${GREEN} V${version} ${BLUE}] ─ (${RED} Select A Tool ${BLUE})
╰─${YELLOW}# ${RESET}"
# ${BLUE}${RED}~${GREEN}# ${RESET}"

        display_menu
        echo -ne "$prompt"
        read -r tool

        case "$tool" in
            1)
                read -rp "Domain: " domain
                clear_screen
                subfinder -d "$domain"
                pause
                ;;
            2)
                read -rp "URL: " url
                read -rp "Wordlist: " wordlist
                read -rp "-mc (put ',' between all example: 200,404,403): " mcs
                clear_screen
                ffuf -u "${url}/FUZZ" -w "$wordlist" -mc "$mcs"
                pause
                ;;
            3)
                read -rp "Domain: " domain
                read -rp "Arguments (separated by space): " arguments
                clear_screen
                nmap $arguments "$domain"
                pause
                ;;
            4)
                read -rp "URL: " url
                clear_screen
                python3 XSStrike/xsstrike.py -u "$url"
                pause
                ;;
            5)
                read -rp "URL: " url
                read -rp "Arguments (default: '--tamper=space2comment --level 4 --risk 3 -v 3 -t 3 --dbs'): " arguments
                read -rp "Automate the process (y/n)?: " auto
                if [[ "$auto" == "y" ]]; then
                    arguments="$arguments --batch"
                fi
                if [[ -z "$arguments" ]]; then
                    arguments="--tamper=space2comment --level 4 --risk 3 -v 3 -t 3 --dbs"
                fi
                clear_screen
                sqlmap -u "$url" $arguments
                pause
                ;;
            6)
                read -rp "URL: " url
                echo "Enumeration Types:"
                echo "- [u] (users)"
                echo "- [m] (medias)"
                echo "- [vp] (vulnerable plugins)"
                echo "- [vt] (vulnerable themes)"
                echo "- [p] (popular plugins)"
                echo "- [at] (all themes)"
                echo "- [cb] (config backups)"
                echo "- [dbe] (DB exports)"
                echo "- [tt] (Timthumbs)"
                echo "- [ap] (all plugins)"
                echo
                read -rp "Enumeration Type: " enum_type
                clear_screen
                wpscan --url "$url" --enumerate "$enum_type" --random-user-agent --ignore-main-redirect
                pause
                ;;
            7)
                clear_screen
                python3 admin-panel-finder/admin-finder.py
                pause
                ;;
            8)
                clear_screen
                python3 hetter/hetter.py
                read -rp "Display output file content (y/n)?: " yorn
                if [[ "$yorn" == "y" ]]; then
                    read -rp "Outputted file: " outputfilename
                    clear_screen
                    cat "$outputfilename"
                fi
                pause
                ;;
            9)
                read -rp "Target: " target
                read -rp "UserList: " user_list
                read -rp "PassList: " wordlist
                python3 SSHash/sshash.py -t "$target" -u "$user_list" -l "$wordlist"
                pause
                ;;
            10)
                read -rp "Domain: " domain
                clear_screen
                paramspider -d "$domain"
                read -rp "Display Results (y/n)?: " display_output
                if [[ "$display_output" == "y" ]]; then
                    clear_screen
                    cat "results/${domain}.txt"
                fi
                pause
                ;;
            11)
                read -rp "Url: " url
                clear_screen
                arjun -u $url -q
                pause
                ;;
            12)
                read -rp "Url: " url
                clear_screen
                python3 cloudflare-origin-ip/cloudflare-origin-ip.py -u $url
                pause
                ;;
            [Qq])
                clear_screen
                echo -e "${BG_BLUE}THANKS FOR USING PENTAGONE TOOLKIT${RESET}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid option. Please try again.${RESET}"
                pause
                ;;
        esac
    done
}

# Run the main function
main
