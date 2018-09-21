#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "Usage: script <IDs...>"
    echo "E.g.:"
    echo "  script {1..30}      : start node1 to node30"
    echo "  script {31..35} 38  : start node31 to node35 and node38"
    exit 1
fi

for id in $@; do
    vagrant up "node$id"
done

