#!/bin/sh


#When this exits, exit all background process also.
trap 'kill $(jobs -p)' EXIT


# iterate through the each given file name(s),
for file in "$@"

do

	# show tails of each in the background.
	tail -f $file &
done


# wait .... until CTRL + C
wait

