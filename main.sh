#!/bin/bash

###############################################################################
#                               WARNING                                       #
#           This tool is made for Pentesters and ethical purposes             #
###############################################################################

# ---------------------------------------------------------------------------
# Youtube:        TrabbitOne
# BuyMeACoffee:   trabbit0ne
# Bitcoin:        bc1qehnsx5tdwkulamttzla96dmv82ty9ak8l5yy40
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Bug Bounty / Pentest Tools Framework
# Author:        Trabbit
# Date:          2024-07-18
# ---------------------------------------------------------------------------

# Variables
version="2.0"
author="Trabbit"

# Define text color codes for terminal output
RED='\e[0;31m'       # Text Color: Red
GREEN='\e[0;32m'     # Text Color: Green
YELLOW='\e[0;33m'    # Text Color: Yellow
BLUE='\e[0;34m'      # Text Color: Blue
PURPLE='\e[0;35m'    # Text Color: Purple
CYAN='\e[0;36m'      # Text Color: Cyan
WHITE='\e[1;37m'     # Text Color: Bright White
BLACK='\e[30m'       # Text Color: Black

# Define background color codes for terminal output
BG_RED="\e[1;41m"    # Background Color: Red
BG_GREEN="\e[1;42m"  # Background Color: Green
BG_YELLOW="\e[43m"   # Background Color: Yellow
BG_BLUE="\e[1;44m"   # Background Color: Blue
BG_PURPLE="\e[45m"   # Background Color: Purple
BG_CYAN="\e[0;46m"   # Background Color: Cyan
BG_WHITE='\e[47m'    # Background Color: White

# Define text formatting options
RESET='\e[0m'        # Reset all colors and formatting
BOLD='\e[1m'         # Bold text
UNDERLINE='\e[4m'    # Underlined text

# Function to clear the terminal screen
clear_screen() {
    clear
}

# Function to handle script interruptions (e.g., Ctrl+C).
handle_interrupt() {
    echo -e "\n${CYAN}Scan interrupted! Returning to menu...${RESET}"
}

# Function to clean up before exiting the script.
cleanup() {
    clear
    echo -e "${BG_CYAN}${BLACK}THANKS FOR USING PENTAGONE TOOLKIT FOR PENTESTERS!${RESET}"
    exit 1
}

# Trap SIGINT (Ctrl+C) to trigger the cleanup function.
trap cleanup SIGINT

# Define the YouTube banner command
youtube_banner='echo -e " [ \e]8;;https://www.youtube.com/@TrabbitOne\a YouTube ${RESET}\e]8;;\a ] "'
rumble_banner='" [ \e]8;;https://rumble.com/TrabbitOne\a Rumble ${RESET}\e]8;;\a ] "'
github_banner='" [ \e]8;;https://github.com/Trabbit0ne\a GitHub ${RESET}\e]8;;\a ] "'

# Execute the YouTube banner command and capture output
banner_output=$(eval "$youtube_banner" "$rumble_banner" "$github_banner")

