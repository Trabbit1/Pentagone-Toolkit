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

# Variables
version="1.8"
author="Trabbit"

# Define color codes
RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m'
BLUE='\e[0;34m'
MAGENTA='\e[0;35m'
CYAN='\e[0;36m'
WHITE='\e[1;37m'
BLACK='\e[30m'
BG_RED="\e[1;41m"
BG_GREEN="\e[42m"
BG_YELLOW="\e[43m"
BG_BLUE="\e[1;44m"
BG_PURPLE="\e[45m"
BG_WHITE='\e[47m'
BG_CYAN="\e[0;46m"
RESET='\e[0m'
BOLD='\e[1m'
UNDERLINE='\e[4m'

# Function to clear the screen
clear_screen() {
    clear
}

cleanup() {
    clear
    echo -e "${BG_CYAN}${BLACK}THANKS FOR USING PENTAGONE TOOLKIT FOR PENTESTERS!${RESET}"
    exit 1
}

# Set up the trap to catch SIGINT (Ctrl+C)
trap cleanup SIGINT

# Define the YouTube banner command
youtube_banner='echo -e " [ \e]8;;https://www.youtube.com/@TrabbitOne\a YouTube ${RESET}\e]8;;\a ] "'
rumble_banner='" [ \e]8;;https://rumble.com/TrabbitOne\a Rumble ${RESET}\e]8;;\a ] "'
github_banner='" [ \e]8;;https://github.com/Trabbit0ne\a GitHub ${RESET}\e]8;;\a ] "'

# Execute the YouTube banner command and capture output
banner_output=$(eval "$youtube_banner" "//" "$rumble_banner" "//" "$github_banner")

# Function to display the menu
display_menu() {
    clear_screen
    echo
    echo -e "                                                ${YELLOW}〒${RESET}  ";
    echo -e "${BLUE} ,__  ,___ ,  , ___   .   __,  __  ,  , ,___   ${YELLOW}===${RESET}  ";
    echo -e "${BLUE} |__) |__  |\ |  |   /\  / _. /  \ |\ | |__     ${YELLOW}〣${RESET}  ";
    echo -e "${BLUE} |    |___ | \|  |  /==\ \__/ \__/ | \| |___    ${YELLOW}〣${RESET}  ";
    echo -e "                                                ${YELLOW}v${RESET}   ";
    echo -e " ============================================== ${YELLOW}|${RESET} ====================== ";
    echo -e "${YELLOW}   * * * * *  ${RED}CREATED BY TRABBITONE${YELLOW}  * * * * *  |${RESET}   ";
    echo -e " ======================================================================= ";
    echo -e "${RESET}"
    echo -e "$banner_output"
    echo
    echo -e " (${CYAN}1${RESET}). Subdomain Scan (${GREEN}SubFinder${RESET}) - (${CYAN}Subdomain Enumeration Tool${RESET})"
    echo -e " (${CYAN}2${RESET}). Directory Fuzzing (${GREEN}FFuf${RESET}) - (${CYAN}Directory Fuzzing & Enumeration${RESET})"
    echo -e " (${CYAN}3${RESET}). Network Mapping (${GREEN}Nmap${RESET}) - (${CYAN}Network Mapping Tool${RESET})"
    echo -e " (${CYAN}4${RESET}). XSS Scan (${GREEN}XSStrike${RESET}) - (${CYAN}Cross Site Scripting vulnerability Scanner${RESET})"
    echo -e " (${CYAN}5${RESET}). SQLi Scan (${GREEN}Sqlmap${RESET}) - (${CYAN}SQL Injection Vulnerability Scanner${RESET})"
    echo -e " (${CYAN}6${RESET}). Wordpress Enumeration Scan (${GREEN}WPenum${RESET}) - (${CYAN}Wordpress Users Enumerator${RESET})"
    echo -e " (${CYAN}7${RESET}). Admin-Panel Scan - (${GREEN}Admin Panel Finder${RESET}) - (${CYAN}Find Admin Panel Of Web Servers${RESET})"
    echo -e " (${CYAN}8${RESET}). SSh & FTP Server Brute-Forcing (${GREEN}SSHash${RESET}) - (${CYAN}SSH/FTP Brute Forcing Tool${RESET})"
    echo -e " (${CYAN}9${RESET}). Parameter Scan 1 (${GREEN}Paramspider${RESET}) - (${CYAN}Http Parameter Scanner${RESET})"
    echo -e " (${CYAN}10${RESET}). Parameter Scan 2 (${GREEN}Arjun${RESET}) - (${CYAN}Http Parameter Scanner${RESET})"
    echo -e " (${CYAN}11${RESET}). Origin IP Finder (${GREEN}IPF${RESET}) - (${CYAN}IPF - Original Server IP Finder${RESET})"
    echo -e " (${CYAN}12${RESET}). IP Address Location Tracking (${GREEN}Loctrac${RESET}) - (${CYAN}IP Address Location Tracker${RESET})"
    echo -e " (${CYAN}13${RESET}). Google Results Scraper - (${GREEN}GRS${RESET}) - (${CYAN}Google search results links serper/scraper${RESET})"
    echo -e " (${CYAN}Q${RESET}). QUIT (${CYAN}Quit the software${RESET})"
    echo
}

# Function to pause and wait for user input
pause() {
    read -rp "Press Enter To Return To Menu..." temp
}

# Main function
main() {

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
                clear_screen
                bash WPenum/main.sh $url
                pause
                ;;
            7)
                clear_screen
                python3 admin-panel-finder/admin-finder.py
                pause
                ;;
            8)
                read -rp "Target: " target
                read -rp "UserList: " user_list
                read -rp "PassList: " wordlist
                python3 SSHash/sshash.py -t "$target" -u "$user_list" -l "$wordlist"
                pause
                ;;
            9)
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
            10)
                read -rp "Url: " url
                clear_screen
                arjun -u $url -q
                pause
                ;;
            11)
                read -rp "Domain: " domain
                clear_screen
                bash IPF/main.sh -d $domain
                pause
                ;;
            12)
                read -rp "[-m/IP]: " argument
                clear_screen
                bash loctrac_textonly/main.sh $argument
                pause
                ;;
            13)
                read -rp "Query: " query
                read -rp "Page(s) [1-5|1,5|5]: " pages
                read -rp "Link Only/extract link (Y/N): " link_only

                if [[ $link_only == "y" || $link_only == "Y" ]]; then
                    read -rp "[Output to file (o)] OR [Display (d)]: " output

                    if [[ $output == "o" || $output == "O" ]]; then
                        read -rp "Output file name: " output_file
                        clear_screen
                        python3 grs/grs.py -q "$query" -p "$pages" | grep -oP 'https?://\S+' > "$output_file"
                    else
                        clear_screen
                        python3 grs/grs.py -q "$query" -p "$pages" | grep -oP 'https?://\S+'
                    fi
                else
                    clear_screen
                    python3 grs/grs.py -q "$query" -p "$pages"
                fi
                pause
                ;;
            [Qq])
                clear_screen
                echo -e "${BG_CYAN}${BLACK}THANKS FOR USING PENTAGONE TOOLKIT FOR PENTESTERS!${RESET}"
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
