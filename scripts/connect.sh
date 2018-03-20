#!/bin/bash

export LC_MYIP=`dig $1 +short`
ssh -o SendEnv=LC_MYIP root@$1
