#!/bin/bash
#
# install.sh
#
# This install script installs essential files
# to initilize the server with the scripts in this repository.
#
# Copyright 2017-present DMM1 LLC.
#
# Authored by
# Melvyn Kim <melvynkim@gmail.com>
#
# Maintained at
# https://github.com/starlightgroup/devops

DATE=$(date +%Y%m%d_%H%M%S)
# return flag
# If this script has run successfully, set `RETVAL` to zero.
# By default, setting `RETVAL` to 1, in case of fallover/premature exit
RETVAL=1

# enable `yum-cron`
# yum-cron automatically updates the yum-related packages to be updated.
# recommended to add yum security patches in `init.d`
enable_yum_cron() {
	chkconfig yum-cron on
}

# install `yum-plugin-security`
# recommended to put the yum update and install scripts in `cron.daily`
install_yum_plugin_security() {
	if [[ -d "/var/log/yum.log.d" ]]; then
		mkdir "/var/log/yum.log.d"
	fi
	# add the yum security plugin update log to the DATE
	yum -y install yum-plugin-security >> "/var/log/yum.log.d/${DATE}.log"
}

# install eseential tools for nodejs server
if [[ ! -f "/var/lock/init/00_init_server" ]]; then
	echo "INFO: Server is created. Running init.d scripts for first time initialization."
	yum update -y &&
	yum install -y \
		epel-release \
		git \
		nodejs \
		nginx &&
	mkdir /var/lock/init &&
	touch /var/lock/init/00_init_server &&
	chmod 751 /var/lock/init/00_init_server &&
	RETVAL=0

	# if `RETVAL` is not zero, this means one of the above installations has failed
	# and not successfully installed. Exit prematurely with error code 1.
	if [ ${RETVAL} != '0' ]; then
		echo "ERROR: Initialing server has failed."
		if [[ -f "/var/lock/init/00_init_server" ]]; then
			rm "/var/lock/init/00_init_server"
		fi
		exit ${RETVAL}
	fi
else
	echo "INFO: Server was already initialized."
	exit 0
fi

install_yum_plugin_security
enable_yum_cron