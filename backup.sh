#!/usr/bin/env bash

# Safer script
trap "exit" INT
set -euo pipefail

if [ "$UID" -eq "0" ]; then
    rsync --recursive --relative --verbose --human-readable --ignore-missing-args --files-from="$(pwd)/path_list.txt" / "$(pwd)"
    chown -hR x0rzavi:x0rzavi "$(pwd)"
    paru -Q > "$(pwd)/home/x0rzavi/installed_pkgs"
    echo -e "\nFiles updated successfully!"
else
    echo "Root privileges are required!"
fi
