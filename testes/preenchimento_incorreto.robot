*** Settings ***
Resource          ../resources/main.robot

*** Variables ***
${BOTAO_CARD}      id:form-botao

*** Test Cases ***
Verificar se quando um campo obrigatório não for preenchido corretamente o sistema exibe uma mensagem de campo obrigatório
    Dado que eu clique no botão "Criar Card"
    Então sistema deve apresentar mensagem de campo obrigatório

