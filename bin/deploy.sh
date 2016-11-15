#!/bin/bash
#
# Deployer menu and script
# Author: Nissim Bitan
#

DIRNAME=$( dirname $0 )
INPUT=/tmp/deploy.in.$$
OUTPUT=/tmp/deploy.out.$$

# trap and delete temp files
trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM

source $DIRNAME/../bin/functions

function usage() {
  echo "Usage: $0 [init|vagrant|pubkey|ansible]"
}

echo $(date) >> ${LOG_FILE}

case $1 in
        init) init_repo;;
        vagrant) vagrant_setup;;
        pubkey) deploy_pubkey;;
        ansible) install_ansible;;
        *) usage; exit 1;;
esac

[ -f $OUTPUT ] && rm $OUTPUT
[ -f $INPUT ] && rm $INPUT


echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "			Task - $1 - Complete!"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "	Deploy log file available at '${LOG_FILE}'."
echo "	Ansible log file available at '/var/log/ansible.log'."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
