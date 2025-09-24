#!/bin/bash

clear

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$SCRIPT_DIR"

colored_text() {
    local text="$1"
    local color="$2"
    case $color in
        red) echo -e "${FG_RED}m${text}${RESET_ALL}" ;;
        green) echo -e "${FG_GREEN}m${text}${RESET_ALL}" ;;
        yellow) echo -e "${FG_YELLOW}m${text}${RESET_ALL}" ;;
        blue) echo -e "${FG_BLUE}m${text}${RESET_ALL}" ;;
        magenta) echo -e "${FG_MAGENTA}m${text}${RESET_ALL}" ;;
        cyan) echo -e "${FG_CYAN}m${text}${RESET_ALL}" ;;
        white) echo -e "${FG_WHITE}m${text}${RESET_ALL}" ;;
        *) echo "$text" ;;
    esac
}