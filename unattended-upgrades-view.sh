#!/bin/bash
# Script to quickly view what Ubuntus' unattended-upgrades has done recently.
tail -n 200 /var/log/unattended-upgrades/unattended-upgrades.log | grep Package*
