for d in $HOME/Documents/workspace/controlp5/examples/use/*/; do
	echo "$d"
	processing-java --sketch="$d" --output=/tmp/processing-test --force --build
done
