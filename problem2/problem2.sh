#!/bin/bash

# Run the script passed as an argument

parent="$1"
child="$2" 
myfun(){
    ./$parent &
    ppid="$!"
    while [ -z "$(ps -e | grep "$parent")" ]; do
      sleep 1
    done
    echo "$ppid"

    ./"$child" &
    cpid="$!"
    wait $child_pid

    # Check the child process's exit code
    if [ $? -eq 0 ]; then
       echo "Child process exited normally."
    else
       echo "Child process exited with error."
       myfun
    fi
    echo "$cpid"
}
myfun
# Get pids of all the child processes

# Check if any of the child processes crahses or not if it does restart the main prcoess


