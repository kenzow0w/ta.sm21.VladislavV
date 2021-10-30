*** Settings ***
Library    SeleniumLibrary
Resource     Utils.robot
Resource     RegistrationPage.robot
Resource     LoginPage.robot
Resource     StartPage.robot

*** Keywords ***
Go to Inventory page
    StartPage.Go to Start Page    Volodin_admin       Password123$
    StartPage.Click inventory button
    sleep   2s
Edit data
    click button    //*[@id="table_header"]/table/tbody/tr/td/a
Click save
    [Documentation]    Save the entered data and over to next step.
    click button    xpath://*[@id="table_header"]/table/tbody/tr/td[1]/input
Click cancel
    [Documentation]    Return in inventory page and cancel the entered data
    click button    xpath://*[@id="table_header"]/table/tbody/tr/td[2]/a
Open next tab
    click button    //*[@id="j_idt76:tabView"]/ul/li[2]/a
Create country
    click button    xpath://*[@id="table_header"]/table/tbody/tr/td[1]/a
    Wait Until Page Contains Element    Create country
    title should be    Create country
Create city
    click button    xpath://*[@id="table_header"]/table/tbody/tr/td[1]/a
    Wait Until Page Contains Element    Create city
    title should be    Create city
Create building
    click button    xpath://*[@id="table_header"]/table/tbody/tr/td[1]/a
    Wait Until Page Contains Element    Create building
    title should be    Create building

Enter information about country
    [Arguments]    ${country}       ${language}     ${continent}
    create country
    input text    xpath://*[@id="j_idt74:name"]           ${country}
    input text    xpath://*[@id="j_idt74:language"]      ${language}
    select from list by index   xpath://*[@id="j_idt74:continent"]       ${continent}

Enter information about city
    [Arguments]    ${cityName}       ${population}     ${isRegionalCenter}
    Create city
    input text    xpath://*[@id="j_idt74:name"]           ${cityName}
    input text    xpath://*[@id="j_idt74:language"]       ${population}
    select from list by index   xpath://*[@id="j_idt74:isRegionalCenter"]       ${isRegionalCenter}

Enter information about building
    [Arguments]    ${buildName}       ${streetName}     ${number}   ${square}   ${isConnected}
    Create building
    input text    xpath://*[@id="j_idt74:name"]             ${buildName}
    input text    xpath://*[@id="j_idt74:streetName"]       ${streetName}
    input text    xpath://*[@id="j_idt74:number"]           ${number}
    input text    xpath://*[@id="j_idt74:number"]           ${number}
    input text    xpath://*[@id="j_idt74:square"]           ${square}
    select from list by index   xpath://*[@id="j_idt74:isconnected"]       ${isConnected}