#!/bin/bash
MACHINENAME=$1

VBoxManage unregistervm $MACHINENAME --delete-all
