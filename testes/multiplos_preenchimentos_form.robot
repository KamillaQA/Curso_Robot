*** Settings ***
Resource          ../resources/main.robot

*** Variables ***

*** Test Cases ***
Verificar se é possível criar mais de um card se preenchermos corretamente
    Dado que eu preencha os campos do formulário
    E clique no botão criar Card
    Então identificar o card no time esperado
    Então identificar 3 cards em cada time disponível
Verificar se é possível criar um card para cada time disponível se preenchermos os campos corretamente
    Dado que eu preencha os campos do formulário
    Então criar e identificar um card em cada time disponível

