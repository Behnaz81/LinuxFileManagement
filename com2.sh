user_name=$(whoami)
directory_name="backups"
mkdir /home/$user_name/Documents/$directory_name
new_command="0 5 * * 1 find /home/$user_name/Documents -type f -name \"*.sh\" | tar -zcf /home/$user_name/Documents/backups/backups.tar.gz -T -"
new_command2="0 5 * * 1 find /home/$user_name/Documents -type f -name \"*.sh\" exec rm -f {} \;"
file_name="commands_file1"
touch "$file_name"
#crontab -l > "$file_name"
echo "$new_command" > "$file_name"
echo "$new_command2" >> "$file_name"
crontab -u "$user_name" -l | cat - "$file_name" | crontab -u "$user_name" -
rm "$file_name"
