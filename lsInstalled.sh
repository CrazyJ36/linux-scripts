#!/bin/bash
zcat /var/log/apt/eipp.log.gz | cat - /var/log/apt/history.log | grep -Po '^Commandline: apt-get install (?!.*--reinstall)\K.*'