# Function to display the main menu
display_menu() {
    trap '' SIGINT  # Disable Ctrl+C during the main menu
    clear_screen
    echo -e "${YELLOW}                                               ===                                                                            "
    echo -e "${BLUE} ,__  ,___ ,  , ___   .   __,  __  ,  , ,___    ${YELLOW}H${RESET}   Pentesting                                                 "
    echo -e "${BLUE} |__) |__  |\ |  |   /\  / _. /  \ |\ | |__   ${YELLOW}=====${RESET}  Toolkit                                                   "
    echo -e "${BLUE} |    |___ | \|  |  /--\ \__/ \__/ | \| |___   ${YELLOW}|${BG_GREEN})${YELLOW}|${RESET}                                         "
    echo -e "${YELLOW}                                               ${YELLOW}|${BG_GREEN} ${YELLOW}|${RESET}                                       "
    echo -e " ============================================= ${YELLOW}|${BG_GREEN}(${YELLOW}|${RESET} ======================                         "
    echo -e " ${YELLOW}  * * * * *  ${RED}CREATED BY TRABBITONE${YELLOW}  * * * * * |${BG_GREEN} ${YELLOW}|${RESET}                                 "
    echo -e " ============================================= ${YELLOW} V${RESET}  ======================                                             "
    echo -e " $banner_output  ${YELLOW}|${RESET}                                                                                                    "
    echo -e "                                                ${YELLOW}|${RESET}                                                                     "
    echo -e " (${CYAN}1${RESET}). Subdomain Scan (${GREEN}SubFinder${RESET}) - (${CYAN}Subdomain Enumeration Tool${RESET})                          "
    echo -e " (${CYAN}2${RESET}). Directory Fuzzing (${GREEN}FFuf${RESET}) - (${CYAN}Directory Fuzzing & Enumeration${RESET})                       "
    echo -e " (${CYAN}3${RESET}). Network Mapping (${GREEN}Nmap${RESET}) - (${CYAN}Network Mapping Tool${RESET})                                    "
    echo -e " (${CYAN}4${RESET}). XSS Scan (${GREEN}XSStrike${RESET}) - (${CYAN}Cross Site Scripting vulnerability Scanner${RESET})                 "
    echo -e " (${CYAN}5${RESET}). SQLi Scan (${GREEN}Sqlmap${RESET}) - (${CYAN}SQL Injection Vulnerability Scanner${RESET})                         "
    echo -e " (${CYAN}6${RESET}). Wordpress Enumeration Scan (${GREEN}WPenum${RESET}) - (${CYAN}Wordpress Users Enumerator${RESET})                 "
    echo -e " (${CYAN}7${RESET}). Admin-Panel Scan - (${GREEN}Admin Panel Finder${RESET}) - (${CYAN}Find Admin Panel Of Web Servers${RESET})        "
    echo -e " (${CYAN}8${RESET}). SSH & FTP Server Brute-Forcing (${GREEN}SSHash${RESET}) - (${CYAN}SSH/FTP Brute Forcing Tool${RESET})             "
    echo -e " (${CYAN}9${RESET}). HTTP Parameter Scan 1 (${GREEN}Paramspider${RESET}) - (${CYAN}Http Parameter Scanner${RESET})                     "
    echo -e " (${CYAN}10${RESET}). HTTP Parameter Scan 2 (${GREEN}Arjun${RESET}) - (${CYAN}Http Parameter Scanner${RESET})                          "
    echo -e " (${CYAN}11${RESET}). Origin IP Finder (${GREEN}IPF${RESET}) - (${CYAN}IPF - Original Server IP Finder${RESET})                        "
    echo -e " (${CYAN}12${RESET}). IP Address Location Tracking (${GREEN}Loctrac${RESET}) - (${CYAN}IP Address Location Tracker${RESET})            "
    echo -e " (${CYAN}13${RESET}). Google Results Scraper - (${GREEN}GRS${RESET}) - (${CYAN}Google search results links serper/scraper${RESET})     "
    echo -e " (${CYAN}14${RESET}). DDoS Attack - (${GREEN}DDoSer${RESET}) - (${CYAN}Simple DDoS Tool Written In Bash${RESET})                       "
    echo -e " (${CYAN}15${RESET}). Web Screenshot - (${GREEN}Sshot${RESET}) - (${CYAN}Unlimited Web Screenshot Tool${RESET})                        "
    echo -e " (${CYAN}16${RESET}). Password Leak Searcher - (${GREEN}PWDEXT${RESET}) - (${CYAN}Plaintext Password Leakage Searcher${RESET})         "
    echo -e " (${CYAN}18${RESET}). XST Vulnerability Scan - (${GREEN}Crosstracer${RESET}) - (${CYAN}Bash Written XST Vulnerability Scanner${RESET}) "
    echo -e " (${CYAN}17${RESET}). CORS Vulnerability Scan - (${GREEN}Corsica${RESET}) - (${CYAN}Bash Written CORS Vulnerability Scanner${RESET})   "
    echo -e " (${CYAN}19${RESET}). Fast HTTP Scan - (${GREEN}HTTPX${RESET}) - (${CYAN}Fast HTTP Toolkit Written In GO${RESET})                      "
    echo -e " (${CYAN}A${RESET}). About (${CYAN}About Section${RESET})                                                                              "
    echo -e " (${CYAN}O${RESET}). Others (${CYAN}Other Tools${RESET})                                                                               "
    echo -e " (${CYAN}Q${RESET}). QUIT (${CYAN}Quit the software${RESET})                                                                           "
    echo
}

# Function to pause the script and wait for user input.
pause() {
    read -rp "Press Enter To Return To Menu..." temp
}

