# cd $1

BOLD=$(tput bold)

GREEN='\033[0;32m'
RED='\033[0;31m'

for branch in $(git branch --format='%(refname:short)');
do	
    if [ "$branch" != "master" ]; then
        printf "$RED$BOLD Delete branch $branch? "
        read -r -p "[y/N] " response

        if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
            printf "$GREEN --- $(git branch -D $branch)\n"
        fi
    fi
done