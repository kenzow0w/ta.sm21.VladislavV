*** Settings ***
Library    SeleniumLibrary
Library    RemoteSwingLibrary
Library    SwingLibrary
Library    WhiteLibrary
Resource     Utils.robot
Resource     RegistrationPage.robot
Resource     LoginPage.robot
Resource     StartPage.robot


*** Variables ***
@{TABELEMENT}    ${networkElements}     ${postTerminal}     ${payBox}       ${atm}      ${devices}      ${floors}
@{choiceCountry}   xpath://*[@id="j_idt76:tabView:j_idt89_data"]/tr[1]/td[1]/input      //*[@id="j_idt76:tabView:j_idt89_data"]/tr[2]/td[1]/input
...                 xpath://*[@id="j_idt76:tabView:j_idt89_data"]/tr[3]/td[1]/input
${networkElements}      xpath://*[@id="j_idt76:tabView"]/ul/li[7]/a
${postTerminal}      xpath://*[@href="#j_idt76:tabView:j_idt166" and normalize-space() = 'Post Terminal (s)']
${payBox}      xpath://*[@id="j_idt76:tabView"]/ul/li[5]/a
${atm}      xpath://*[@id="j_idt76:tabView"]/ul/li[4]/a
${devices}      xpath://*[@id="j_idt76:tabView"]/ul/li[3]/a
${floors}      xpath://*[@id="j_idt76:tabView"]/ul/li[2]/a


*** Keywords ***
Go to Inventory page
    [Arguments]    ${username}          ${password}
    StartPage.Go to Start Page    ${username}          ${password}
    StartPage.Click inventory button
Click edit data
    wait until page contains element        xpath://*[@id="table_header"]/table/tbody/tr/td/a
    click element                           xpath://*[@id="table_header"]/table/tbody/tr/td/a
    SwingLibrary.
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
    click button    xpath://*[@id="table_header"]/table/tbody/tr/td[2]/input
Choice country
    [Arguments]    ${country}
    click button    ${country}[1]

Choice tab
    [Arguments]    ${element}
    click element    ${element}
#    [return]        ${element}
    Log         ${element}

Create post terminal
    wait until page contains element    link:Create Post Terminal
    click element    link:Create Post Terminal

Create pay box
    wait until page contains element    link:Create Pay Box
    click element    link:Create Pay Box

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
    Click save

Choice locate
    [Arguments]    ${country}
    sleep       2s
#    page should contain     Country: ${country}
#    log to console      Country: ${country}
    switch window        Navigation Tree
    page should contain element    link:Country: ${country}
    click link    xpath://a[contains(text(), 'Country: ${country}')]
    sleep       2s
    wait until element is visible    xpath://*[@id="OK"]
    click element       xpath://*[@id="OK"]

Click locate
    wait until element is visible       link: select
    click element                       link: select


Enter information about post terminal
    [Arguments]    ${name}       ${width}     ${length}   ${height}   ${physicalStatus}
    Create post terminal
    sleep       2s
    wait until element is visible    xpath://*[@id="j_idt74:name"]
    input text    xpath://*[@id="j_idt74:name"]             ${name}
    wait until element is visible    xpath://*[@id="j_idt74:width"]         #HERE!1!1
    input text    xpath://*[@id="j_idt74:width"]            ${width}
    wait until element is visible    xpath://*[@id="j_idt74:length"]
    input text    xpath://*[@id="j_idt74:length"]           ${length}
    wait until element is visible    xpath://*[@id="j_idt74:height"]
    input text    xpath://*[@id="j_idt74:height"]           ${height}
    select from list by index    xpath://*[@id="j_idt74:physicalStatus"]           ${physicalStatus}
    sleep       5s
    Click locate
    Choice locate       Russia

Enter information about pay box
    [Arguments]     ${name}       ${secureProtocol}     ${displaySize}   ${physicalStatus}
    Create pay box
    sleep       2s
    wait until element is visible    xpath://*[@id="j_idt74:name"]
    input text    xpath://*[@id="j_idt74:name"]             ${name}
    wait until element is visible    xpath://*[@id="j_idt74:secureProtocol"]
    input text    xpath://*[@id="j_idt74:secureProtocol"]           ${secureProtocol}
    wait until element is visible    xpath://*[@id="j_idt74:displaySize"]
    input text    xpath://*[@id="j_idt74:displaySize"]          ${displaySize}
    wait until element is visible    xpath://*[@id="j_idt74:physicalStatus"]
    select from list by index    xpath://*[@id="j_idt74:physicalStatus"]           ${physicalStatus}
    sleep       5s
    Click locate
    Choice locate       Brazil



Create object
       [Arguments]    ${TABELEMENT}
        Log                 ${TABELEMENT}
        Log                 ${postTerminal}
       IF       $TABELEMENT == $postTerminal
                Log to console    I in IF block
                Enter information about post terminal    post    15      20      30      0
                sleep           2s
       ELSE IF   $TABELEMENT == $payBox
                Log to console    I in IF ELSE block
                Enter information about pay box     box       15      20      1
                sleep           2s
       ELSE
            log to console    choice anything
       END
    sleep           2s
    Log         END CIRCLE

