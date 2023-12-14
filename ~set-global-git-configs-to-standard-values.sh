#!/bin/bash
#=======================================================================================================================
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#=======================================================================================================================
#
#  NAME: ~set-global-git-configs-to-standard-values.sh
#  AUTHOR(S): Joshua Brogan (JTB023) and Katamdora Balusu (KXB092)
#
#  PURPOSE: This script will set the global Git variable configurations to their standard project values.
#
#=======================================================================================================================
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#=======================================================================================================================

# Uncomment the following line to debug this script
#set -x

#===================================================================================================
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#===================================================================================================
# DATA SETUP: Declare color constants, color styles, and script variables

# Declare color constants
# Background(BG)/Foreground(FG) Defaults
BG_DEFAULT='\e[49m';
FG_DEFAULT='\e[0m';

# Background Regular     # BG Light Regular
BG_BLACK='\e[40m';       BG_L_BLACK='\e[0;100m';
BG_RED='\e[41m';         BG_L_RED='\e[0;101m';
BG_GREEN='\e[42m';       BG_L_GREEN='\e[0;102m';
BG_YELLOW='\e[43m';      BG_L_YELLOW='\e[0;103m';
BG_BLUE='\e[44m';        BG_L_BLUE='\e[0;104m';
BG_PURPLE='\e[45m';      BG_L_PURPLE='\e[0;105m';
BG_CYAN='\e[46m';        BG_L_CYAN='\e[0;106m';
BG_WHITE='\e[47m';       BG_L_WHITE='\e[0;107m';

# Foreground Regular     # Foreground Bold         # Foreground Dim          # Foreground Underline
FG_BLACK='\e[0;30m';     FG_B_BLACK='\e[1;30m';    FG_D_BLACK='\e[2;30m';    FG_U_BLACK='\e[4;30m';
FG_RED='\e[0;31m';       FG_B_RED='\e[1;31m';      FG_D_RED='\e[2;31m';      FG_U_RED='\e[4;31m';
FG_GREEN='\e[0;32m';     FG_B_GREEN='\e[1;32m';    FG_D_GREEN='\e[2;32m';    FG_U_GREEN='\e[4;32m';
FG_YELLOW='\e[0;33m';    FG_B_YELLOW='\e[1;33m';   FG_D_YELLOW='\e[2;33m';   FG_U_YELLOW='\e[4;33m';
FG_BLUE='\e[0;34m';      FG_B_BLUE='\e[1;34m';     FG_D_BLUE='\e[2;34m';     FG_U_BLUE='\e[4;34m';
FG_PURPLE='\e[0;35m';    FG_B_PURPLE='\e[1;35m';   FG_D_PURPLE='\e[2;35m';   FG_U_PURPLE='\e[4;35m';
FG_CYAN='\e[0;36m';      FG_B_CYAN='\e[1;36m';     FG_D_CYAN='\e[2;36m';     FG_U_CYAN='\e[4;36m';
FG_WHITE='\e[0;37m';     FG_B_WHITE='\e[1;37m';    FG_D_WHITE='\e[2;37m';    FG_U_WHITE='\e[4;37m';

# FG Light Regular       # FG Light Bold           # FG Light Dim            # FG Light Underline
FG_L_BLACK='\e[0;90m';   FG_LB_BLACK='\e[1;90m';   FG_LD_BLACK='\e[2;90m';   FG_LU_BLACK='\e[4;90m';
FG_L_RED='\e[0;91m';     FG_LB_RED='\e[1;91m';     FG_LD_RED='\e[2;91m';     FG_LU_RED='\e[4;91m';
FG_L_GREEN='\e[0;92m';   FG_LB_GREEN='\e[1;92m';   FG_LD_GREEN='\e[2;92m';   FG_LU_GREEN='\e[4;92m';
FG_L_YELLOW='\e[0;93m';  FG_LB_YELLOW='\e[1;93m';  FG_LD_YELLOW='\e[2;93m';  FG_LU_YELLOW='\e[4;93m';
FG_L_BLUE='\e[0;94m';    FG_LB_BLUE='\e[1;94m';    FG_LD_BLUE='\e[2;94m';    FG_LU_BLUE='\e[4;94m';
FG_L_PURPLE='\e[0;95m';  FG_LB_PURPLE='\e[1;95m';  FG_LD_PURPLE='\e[2;95m';  FG_LU_PURPLE='\e[4;95m';
FG_L_CYAN='\e[0;96m';    FG_LB_CYAN='\e[1;96m';    FG_LD_CYAN='\e[2;96m';    FG_LU_CYAN='\e[4;96m';
FG_L_WHITE='\e[0;97m';   FG_LB_WHITE='\e[1;97m';   FG_LD_WHITE='\e[2;97m';   FG_LU_WHITE='\e[4;97m';

