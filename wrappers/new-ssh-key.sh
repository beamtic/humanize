printf "\n  Type your e-mail:\n\n"
read email

location=~/.ssh/

printf "\n  Type the name of your key below. The key will be stored in: \"$location[key_name]\" \n"
printf "  "$location"id_rsa will be used as default if you hit enter:\n\n"
read keyname

# Set the keyname
if [ "$keyname" = "" ]
then
  keyname="id_rsa"
fi
# Set the file path
filepath="$location$keyname"

ssh-keygen -t rsa -b 4096 -C "$email" -f "$filepath"

# Start the ssh-agent
eval "$(ssh-agent -s)"

# Try the add the ssh key
printf "\n\n  Attempting to add key $filepath...\n\n"

ssh-add "$filepath"