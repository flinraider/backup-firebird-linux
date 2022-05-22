#!/usr/bin/env bash
# Script de Backup e Restauração Banco de Dados Firebird

# Variaveis
gfix="/opt/firebird/bin/gfix"
gbak="/opt/firebird/bin/gbak"
bkp="/home/company/backup"
banco="/home/company/db/"
user="-user SYSDBA -pass masterkey"
novo="database.fdb"
old="database.fbk"

# Iniciando procedimentos

   # Finaliza transações pendentes
   $gfix -commit all $banco/$novo $user

   # Desliga o banco
   $gfix -shut -force 0 $banco/$novo $user

   # Realiza limpeza do banco
   $gfix -sweep $banco/$novo $user

   # Verifica erros
   $gfix -v -f $banco/$novo $user >> error.log 2>> $banco/erro.log 

   # Prepara o banco
   $gfix -m -i $banco/$novo $user 

   # Realiza o backup 
   $gbak -backup -garbage -limbo -ignore -v -t $banco/$novo "$banco/$old" $user

   # Movendo o Banco Original
   mv -v $banco/$novo $bkp

   # Restaurando Backup
   $gbak -c -p 16384 -v $banco/$old "$banco/$novo" $user
  
   # Iniciando o Banco
   $gfix -online $banco/$novo $user