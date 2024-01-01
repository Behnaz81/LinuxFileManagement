if [ $1 == "adduser" ]
then
	sudo adduser $2
	echo "user was successfully added"
elif [ $1 == "deleteuser" ]
then
	echo "The user will be completely deleted. Are you sure?(y/n)"
	read choice
	if [ $choice == "y" ]
	then
		cd /home
		sudo userdel $2 
		sudo rm -rf $2
		echo "user was successfully removed"
	fi 
elif [ $1 == "addgroup" ]
then
	sudo groupadd $2
	echo "group was successfully added"
elif [ $1 == "deletegroup" ]
then
	sudo groupdel $2
	echo "group was successfully deleted"
elif [ $1 == "showusers" ]
then
	cut -d: -f1 /etc/passwd
elif [ $1 == "showgroups" ]
then
	cut -d: -f1 /etc/group
elif [ $1 == "changefilemod" ]
then
	chmod $2 $3
	echo "the file mode was successfully changed"
elif [ $1 == "addusertogroup" ]
then
	sudo usermod -aG $3 $2
	echo "user $2 was successfully added to group $3"
elif [ $1 == "help" ]
then
	echo "adduser (user name)  to add a user"
	echo "deleteuser (user name)  to delete a user"
	echo "addgroup (group name) to add a group"
	echo "deletegroup (group name) to delete a group"
	echo "showusers  to show all existing users"
	echo "showgroups  to show all existing groups"
	echo "changefilemod (permission) (filename)  to change permissions to a file" 
else
	echo "Invalid argument"
fi
