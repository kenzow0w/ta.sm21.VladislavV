*** Settings ***
Library    SeleniumLibrary


*** Variables ***
@{BROWSER}      Chrome      FireFox     Edge
${url}      https://inventory.edu-netcracker.com/pages/registration.xhtml
${USERNAMEFIELD}        User123
${passwordField}        Password123$
${confirmPasswordField}     ${passwordField}
${emailField}     User123@mail.ru
${roleField}        0
${Path}     C:\\Users\\Vlad\\PycharmProjects\\pythonProject2\\Resource
${TYPE OF FILE}     png

#pabot --processes 2 TestStart.robot TestSearch.robot
*** Keywords ***
Go to Registration Page
    Open Browser    ${url}    ${BROWSER}[0]
    Registration Page Should Be Open
Registration Page Should Be Open
    sleep   2s
    Title Should Be    Registration
Login Page Should Be Open
    sleep   2s
    Title Should Be    Login Page
Start Page Should Be Open
    sleep   2s
    Title Should Be    Top
Inventory Page Should Be Open
    sleep   2s
    title should be    Inventory
Administrative tools Page Should Be Open
    sleep   2s
    title should be    Administrative tools

make screenshot
  [Arguments]  ${filename}
  Set Screenshot Directory      ${Path}
  sleep                         2s
  Capture Page Screenshot       ${filename}.${TYPE OF FILE}
  Log To Console                ${\n}Screenshot${filename}







