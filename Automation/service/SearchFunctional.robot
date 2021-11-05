*** Settings ***
Library    SeleniumLibrary
Resource     Utils.robot
Resource     RegistrationPage.robot
Resource     LoginPage.robot
Resource     StartPage.robot

*** Variables ***
@{VALUE}        0       1       2       3

*** Keywords ***
Enter data about country and search
    [Arguments]    ${countryName}       ${nameValue}       ${language}     ${languageValue}
    input text     xpath://*[@id="j_idt66:name"]                ${countryName}
    select from list by index   name=j_idt66:j_idt71            ${nameValue}
    input text     xpath://*[@id="j_idt66:language"]            ${language}
    select from list by index   name=j_idt66:j_idt87            ${languageValue}
    click button    xpath://*[@id="j_idt66"]/table/tbody/tr[4]/td[2]/input
    Check search element    ${countryName}

Enter data about city and search
    [Arguments]    ${cityName}       ${nameValue}       ${population}     ${populationValue}    ${isCenter}
    input text     xpath://*[@id="j_idt66:name"]                ${cityName}
    select from list by index   name=j_idt66:j_idt71            ${nameValue}
    input text      xpath://*[@id="j_idt66:population"]         ${population}
    select from list by index   name=j_idt66:j_idt78            ${populationValue}
    select from list by index   name=j_idt66:j_idt84            ${isCenter}
    click button    xpath://*[@id="j_idt66"]/table/tbody/tr[4]/td[2]/input
    Check search element        ${cityName}

Enter data about room and search
    [Arguments]    ${name}       ${nameValue}       ${square}     ${squareValue}
    input text     xpath://*[@id="j_idt66:name"]                    ${name}
    select from list by index   name=j_idt66:j_idt71                ${nameValue}
    input text     xpath://*[@id="j_idt66:square"]                  ${square}
    select from list by index   name=j_idt66:j_idt78                ${squareValue}
    click button    xpath://*[@id="j_idt66"]/table/tbody/tr[3]/td[2]/input
    Check search element    ${name}



Check search element
    [Arguments]    ${countryName}
    sleep   1s
    wait until page contains    ${countryName}
    page should contain    ${countryName}
    table row should contain    xpath://table[@role="grid"]      1   ${countryName}
    sleep       5s

Check find country
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[1]/a
    click element                           link: Find Country
    sleep       1s
    wait until page contains    Find Country        6s
    title should be    Find Country
Check find city
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[2]/a
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[2]/a
    wait until page contains    Find City       6s
    title should be    Find City
Check find building
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[3]/a
    click element                           link: Find Building
    wait until page contains    Find Building       6s
    title should be    Find Building
Check find floor
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[4]/a
    click element                           link: Find Floor
    wait until page contains    Find Floor      6s
    title should be    Find Floor
Check find room
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[5]/a
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[5]/a
    wait until page contains    Find Room       6s
    title should be    Find Room
Check find rack
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[6]/a
    click element                           link: Find Rack
    wait until page contains    Find Rack       6s
    title should be    Find Rack
Check find device
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[7]/a
    click element                           link: Find Device
    wait until page contains    Find Device     6s
    title should be    Find Device
Check find POS terminal
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[8]/a
    click element                           link: Find POS Terminal
    wait until page contains    Find POS Terminal       6s
    title should be    Find POS Terminal
Check find pay box
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[9]/a
    click element                           link: Find PayBox
    wait until page contains    Find PayBox     6s
    title should be    Find PayBox
Check find ATM
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[10]/a
    click element                           link: Find ATM
    wait until page contains    Find ATM        6s
    title s