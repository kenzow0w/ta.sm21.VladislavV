*** Settings ***
Library    SeleniumLibrary
Resource     Utils.robot
Resource     RegistrationPage.robot
Resource     LoginPage.robot
Resource     StartPage.robot


*** Variables ***
@{TABELEMENT}    ${networkElements}     ${postTerminal}     ${payBox}       ${atm}      ${devices}      ${floors}
@{choiceCountry}   xpath://*[@id="j_idt76:tabView:j_idt89_data"]/tr[1]/td[1]/input      //*[@id="j_idt76:tabView:j_idt89_data"]/tr[2]/td[1]/input
...                 xpath://*[@id="j_idt76:tabView:j_idt89_data"]/tr[3]/td[1]/input
${networkElements}      xpath://*[@id="j_idt76:tabView"]/ul/li[7]/a
${postTerminal}      xpath://*[@id="j_idt76:tabView"]/ul/li[6]/a
${payBox}      xpath://*[@id="j_idt76:tabView"]/ul/li[5]/a
${atm}      xpath://*[@id="j_idt76:tabView"]/ul/li[4]/a
${devices}      xpath://*[@id="j_idt76:tabView"]/ul/li[3]/a
${floors}      xpath://*[@id="j_idt76:tabView"]/ul/li[2]/a
*** Keywords ***
Go to Inventory page
    StartPage.Go to Start Page    Volodin_admin       Password123$
    StartPage.Click inventory button
    sleep   2s
Click edit data
    wait until page contains element        xpath://*[@id="table_header"]/table/tbody/tr/td/a
    click element                           xpath://*[@id="table_header"]/table/tbody/tr/td/a
Click save
    [Documentation]    Save the entered data and over to next step.
    wait until page contains element        xpath://*[@id="table_header"]/table/tbody/tr/td[1]/input
    click button                            xpath://*[@id="table_header"]/table/tbody/tr/td[1]/input
Click cancel
    [Documentation]    Return in inventory page and cancel the entered data
    click element    xpath://*[@id="table_header"]/table/tbody/tr/td[2]/a
Open next tab
    click element    xpath://*[@id="j_idt76:tabView"]/ul/li[2]

Click delete
    Choice country
    click button    xpath://*[@id="table_header"]/table/tbody/tr/td[2]/input
Choice country
    [Arguments]    ${country}
    click button    ${country}[1]

Choice tab
    [Arguments]    ${element}
    click element    ${element}
    [return]    @{TABELEMENT}

Create post terminal
    wait until page contains element    xpath://*[@id="table_header"]/table/tbody/tr/td[1]/a
    click element    xpath://*[@id="table_header"]/table/tbody/tr/td[1]/a

Create pay box
    wait until page contains element    xpath://*[@class='button' and normalize-space() = 'Pay Box']
    click element    xpath://*[@class='button' and normalize-space() = 'Pay Box']

Create country
    sleep       1s
    wait until page contains element    xpath://*[@class='button' and normalize-space() = 'Create country']
    Click element    xpath://*[@class='button' and normalize-space() = 'Create country']

Create city
    wait until page contains element    xpath://*[@class='button' and normalize-space() = 'Create city']
    Click element    xpath://*[@class='button' and normalize-space() = 'Create city']
    title should be    Create city

Create building
    wait until page contains element    xpath://*[@class='button' and normalize-space() = 'Create building']
    click element    xpath://*[@class='button' and normalize-space() = 'Create building']
    title should be    Create building

Clear fields about country
    title should be    Brazil | Edit
    input text    xpath://*[@id="j_idt74:name"]           ${EMPTY}
    input text    xpath://*[@id="j_idt74:language"]      ${EMPTY}
    select from list by index   xpath://*[@id="j_idt74:continent"]       0

Edit information about country
    [Arguments]    ${country}       ${language}     ${continent}
    input text    xpath://*[@id="j_idt74:name"]           ${country}
    input text    xpath://*[@id="j_idt74:language"]      ${language}
    select from list by index   xpath://*[@id="j_idt74:continent"]       ${continent}

Enter information about country
    [Arguments]    ${country}       ${language}     ${continent}
    Create country
    wait until page contains    Create country
    title should be    Create country
    input text    xpath://*[@id="j_idt74:name"]           ${country}
    input text    xpath://*[@id="j_idt74:language"]      ${language}
    select from list by index   xpath://*[@id="j_idt74:continent"]       ${continent}

Enter information about city
    [Arguments]    ${cityName}       ${population}     ${isRegionalCenter}
    Create city
    wait until page contains    Create city
    title should be    Create city
    input text    xpath://*[@id="j_idt74:name"]           ${cityName}
    input text    xpath://*[@id="j_idt74:population"]       ${population}
    select from list by index   id=j_idt74:isRegionalCenter       ${isRegionalCenter}

Enter information about building
    [Arguments]    ${buildName}       ${streetName}     ${number}   ${square}   ${isConnected}
    Create building
    wait until page contains    Create building
    title should be    Create building
    input text    xpath://*[@id="j_idt74:name"]             ${buildName}
    input text    xpath://*[@id="j_idt74:streetName"]       ${streetName}
    input text    xpath://*[@id="j_idt74:number"]           ${number}
    input text    xpath://*[@id="j_idt74:number"]           ${number}
    input text    xpath://*[@id="j_idt74:square"]           ${square}
    select from list by index   xpath://*[@id="j_idt74:isconnected"]       ${isConnected}

Enter information about post terminal
    [Arguments]    ${name}       ${width}     ${length}   ${height}   ${physicalStatus}    #${locatedIn}
    Create post terminal
    wait until page contains    Create posterm
    title should be    Create posterm
    input text    xpath://*[@id="j_idt74:name"]             ${name}
    input text    xpath://*[@id="j_idt74:width"]            ${width}
    input text    xpath://*[@id="j_idt74:length"]           ${length}
    input text    xpath://*[@id="j_idt74:height"]           ${height}
    select from list by index    xpath://*[@id="j_idt74:physicalStatus"]           ${physicalStatus}
    sleep       5s
#    Choice locate   xpath://*[@id="table_data"]/table/tbody/tr[6]/td/a[1]       ${locatedIn}

Enter information about pay box
    [Arguments]    ${name}       ${secureProtocol}     ${displaySize}   ${physicalStatus}    #${locatedIn}
    Create building
    wait until page contains    Create posterm
    title should be    Create posterm
    input text    xpath://*[@id="j_idt74:name"]                      ${name}
    input text    xpath://*[@id="j_idt74:secureProtocol"]            ${secureProtocol}
    input text    xpath://*[@id="j_idt74:displaySize"]               ${displaySize}
    select from list by index    xpath://*[@id="j_idt74:physicalStatus"]           ${physicalStatus}
#    Choice locate   xpath://*[@id="table_data"]/table/tbody/tr[5]/td/a[1]       ${locatedIn}


Create object
       [Arguments]    ${TABELEMENT}
        Log                 ${TABELEMENT}
        Log                 ${postTerminal}
       IF       $TABELEMENT == $postTerminal
                Log     I in IF block
                Enter information about post terminal    post    15      20      30      0
       ELSE
                Create pay box
                Enter information about pay box    box       15      20      1
       END
       Click save
       sleep           5s