# Declare color styles
DEFAULT_BG_FG="${BG_DEFAULT}${FG_DEFAULT}"
FILE_HEADER_BG_FG="${BG_L_BLACK}${FG_LD_WHITE}"
STAGE_HEADER_BG_FG="${BG_L_BLACK}${FG_B_WHITE}"
STAGE_NUMBER_BG_FG="${BG_L_BLACK}${FG_LB_RED}"

# Declare script variables
# None to declare yet!

#===================================================================================================
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#===================================================================================================
# BEGIN SCRIPT: Display the informational header block

echo -e ""
echo -e "${FG_L_WHITE}====================================================================================================${DEFAULT_BG_FG}"
echo -e "${FILE_HEADER_BG_FG}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\${DEFAULT_BG_FG}"
echo -e "${FG_D_WHITE}====================================================================================================${DEFAULT_BG_FG}"
echo -e ""
echo -e "${FG_L_WHITE}NAME${FG_D_WHITE} -------> ${FG_L_GREEN}~set-global-git-configs-to-standard-values.sh${DEFAULT_BG_FG}"
echo -e "${FG_L_WHITE}AUTHOR(S)${FG_D_WHITE} --> ${DEFAULT_BG_FG}Joshua Brogan (JTB023) and Katamdora Balusu (KXB092)"
echo -e "${FG_L_WHITE}PURPOSE${FG_D_WHITE} ----> ${DEFAULT_BG_FG}This script will set the global Git variable configurations to their standard project values."
echo -e ""
echo -e "${FG_D_WHITE}====================================================================================================${DEFAULT_BG_FG}"
echo -e "${FILE_HEADER_BG_FG}////////////////////////////////////////////////////////////////////////////////////////////////////${DEFAULT_BG_FG}"
echo -e "${FG_L_WHITE}====================================================================================================${DEFAULT_BG_FG}"

#===================================================================================================
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#===================================================================================================
# STAGE 01: Set the global Git variable configs to their standard project values

echo -e ""
echo -e "${FG_D_WHITE}====================================================================================================${DEFAULT_BG_FG}"
echo -e "${STAGE_HEADER_BG_FG}## ${STAGE_NUMBER_BG_FG}(1/8)${STAGE_HEADER_BG_FG} Setting the global Git variable configs to their standard project values ...               ${DEFAULT_BG_FG}"
echo -e "${FG_D_WHITE}====================================================================================================${DEFAULT_BG_FG}"
echo -e ""
echo -e "${FG_L_CYAN}*** INFO ***${FG_L_WHITE} Executing command {${FG_L_YELLOW}git config --global pull.rebase true${FG_L_WHITE}}${DEFAULT_BG_FG}"
git config --global pull.rebase true

#===================================================================================================
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#===================================================================================================
# END SCRIPT: Notify the user that all Git variable configurations were completed successfully

echo -e ""
echo -e "${FG_D_WHITE}====================================================================================================${DEFAULT_BG_FG}"
echo -e "${STAGE_HEADER_BG_FG}## ${STAGE_NUMBER_BG_FG}(RESULT)${STAGE_HEADER_BG_FG} All Git variable configurations were completed successfully!                            ${DEFAULT_BG_FG}"
echo -e "${FG_D_WHITE}====================================================================================================${DEFAULT_BG_FG}"
echo -e ""