# Other tools main menu function
other_tools_menu() {
    while true; do
        clear_screen
        echo
        echo -e "(${CYAN}1${RESET}). Domain To IP"
        echo -e "(${CYAN}2${RESET}). HTTP Header Viewer"
        echo -e "(${CYAN}B${RESET}). Back to Main Menu"
        echo -e "(${CYAN}Q${RESET}). Quit"
        echo

        prompt2=$(echo -e "${BLUE}(${YELLOW} Pentagone Toolkit ${BLUE}) - [${GREEN} Other Tools ${BLUE}]${RESET}~${RED}#${RESET} ")
        read -rp "$prompt2" other_tool

        case "$other_tool" in
            1)
                read -rp "Enter Domain: " domain
                clear_screen
                echo -e "${GREEN}Resolving IP for domain: ${domain}${RESET}"
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                dig +short "$domain"
                pause
                ;;
            2)
                read -rp "Enter URL: " url
                clear_screen
                echo -e "${GREEN}Fetching HTTP Headers for: ${url}${RESET}"
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                curl -I "$url"
                pause
                ;;
            [Bb])
                return 0
                ;;
            [Qq])
                cleanup
                ;;
            *)
                echo -e "${RED}Invalid option. Please try again.${RESET}"
                pause
                ;;
        esac
    done
}


