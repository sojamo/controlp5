for d in $HOME/Documents/workspace/controlp5/examples/**/*/; do
	# echo "$d"
	java -cp .:../distribution/tmp/controlP5/library/controlP5.jar:$HOME/Documents/workspace/libs/core.jar:./addons/AddMethodList AddMethodList $d
	processing-java --sketch="$d" --output=/tmp/processing-test --force --build
done
