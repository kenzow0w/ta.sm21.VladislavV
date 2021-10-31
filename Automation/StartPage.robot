*** Settings ***
Library    SeleniumLibrary
Resource     Utils.robot
Resource     RegistrationPage.robot
Resource     LoginPage.robot
*** Variables ***



*** Keywords ***
Open navigation checkbox
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[1]/ul/li/a
    mouse over                              xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[1]/ul/li/a
    sleep                                   2s

Open search checkbox
    Wait Until Page Contains Element        xpath:/html/body/div/div[2]/div/table/tbody/tr/td[2]/ul/li/input
    mouse over                              xpath:/html/body/div/div[2]/div/table/tbody/tr/td[2]/ul/li/input
    sleep                                   2s

Input text and search
    [Arguments]    ${searchElement}
    wait until page contains element      xpath://*[@id="search-text-input"]
    Input text            xpath://*[@id="search-text-input"]          ${searchElement}
    press key             xpath://*[@id="search-text-input"]      \\13
Click inventory button
    Wait Until Page Contains Element        xpath://*[@id="inventory"]/a
    click element                           xpath://*[@id="inventory"]/a
Click inventory in checkbox
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[1]/ul/li/ul/li[1]
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[1]/ul/li/ul/li[1]

Click tools
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[1]/ul/li/ul/li[3]
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[1]/ul/li/ul/li[3]

Check find country
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[1]/a
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[1]/a
    wait until page contains    Find Country
    title should be    Find Country
Check find city
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[2]/a
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[2]/a
    wait until page contains    Find City
    title should be    Find City

Check find building
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[3]/a
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[3]/a
    wait until page contains    Find Building
    title should be    Find Building
Check find floor
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[4]/a
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[4]/a
    wait until page contains    Find Floor
    title should be    Find Floor
Check find room
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[5]/a
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[5]/a
    wait until page contains    Find Room
    title should be    Find Room
Check find rack
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[6]/a
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[6]/a
    wait until page contains    Find Rack
    title should be    Find Rack
Check find device
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[7]/a
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[7]/a
    wait until page contains    Find Device
    title should be    Find Device
Check find POS terminal
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[8]/a
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[8]/a
    wait until page contains    Find POS Terminal
    title should be    Find POS Terminal
Check find pay box
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[9]/a
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[9]/a
    wait until page contains    Find PayBox
    title should be    Find PayBox
Check find ATM
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[10]/a
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[10]/a
    wait until page contains    Find ATM
    title should be             Find ATM



CheckSearchButtons
    Check find country
    Check find city
    Check find building
    Check find floor
    Check find room
    Check find rack
    Check find device
    Check find device
    Check find POS terminal
    Check find pay box
    Check find ATM


Search - Find Country
    [Arguments]    ${countryName}   ${Language}
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[1]/a
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[1]/a
    input text     xpath://*[@id="j_idt66:name"]        ${countryName}
    input text     xpath://*[@id="j_idt66:language"]    ${Language}
    click button    //*[@id="j_idt66"]/table/tbody/tr[4]/td[2]/input
    Check search element    ${countryName}

Check search element
    [Arguments]    ${countryName}
    sleep   1s
    wait until page contains    ${countryName}
    page should contain    ${countryName}
    element text should be    xpath://*[@id="j_idt97_data"]/tr/td[1]/a   ${countryName}
Go to Start Page
    [Arguments]    ${username}       ${password}
    Go to Registration Page
    RegistrationPage.Click login
    Login Page Should Be Open
    LoginPage.Fills login form    ${username}    ${password}
    LoginPage.Click login
    Start Page Should Be Open



