while true
do
	echo "1. Show List of Processes"
	echo "2. Kill a Process"
	echo "3. Renice a Process"
	echo "4. Exit"

	read -p "Choose an action: " action

	if [ $action == "1" ]
	then
		ps aux
	elif [ $action == "2" ]
	then
		read -p "Enter the PID: " pid
		user=$(ps -p $pid -o user=)
		read -p "The user is $user. Are you sure you want to kill the process?(y/n)" choice
		if [ $choice == "y" ]
		then
			kill $pid
			echo "killed successfully!"
		fi
	elif [ $action == "3" ]
	then
		read -p "Enter the PID: " pid
		niceness=$(ps -p $pid -o nice=)
		echo "Process $pid has the niceness $niceness"
		read -p "Would you like to change the niceness?(y/n)" choice
		if [ $choice == "y" ]
		then
			read -p "Enter the niceness: " newniceness
			renice $newniceness -p $pid
			echo "Reniced Successfully!"
		fi
	elif [ $action == "4" ]
	then
		break
	else
		echo "Invalid input!"
	fi
done
