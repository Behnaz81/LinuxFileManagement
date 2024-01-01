chmod +x com1.sh
chmod +x com2.sh
chmod +x com3.sh
chmod +x com4.sh
chmod +x com5.sh

echo "1. Monitoring files and directories"
echo "2. Scheduling using Cron"
echo "3. Users management"
echo "4. Process management"
echo "5. Complex commands manual"

read -p "Choose an action: " action

if [ $action == "1" ]
then
	echo "To cancle the action use ^C"
	./com1.sh
elif [ $action == "2" ]
then
	./com2.sh
elif [ $action == "3" ]
then
	while true
	do
		echo "1. Add a user"
		echo "2. Delete a user"
		echo "3. Add a group"
		echo "4. Delete a group"
		echo "5. Show all existing users"
		echo "6. Show all existing groups"
		echo "7. Change a file's mod"
		echo "8. Add a user to a group"
		echo "9. Exit"

		read -p "Choose an action:" choice

		if [ $choice == "1" ]
		then
			read -p "Enter the new user's username: " newusername
			./com3.sh adduser $newusername
		elif [ $choice == "2" ]
		then
			read -p "Enter the username to delete: " deleteusername
			./com3.sh deleteuser $deleteusername
		elif [ $choice == "3" ]
		then
			read -p "Enter the new group's name: " newgroup
			./com3.sh addgroup $newgroup
		elif [ $choice == "4" ]
		then
			read -p "Enter the group's name to delete: " deletegroup
			./com3.sh deletegroup $deletegroup
		elif [ $choice == "5" ]
		then
			./com3.sh showusers
		elif [ $choice == "6" ]
		then
			./com3.sh showgroups
		elif [ $choice == "7" ]
		then
			read -p "Enter the mod: " filemod
			read -p "Enter file name: " filename
			./com3.sh changefilemod $filemod $filename
		elif [ $choice == "8" ]
		then
			read -p "Enter the user name: " user
			read -p "Enter the group name: " group
			./com3.sh addusertogroup $user $group
		elif [ $choice == "9" ]
		then
			break
		else
			echo "Invalid input!"
		fi
	done
elif [ $action == "4" ]
then
	./com4.sh
elif [ $action == "5" ]
then
	while true
	do
		echo "1. awk"
		echo "2. sed"
		echo "3. grep"
		echo "4. Exit"

		read -p "Choose a command: " com

		if [ $com == "1" ]
		then
			./com5.sh awk
		elif [ $com == "2" ]
		then
			./com5.sh sed
		elif [ $com == "3" ]
		then
			./com5.sj grep
		elif [ $com == "4" ]
		then
			break
		else
			echo "Invalid input!"
		fi
	done
else
	echo "Invalid input!"
fi
