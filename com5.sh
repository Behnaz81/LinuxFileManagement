if [ $1 == "awk" ]
then
	echo "'awk' reads the input file line by line, and for each line, it checks whether it matched the specified pattern."
	echo "If a match is found, the associated action is executed."
	echo "If no pattern is provided, the action is performed for every line."
	echo "Syntax:"
	echo "awk 'pattern { action}' file"
	echo "Example:"
	echo "awk '{print $1}' data.txt"
	echo "It prints the first field (column) of each line in the file \'data.txt\'"
elif [ $1 == "sed" ]
then
	echo "'sed' performs basic text trasformation on an input stream (a file or input from a pipeline)."
	echo "'sed' doesn't modify the original file but outputs the transformed text to the standard output."
	echo "Syntax:"
	echo "sed 'expression' filename"
	echo "Example:"
	echo "sed '3d' filename"
	echo "This deletes the third line of the input file"
elif [ $1 == "grep" ]
then
	echo "'grep' is used to search for patterns whithin text files."
	echo "Syntax:"
	echo "grep [options] pattern [filename]"
	echo "Example:"
	echo "grep \"keyword\" filename.txt"
	echo "This will show all the lines with keyword pattern in filename.txt"
else
	echo "Invalid argument"
fi
