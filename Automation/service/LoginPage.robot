*** Settings ***
Library    SeleniumLibrary
Resource     Utils.robot


*** Variables ***



*** Keywords ***
Fills login form
    [Arguments]     ${userNameField}        ${passwordField}
    sleep   2s
    Input Text  name = j_username    ${userNameField}
    sleep   2s
    Input Password  name = j_password    ${passwordField}
Click login
    click button        name = submit
Set Username
    [Arguments]    ${username}
    clear element text    name = j_username
   Input text      name = j_username       ${username}

Set Password
    [Arguments]    ${password}
    clear element text      name = j_password
    Input Text              name = j_password     ${password}

