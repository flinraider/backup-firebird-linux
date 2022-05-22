#!/usr/bin/env bash

USERNAME="usuario"
PASSWORD="senha"
SERVER="ip ou dns server"

cd /home/leonardo/acabit/dados/ 
chmod 644 *.FBK
ftp -ivn $SERVER <<EOF 
user $USERNAME $PASSWORD
cd /company/bkp/
bin 
mput *.FBK
s
buy
EOF
