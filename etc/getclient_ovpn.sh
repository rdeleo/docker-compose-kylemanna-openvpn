#!/bin/bash

# Wrapper script for appending options to .ovpn files
# Author: Darren Bradley (Volcanic Lair Limited)

if [ -z ${1} ]
then
	echo "ERROR: You must supply a username"
	exit 1
fi


if [ ${2} ]
then
	case ${2} in
		"ubuntu")
			EXTRA_OPTS+="script-security 2\n"
			EXTRA_OPTS+="up /etc/openvpn/update-systemd-resolved\n"
			EXTRA_OPTS+="down /etc/openvpn/update-systemd-resolved"
			;;
		*)
			echo "ERROR: Unknown option ${2}"
			exit 1
			;;
	esac
fi

ovpn_getclient ${1}
if [ ${#EXTRA_OPTS} -gt 0 ]
then
	echo -e ${EXTRA_OPTS}
fi