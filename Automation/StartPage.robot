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

Click inventory button
    Wait Until Page Contains Element        xpath://*[@id="inventory"]/a
    click element                           xpath://*[@id="inventory"]/a
Click inventory in checkbox
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[1]/ul/li/ul/li[1]
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[1]/ul/li/ul/li[1]

Click tools
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[1]/ul/li/ul/li[3]
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[1]/ul/li/ul/li[3]


Search - Find Country
    [Arguments]    ${countryName}   ${Language}
    Wait Until Page Contains Element        xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[1]/a
    click element                           xpath://*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[1]/a
    input text     xpath://*[@id="j_idt66:name"]        ${countryName}
    input text     xpath://*[@id="j_idt66:language"]    ${Language}
    click button    //*[@id="j_idt66"]/table/tbody/tr[4]/td[2]/input

Go to Start Page
    [Arguments]    ${username}       ${password}
    Go to Registration Page
    RegistrationPage.Click login
    Login Page Should Be Open
    LoginPage.Fills login form    ${username}    ${password}
    LoginPage.Click login
    Start Page Should Be Open

