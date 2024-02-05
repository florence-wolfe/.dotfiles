#!/bin/bash

# Check if an author name and email is provided
if [ "$#" -ne 1 ]; then
	echo "Usage: $0 'Author Name <email@example.com>'"
	exit 1
fi

AUTHOR="$1"

while true; do
	git commit --amend --no-verify --author="$AUTHOR" --no-edit
	git rebase --continue
	if [ $? -ne 0 ]; then
		break
	fi
done
