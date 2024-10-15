*** Settings ***
Library                  SeleniumLibrary
Library                  FakerLibrary    locale=pt_BR
Resource                 setup_teardown.robot
Test Setup               Dado que eu acesse o Organo
Test Teardown            Fechar o navegador
*** Variables ***
${CAMPO_NOME}      id:form-nome
${CAMPO_CARGO}     id:form-cargo
${CAMPO_IMAGEM}    id:form-imagem
${CAMPO_TIME}      class:lista-suspensa
${CAMPO_CARD}      id:form-botao 
@{selecionar_times}
...            //option[contains(.,'Programação')]
...            //option[contains(.,'Front-End')]
...            //option[contains(.,'Data Science')]
...            //option[contains(.,'Devops')]
...            //option[contains(.,'UX e Design')]
...            //option[contains(.,'Mobile')]
...            //option[contains(.,'Inovação')]
*** Test Cases ***
Verificar se é possível criar mais de um card se preenchermos corretamente
    Dado que eu preencha os campos do formulário
    E clique no botão criar Card
    Então identificar o card no time esperado
    Então identificar 3 cards em cada time disponível
Verificar se é possível criar um card para cada time disponível se preenchermos os campos corretamente
    Dado que eu preencha os campos do formulário
    Então criar e identificar um card em cada time disponível

*** Keywords ***
Dado que eu preencha os campos do formulário
    ${Nome}             FakerLibrary.First Name
    Input Text          ${CAMPO_NOME}        ${Nome}
    ${Cargo}            FakerLibrary.Job
    Input Text          ${CAMPO_CARGO}      ${Cargo}
    ${Imagem}           FakerLibrary.Image Url     width=100     height=100
    Input Text          ${CAMPO_IMAGEM}     ${Imagem}
    Click Element       ${CAMPO_TIME}
    Click Element       ${selecionar_times}[0]
E clique no botão criar Card
    Click Element    ${CAMPO_CARD}

Então identificar o card no time esperado
    Element Should Be Visible    class:colaborador
Então identificar 3 cards em cada time disponível
    FOR    ${i}    IN RANGE    1   3                
        Dado que eu preencha os campos do formulário 
        E clique no botão criar Card
    END
    Sleep     10s
Então criar e identificar um card em cada time disponível
    FOR    ${indice}    ${time}    IN ENUMERATE    @{selecionar_times}
        Dado que eu preencha os campos do formulário
        Click Element    ${time}
        E clique no botão criar Card       
    END
    Sleep     5s