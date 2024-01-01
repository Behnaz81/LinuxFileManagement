path="."

while true
do
	change_event=$(inotifywait -r -e modify,create,delete "$path" 2>/dev/null)
	change_type=$(echo "$change_event" | awk '{print $2}')
	file_name=$(echo "$change_event" | awk '{print $3}')
	
	if [ "$change_type" == "MODIFY" ]
	then
		echo "File $file_name has been modified"
	elif [ "$change_type" == "CREATE" ]
	then
		echo "File $file_name has been created"
        elif [ "$change_type" == "DELETE" ]
        then
                echo "File $file_name has been deleted"
	elif [ "$change_type" == "CREATE,ISDIR" ]
	then
		echo "Directory $file_name has been created"
	elif [ "$change_type" == "DELETE,ISDIR" ]
	then
		echo "Directory $file_name has been deleted"
	fi
done
	
