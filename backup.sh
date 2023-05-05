#!/bin/env dash

# Safer script
set -o errexit
set -o nounset
trap "exit" INT

if [ "$(id -u)" -eq 0 ]
then
    rsync --recursive --relative --verbose --human-readable --ignore-missing-args --include-from="$(pwd)/path_list.txt" / "$(pwd)"
    chown -hR x0rzavi:x0rzavi "$(pwd)"

    if [ -f /etc/pacman.conf ]; then
        paru -Q > "$(pwd)/home/x0rzavi/installed_pkgs_arch"
    else
        cp /var/lib/portage/world "$(pwd)/home/x0rzavi/installed_pkgs_gentoo"
    fi
    printf '%s\n' 'Files updated successfully!'
else
    printf '%s\n' 'Root privileges are required!'
fi
