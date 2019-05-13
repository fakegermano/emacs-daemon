#!/usr/bin/env zsh
# Checks if there's a frame open
RED="\e[31m"
NC="\e[0m\e[97m"
BOLD="\e[1m"
YELLOW="\e[93m"

CHECK=$(emacsclient -n -e "(if (> (length (frame-list)) 1) 't)" 2> /dev/null)

if [ "$CHECK" = "t" ]; then
    if [ "$1" = "-t" ]; then
        emacsclient -t "${@:2}"
    elif [ "$1" = "-k" ]; then
        echo -e "${RED}${BOLD}Found background daemon running... Killing (no-save)${NC}"
        echo -e "${YELLOW}${BOLD}[WARNING]${NC} All open window frames and terminals will be closed${NC}"
        emacsclient -e '(kill-emacs)'
    elif [ "$1" = "-c" ]; then
        emacsclient -n -q -c "${@:2}" &> /dev/null
    else
        echo -e "${BOLD}${YELLOW}Should be used with: -c [new frame], -k [kill emacs] or -t [terminal]${NC}"
        echo -e "${BOLD}Either use 'e' for terminal (or vi or vim) and 'ec' for a new window frame${NC}"
    fi
else
    if [ "$1" = "-t" ]; then
        emacsclient -t -a '' "${@:2}"
    elif [ "$1" = "-k" ]; then
        echo -e "${RED}${BOLD}Found background daemon running but not frames... Killing (no-save)${NC}"
        echo -e "${YELLOW}${BOLD}[WARNING]${NC} Open terminals will be closed${NC}"
        emacsclient -e '(kill-emacs)'
    elif [ "$1" = "-c" ]; then
        emacsclient -a '' -n -q -c "${@:2}" &> /dev/null
    else
        echo -e "${BOLD}${YELLOW}Should be used with: -c [new frame], -k [kill-emacs] or -t [terminal]${NC}"
        echo -e "${BOLD}Either use 'e' for terminal (or vi or vim) and 'ec' for a new window frame${NC}"
    fi
fi
