#!/bin/bash
#Autor: Iago Okuma
#Data: 04/11/2022
#Arquivo: cadastro.sh
#Descrição: O programa que faz inscrição dos funcionarios que você deseja adicionar e cria uma area de trabalho.
#Versão: 1.0
#Licença: GLP V3

echo "#########################"
echo "#########################"
echo "#-------BEM VINDO-------#"
echo "#########################"
echo "#########################"

echo "MENU"
echo "[ 1 ] - Iniciar um serviço"
echo "[ 2 ] - Cadastro de funcionários"
echo "[ 3 ] - Verifica a internet"
read -p "Escolha umas das opções:" OPCAO


function service()
{
    clear
    echo "[ 1 ] Verificar os serviços ativos"
    echo "[ 2 ] Serviço"
    echo
    read -p "Qual função deseja realizar?" SERVICO 

    if [ $SERVICO -eq 1 ]
    then
        echo -e "Serviços ativos:"
        ss -atun
    fi
}

function cadastrar()
{
    read -p "Nome do funcionário" FUNCIONARIO
    useradd $FUNCIONARIO
    passwd $FUNCIONARIO
    echo
    read -p "Cargo: " CARGO
    ADDCARGO="addgroup $CARGO"
    if [ $? -eq 0 ]
    then
        adduser $FUNCIONARIO $CARGO
    else
        adduser $FUNCIONARIO $CARGO
    fi

}

function pingar()
{
IP="8.8.8"
PING="ping -c3 $IP"
echo $PING
    if [ $? -eq 0 ] #$? = 0 verdadeiro (resultado deu certo) / outro numero = false
    then 
        echo -e "\nServidor está com internet"
    else
        echo -e "\nServidor sem conexão"
    fi
}


case $OPCAO in 
    *'1'*)
       service
    ;;
    *'3'*)
        pingar
    ;;
esac
