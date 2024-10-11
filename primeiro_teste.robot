*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${PROGRAMACAO}            //option[contains(.,'Programação')]
${FRONT_END}              //option[contains(.,'Front-End')]
${DADOS}                  //option[contains(.,'Data Science')]
${DEVOPS}                 //option[contains(.,'Devops')] 
${UX}                     //option[contains(.,'UX e Design')]
${MOBILE}                 //option[contains(.,'Mobile')]
${INOVACAO}               //option[contains(.,'Inovação e Gestão')]

*** Test Cases ***

Abrir navegador e acessar o site do Organo
    Open Browser     url=http://localhost:3000/    browser=Chrome

Preencher os campos do formulário
     Input Text    id:form-nome      Valquiria
     Input Text    id:form-cargo     Desenvolvedora
     Input Text    id:form-imagem    https://picsum.photos/200/300
     Click Element    class:lista-suspensa
     Click Element    //option[contains(.,'Programação')]
     Sleep  10s
     Click Element    id:form-botao
     Element Should Be Visible  class:colaborador
     Sleep    5s
     
