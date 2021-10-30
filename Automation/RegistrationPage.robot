*** Settings ***
Library    SeleniumLibrary
Resource     Utils.robot
Resource    LoginPage.robot


#Suite Teardown    Close All Browsers
#Library    Selenium2Library
#Test Setup  Setup system under test
#Test Teardown   SeleniumLibrary.Close Browser

*** Variables ***

*** Keywords ***
Fills registration form
    Input Text          id=registerForm:username        ${USERNAMEFIELD}
    Input Password      id=registerForm:password        ${passwordField}
    Input Text    id=registerForm:confirmPassword       ${confirmPasswordField}
    Input Text         id=registerForm:email            ${emailField}
    select from list by index   registerForm:role       1

Click registration
    click button        name = registerForm:j_idt26

Click login
    click element    xpath = //a[@class='button']

Registration Set Username
    [Arguments]    ${username}
    clear element text    id=registerForm:username
    Input Text      id=registerForm:username    ${username}


Registration Set Password
    [Arguments]    ${password}
    clear element text      id=registerForm:password
    Input Text              id=registerForm:password   ${password}

Registration Set Email
    [Arguments]    ${email}
    clear element text      id=registerForm:email
    Input Text              id=registerForm:email       ${email}

Registration Set Role
    [Arguments]    ${role}
    select from list by index   registerForm:role       ${role}


