#!/bin/sh

folder=$1
root_folder='/truckin'
workdir=$root_folder

if [[ $folder != '' ]]; then
  workdir="$workdir/$folder"
fi

docker run -it --rm --name operator \
           -v $PWD:$root_folder \
           -v $HOME/.ssh:/root/.ssh \
           -w $workdir \
           --net="host" ansible/ubuntu14.04-ansible
