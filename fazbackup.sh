#!/usr/bin/env bash
# Script de Backup e Restauração Banco de Dados Firebird

# Iniciando backup

"/opt/firebird/bin/gbak" -Z -V -g -nt "/home/company/db/DATABASE.FDB" "/home/company/db/DATABASE.FBK" -USER SYSDBA -PAS "masterkey" 

# mv "/home/company/db/DATABASE.FBK" "/home/company/bkp/"


# Iniciando restaurando

#"/opt/firebird/bin/gbak" -C  -L -IG -Z -V "/home/company/db/DATABASE.FBK"  "/home/company/db/DATABASE.FDB" -USER SYSDBA -PAS "masterkey"

#"opt/firebird/bin/gfix" -online "/home/company/db/DATABASE.FDB" -USER SYSDBA -PAS "masterkey"

#sleep 120


#mv "/home/company/bkp/DATABASE.fdb" "/home/company/db/"

#echo Terminado
#pause
