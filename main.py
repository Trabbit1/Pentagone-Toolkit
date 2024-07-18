
 ##################################################################
 # WARNING: This Tool Is Made For Pentesters And Ethical Purposes #
 ##################################################################

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ----------------------------------------
# Youtube: TrabbitOne
# BuyMeACoffee: trabbit0ne
# Bitcoin: bc1qehnsx5tdwkulamttzla96dmv82ty9ak8l5yy40
# ----------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ----------------------------------------
# Bug Bounty/Pentest Tools Framework
# Author: Trabbit
# Date: 2024-07-18
# ----------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#!/usr/bin/env python3

import os
import subprocess

def clear_screen():
    os.system('clear')

# accounts variables
youtube = "https://www.youtube.com/@trabbitone"
discord = "Coming Soon..."


def display_menu():
    clear_screen()
    print("\033[34m                             dP                                        ")
    print("                             88                                                ")
    print("88d888b. .d8888b. 88d888b. d8888P .d8888b. .d8888b. .d8888b. 88d888b. .d8888b. ")
    print("88'  '88 88ooood8 88'  '88   88   88'  '88 88'  '88 88'  '88 88'  '88 88ooood8 ")
    print("88.  .88 88.  ... 88    88   88   88.  .88 88.  .88 88.  .88 88    88 88.  ... ")
    print("88Y888P' '88888P' dP    dP   dP   '88888P8 '8888P88 '88888P' dP    dP '88888P' ")
    print("88                                              .88                            ")
    print("\033[34mdP                                          d8888P                     \033[0m")
    print("\033[36m                                                   Created By Pentagone Group  \033[0m")
    print("_______________________________________________________________________________")
    print()
    print(" - [\033[47;30mYou\033[41;37mTube\033[0m] \033[33m", youtube, "\033[0m")
    print(" - [\033[46mDiscord\033[0m] \033[33m", discord, "\033[0m")
    print("_______________________________________________________________________________")
    print()
    print(" - [\033[36m1\033[0m]. Subdomain Scan (\033[32mSubFinder\033[0m)")
    print(" - [\033[36m2\033[0m]. Directory Fuzzing (\033[32mFFuf\033[0m)")
    print(" - [\033[36m3\033[0m]. Mapping (\033[32mNmap\033[0m)")
    print(" - [\033[36m4\033[0m]. XSS Scan (\033[32mXSStrike\033[0m)")
    print(" - [\033[36m5\033[0m]. SQLi Scan (\033[32mSqlmap\033[0m)")
    print(" - [\033[36m6\033[0m]. Wordpress User Enumeration (\033[32mwpscan\033[0m)")
    print(" - [\033[36m7\033[0m]. Admin Panel Finder")
    print(" - [\033[36m8\033[0m]. Dorking Automation (\033[32mHetter\033[0m)")
    print(" - [\033[36m9\033[0m]. SShash (\033[32mSSHash\033[0m)")
    print()

def main():
    while True:
        display_menu()

        prompt = "\033[34m[\033[33m pentagone \033[34m]\033[32m>>> \033[0m "
        tool = input(prompt).strip()

        if tool == '1':
            domain = input("Domain: ").strip()
            clear_screen()
            subprocess.run(["subfinder", "-d", domain])
            input("Press Enter To Return To Menu...")

        elif tool == '2':
            url = input("URL: ").strip()
            wordlist = input("Wordlist: ").strip()
            mcs = input("-mc (put ',' between all example: 200,404,403): ").strip()
            clear_screen()
            subprocess.run(["ffuf", "-u", f"{url}/FUZZ", "-w", wordlist, "-mc", mcs])
            input("Press Enter To Return To Menu...")

        elif tool == '3':
            domain = input("Domain: ").strip()
            arguments = input("Arguments: ").strip()
            clear_screen()
            subprocess.run(["nmap", *arguments.split(), domain])
            input("Press Enter To Return To Menu...")

        elif tool == '4':
            url = input("URL: ").strip()
            clear_screen()
            subprocess.run(["python3", "XSStrike/xsstrike.py", "-u", url])
            input("Press Enter To Return To Menu...")

        elif tool == '5':
            url = input("URL: ").strip()
            arguments = input("Arguments (default: '--tamper=space2comment --level 4 --risk 3 -v 3 -t 3 --dbs'): ").strip()
            if not arguments:
                arguments = "--tamper=space2comment --level 4 --risk 3 -v 3 -t 3 --dbs"
            clear_screen()
            subprocess.run(["sqlmap", "-u", url] + arguments.split())
            input("Press Enter To Return To Menu...")

        elif tool == '6':
            url = input("URL: ").strip()
            print("Enumeration Types:")
            print("- [u] (users)")
            print("- [m] (medias)")
            print("- [vp] (vulnerable plugins)")
            print("- [vt] (vulnerable themes)")
            print("- [p] (popular plugins)")
            print("- [at] (all themes)")
            print("- [cb] (config backups)")
            print("- [dbe] (DB exports)")
            print("- [tt] (Timthumbs)")
            print("- [ap] (all plugins)")
            print()
            enum_type = input("Enumeration Type: ").strip()
            clear_screen()
            subprocess.run(["wpscan", "--url", url, "--enumerate", enum_type, "--random-user-agent"])
            input("Press Enter To Return To Menu...")

        elif tool == '7':
            clear_screen()
            home = os.environ['HOME']
            subprocess.run(["python3", f"Admin-Finder/main.py"])
            input("Press Enter To Return To Menu...")

        elif tool == '8':
            clear_screen()
            home = os.environ['HOME']
            subprocess.run(["python3", f"{home}/pentagone/hetter/hetter.py"])
            input("Press Enter To Return To Menu...")

        elif tool == '9':
            clear_screen()
            target = input("Target: ")
            user_list = input("UserList: ")
            wordlist = input("PassList: ")
            subprocess.run(["python3", "SSHash/sshash.py", "-t", target, "-u", user_list, "-l", wordlist])
            input("Press Enter To Return To Menu...")

        else:
            print("Invalid option. Please try again.")
            input("Press Enter To Return To Menu...")

if __name__ == "__main__":
    main()
