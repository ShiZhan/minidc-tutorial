#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "Usage: script <IDs...>"
    echo "E.g.:"
    echo "  script {1..30}      : start swarm1 to swarm30"
    echo "  script {31..35} 38  : start swarm31 to swarm35 and swarm38"
    exit 1
fi

for id in $@; do
    vagrant up "swarm$id"
done

