*** Settings ***
Library    SeleniumLibrary
Resource     ../service/Utils.robot
Resource     ../service/RegistrationPage.robot
Resource     ../service/LoginPage.robot
Resource    ../service/SearchFunctional.robot

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


Go to Start Page
    [Arguments]    ${username}       ${password}
    Go to Registration Page
    RegistrationPage.Click login
    Login Page Should Be Open
    LoginPage.Fills login form    ${username}    ${password}
    LoginPage.Click login
    Start Page Should Be Open






