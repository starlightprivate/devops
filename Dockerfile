#!/bin/bash
#
# Dockerfile
#
# Dockerfile to install and initialize the server.
# Please note all detailed execution scripts will be run with `INSTALL.sh` to make this
# repository moddular. Be careful with the version upgrades with the centos, especially
# with major version changes, as some scripts contain version-specific parts that may
# not be compatible with later version.
#
# Copyright 2017-present DMM1 LLC.
#
# Authored by
# Melvyn Kim <melvynkim@gmail.com>
#
# Maintained at
# https://github.com/starlightgroup/devops

FROM centos:7.3.1611
MAINTAINER "Melvyn Kim" <melvynkim@gmail.com>

# one-liner install script to install and initialize.
# If for any reason the script cannot be accessed, then the entire Dockerfile installation
# will fail, beyond the started image.
RUN ./INSTALL.sh