# Main function of the script
main() {

    while true; do
        prompt="${BLUE}╭─[${GREEN} V${version} ${BLUE}] ─ (${RED} Select A Tool ${BLUE})\n╰─${YELLOW}# ${RESET}"

        display_menu
        echo -ne "$prompt"
        read -r tool

        case "$tool" in
            1)
                read -rp "Domain: " domain
                clear_screen
                read -p "Output File (y/n)?: " output
                if [[ $output == "y" ]] || [[ $output == "Y" ]]; then
                    read -p "Output File: " output_file
                    clear_screen
                    trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                    echo -e "Scanning for subdomains..."
                    echo -e "--------------------------"
                    subfinder -d "$domain" -silent -o $output_file
                else
                    clear_screen
                    trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                    echo -e "Scanning for subdomains..."
                    subfinder -d "$domain" -silent
                fi
                pause
                ;;
            2)
                read -rp "URL: " url
                read -rp "Wordlist (Default: onelistforallmicro.txt [Press Enter To Use Default One]): " wordlist
                wordlist="${wordlist:-onelistforallmicro.txt}"
                read -rp "-mc (put ',' between all example: 200,404,403): " mcs
                clear_screen
                echo -e "Scanning for files & directories..."
                echo -e "--------------------------"
                if [[ ! $url =~ ^https?:// ]]; then
                    url="https://$url"
                fi
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                ffuf -u "${url}/FUZZ" -w "$wordlist" -mc "$mcs" -s
                pause
                ;;
            3)
                read -rp "Domain: " domain
                read -rp "Arguments (separated by space): " arguments
                clear_screen
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                nmap $arguments "$domain"
                pause
                ;;
            4)
                read -rp "URL: " url
                clear_screen
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
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
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                sqlmap -u "$url" $arguments
                pause
                ;;
            6)
                read -rp "URL: " url
                clear_screen
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                bash WPenum/main.sh $url
                pause
                ;;
            7)
                clear_screen
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                python3 admin-panel-finder/admin-finder.py
                pause
                ;;
            8)
                read -rp "Target: " target
                read -rp "UserList: " user_list
                read -rp "PassList: " wordlist
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                python3 SSHash/sshash.py -t "$target" -u "$user_list" -l "$wordlist"
                pause
                ;;
            9)
                read -rp "Domain: " domain
                clear_screen
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
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
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                arjun -u $url -q
                pause
                ;;
            11)
                read -rp "Domain: " domain
                clear_screen
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                bash IPF/main.sh -d $domain
                pause
                ;;
            12)
                read -rp "[-m/IP]: " argument
                clear_screen
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
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
                        trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                        python3 grs/grs.py -q "$query" -p "$pages" | grep -oP 'https?://\S+' > "$output_file"
                    else
                        clear_screen
                        trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                        python3 grs/grs.py -q "$query" -p "$pages" | grep -oP 'https?://\S+'
                    fi
                else
                    clear_screen
                    trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                    python3 grs/grs.py -q "$query" -p "$pages"
                fi
                pause
                ;;
            14)
                read -rp "Target: " target
                clear_screen
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                bash DDoSer/ddos.sh $target
                pause
                ;;
            15)
                read -rp "URL/Domain: " target
                read -rp "Full Page (y/n)?: " full_screen
                if [[ "$full_screen" == "y" ]] || [[ "$full_screen" == "Y" ]]; then
                    clear_screen
                    trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                    bash Sshot/main.sh -f $target
                else
                    clear_screen
                    trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                    bash Sshot/main.sh $target
                fi
                pause
                ;;
            16)
                read -rp "Query: " query
                clear_screen
                trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                bash PWDEXT/main.sh $query
                pause
                ;;
            17)
                read -rp "[File/URL]?:  " fileurl
                clear_screen
                if [ "$fileurl" == "file" ]; then
                    read -rp "File: " file
                    trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                    bash corsica/main.sh -f $file
                elif [ "$fileurl" == "url" ]; then
                    read -rp "URL: " url
                    trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                    bash corsica/main.sh -u $url
                fi
                pause
                ;;
            18)
                read -rp "[File/URL]?:  " fileurl
                clear_screen
                if [ "$fileurl" == "file" ]; then
                    read -rp "File: " file
                    trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                    bash crosstracer/main.sh -m $file
                elif [ "$fileurl" == "url" ]; then
                    read -rp "URL: " url
                    trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                    bash crosstracer/main.sh $url
                fi
                pause
                ;;
            19)
                read -rp "[File/URL]?:  " fileurl
                clear_screen
                if [ "$fileurl" == "file" ]; then
                    read -rp "File: " file
                    trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                    echo -e "[-sc | HTTP Response]"
                    echo -e "[-td | Server]"
                    echo -e "[-ip | IP Address]"
                    echo -e "[-cl | Content Lenght]"
                    echo -e "[-title | Title]"
                    echo -e "[-ct | Content Type (text/html - application/json)]"
                    echo -e "[-methods | (GET,POST,OPTIONS,DELETE,PUT,TRACE,)]"
                    echo -e "[-timeout | Timeout]"
                    echo
                    read -rp "Arguments: " args
                    clear_screen
                    echo -e "Scanning..."
                    httpx -l $file $args -silent
                elif [ "$fileurl" == "url" ]; then
                    read -rp "URL: " url
                    trap handle_interrupt SIGINT  # Set up trap for sqlmap process
                    echo -e "[-sc | HTTP Response]"
                    echo -e "[-td | Server]"
                    echo -e "[-ip | IP Address]"
                    echo -e "[-cl | Content Lenght]"
                    echo -e "[-title | Title]"
                    echo -e "[-ct | Content Type (text/html - application/json)]"
                    echo -e "[-methods | (GET,POST,OPTIONS,DELETE,PUT,TRACE,)]"
                    echo -e "[-timeout | Timeout]"
                    echo
                    read -rp "Arguments: " args
                    clear_screen
                    echo -e "Scanning..."
                    httpx -u $url $args -silent
                fi
                pause
                ;;
            [Aa])
                clear_screen
                echo
                echo -e "     [ ${BLUE}PENTAGONE TOOLKIT FOR PENTESTERS${RESET} ]                                     "
                echo -e "${YELLOW}*** ${RESET}great power comes great responsibility${YELLOW} ***${RESET}             "
                echo
                echo -e "Author/Creator/Developer: ${GREEN}@Trabbit0ne${RESET}, ${GREEN}@Group-Pentagone${RESET}      "
                echo -e "Creation Date: ${GREEN}2024-07-18 - 22:17${RESET}                                            "
                echo
                echo -e "[${RED}Tools Created By Pentagone Group${RESET}]             "
                echo -e "  * ${CYAN}Loctrac${RESET}                                   "
                echo -e "  * ${CYAN}GRS${RESET}                                       "
                echo -e "  * ${CYAN}SSHash${RESET}                                    "
                echo -e "  * ${CYAN}IPF${RESET}                                       "
                echo -e "  * ${CYAN}DDoSer${RESET}                                    "
                echo -e "  * ${CYAN}WPenum${RESET}                                    "
                echo -e "  * ${CYAN}Corsica${RESET}                                   "
                echo -e "  * ${CYAN}Crosstracer${RESET}                               "
                echo
                echo -e "[${RED}Tools Created By Other${RESET}]                       "
                echo -e "  * ${CYAN}SubFinder${RESET}                                 "
                echo -e "  * ${CYAN}Nmap${RESET}                                      "
                echo -e "  * ${CYAN}Ffuf${RESET}                                      "
                echo -e "  * ${CYAN}XSStrike${RESET}                                  "
                echo -e "  * ${CYAN}SQLmap${RESET}                                    "
                echo -e "  * ${CYAN}ParamSpider${RESET}                               "
                echo -e "  * ${CYAN}Arjun${RESET}                                     "
                echo -e "  * ${CYAN}Admin Panel Finder${RESET}                        "
                echo -e "  * ${CYAN}HTTPX${RESET}                                     "
                echo
                echo
                pause
                ;;
            [Oo])
                clear_screen
                other_tools_menu
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
