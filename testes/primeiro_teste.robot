*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Abrir o navegador e acessar o site do organo
    Open Browser    url=http://localhost:3000    browser=Chrome