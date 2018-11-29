#!/bin/bash
#=======================================================================================================================
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#=======================================================================================================================
#
#  NAME: update-local-master-from-upstream.sh
#  AUTHOR(S): Joshua Thomas Brogan
#
#  PURPOSE: Use this script to update the local master branch with the latest changes from the upstream repository.
#
#=======================================================================================================================
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#=======================================================================================================================

# Uncomment the following line to debug this script
#set -x

# Declare color constants
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

# Display the informational header
echo -e ""
echo -e "=============================================================================================================="
echo -e "Executing branch update script: ${FG_LU_GREEN}update-local-master-from-upstream.sh${FG_DEFAULT}"
echo -e "=============================================================================================================="

# Verify that the current branch does not have any modified files
echo -e ""
echo -e "=============================================================================================================="
echo -e "Verifying that the current branch does not have any modified files..."
echo -e "=============================================================================================================="
echo -e ""
git status
files=$(git status --porcelain --untracked-files=no)
if [[ $? != 0 ]]; then
	echo -e ""
	echo -e "${FG_L_RED}*** ERROR *** File verification command did not execute successfully.${FG_DEFAULT}"
	exit 1
elif [[ $files ]]; then
	echo -e ""
	echo -e "${FG_L_RED}*** ERROR *** Please commit or revert the modified files and try running the script again.${FG_DEFAULT}"
	exit 1
else
	echo -e ""
	echo -e "*** INFO *** The current branch does not have any modified files. You are clear to proceed."
fi

# Fetch the latest from upstream
echo -e ""
echo -e "=============================================================================================================="
echo -e "Fetching the latest from upstream..."
echo -e "=============================================================================================================="
echo -e ""
echo -e "*** INFO *** Executing command {${FG_L_YELLOW}git fetch upstream${FG_DEFAULT}}"
git fetch upstream

# Prune excess branches from upstream
echo -e ""
echo -e "=============================================================================================================="
echo -e "Pruning excess branches from upstream..."
echo -e "=============================================================================================================="
echo -e ""
echo -e "*** INFO *** Executing command {${FG_L_YELLOW}git remote prune upstream${FG_DEFAULT}}"
git remote prune upstream

# Merge in the latest code changes from upstream/master
echo -e ""
echo -e "=============================================================================================================="
echo -e "Merging in the latest code changes from upstream/master..."
echo -e "=============================================================================================================="
echo -e ""
echo -e "*** INFO *** Executing command {${FG_L_YELLOW}git branch master origin/master${FG_DEFAULT}}"
git branch master origin/master
echo -e ""
echo -e "*** INFO *** Executing command {${FG_L_YELLOW}git checkout master${FG_DEFAULT}}"
git checkout master
echo -e ""
echo -e "*** INFO *** Executing command {${FG_L_YELLOW}git merge upstream/master${FG_DEFAULT}}"
git merge upstream/master

# Perform garbage collection on the local repository
echo -e ""
echo -e "=============================================================================================================="
echo -e "Performing garbage collection on the local repository..."
echo -e "=============================================================================================================="
echo -e ""
echo -e "*** INFO *** Executing command {${FG_L_YELLOW}git gc${FG_DEFAULT}}"
git gc

# Show the latest refs from upstream
echo -e ""
echo -e "=============================================================================================================="
echo -e "Showing the latest refs from upstream..."
echo -e "=============================================================================================================="
echo -e ""
echo -e "*** INFO *** Executing command {${FG_L_YELLOW}git remote show upstream${FG_DEFAULT}}"
git remote show upstream

# Notify the user that all branch updates were completed successfully
echo -e ""
echo -e "=============================================================================================================="
echo -e "All branch updates were completed successfully."
echo -e "=============================================================================================================="
echo -e ""