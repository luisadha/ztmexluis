#!/usr/bin/bash

banner='[LUIS-TOOLBOX]'
warn='[warning]'
fail='[failure]'
succ='[success]'

cd $PWD/script/interactive

PS3="Your choice: "

files="$(ls -rt .)"
#echo -e ""
#echo ""
#echo 
printf %"$(tput cols)"s | tr " " "-"
#echo "-------------------------------------------"
echo " Luis User Interactive Script a.k.a LUIS Toolbox"
echo " version : v1.2.1"
#echo "-------------------------------------------"
printf %"$(tput cols)"s | tr " " "-"
echo -e "\nRun script as interactively from repository\nWiki bahasa : <https://telegra.ph/Apa-itu-Ztmexluis-03-02>
help translate you can send to mail: <adharudin14@gmail.com>"
printf %"$(tput cols)"s | tr " " "-"

select filename in ${files} "Add repository" "Fix issue if any" Exit;
do
[[ -n $filename ]] || { echo "$warn :What's that? Please try again." >&2; continue; }
 
  case ${filename} in
    "Exit")
      echo "Exiting.."
      break
      ;;
      "Fix issue if any")
      echo -e "Fixing the HISTSIZE BAD NUMBER issue..."
      sleep 0.5
      unset HISTSIZE
     # echo -e "Fixing the REQUIRED FILE NOT FOUND issue..."
     # sleep 0.5
      echo -ne "...Done!\n"
      ;;
    "Add repository")
      echo "$banner : Paste your repository link below :"
      read REPO_LINK
       if timeout 10s ping -c 1 google.com &> /dev/null; then
         if [ -z $REPO_LINK ]; then
           echo "$warn : Broken link."
           exit 1
         fi
         REPO_FOLDER=$(basename "$REPO_LINK" .git)
         if git clone "$REPO_LINK.git" "$REPO_FOLDER"; then
         echo "$succ : Repo's was completly cloned, please refresh!"
       else
         echo "$fail : Unable to clone the repository, please correct the names. "
         exit 1
         fi
       else
           echo "$fail : Couldn't connected to internet!, Abort."

           break
        fi
      break
      ;;
    *)
    	echo "You selected $filename ($REPLY)"
    echo
      chmod +x ${filename}/${filename,,}.sh
      # termux-fix-shebang ${filename}/${filename,,}.sh 
      ./${filename}/${filename,,}.sh   
    echo
     read -t 0.1
     continue
     ;;
  esac
done

