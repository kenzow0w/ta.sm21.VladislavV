*** Settings ***
Library    SeleniumLibrary
Resource     ../Utils.robot
Resource    ../LoginPage.robot
Resource    ../RegistrationPage.robot
Resource    ../StartPage.robot
Resource    ../InventoryPage.robot
Suite Setup    Log      Test start
Suite Teardown      Log     Test end
Test Setup    StartPage.Go to Start Page        User123       Password123$
Test Teardown   Close Browser

#robot -i TC7 TestStart.robot
*** Test Cases ***
Test#7 FunctionalTestInventoryButton
    [documentation]  This test case verifies functional inventory button in checkbox
    [tags]  TC7
    StartPage.Open navigation checkbox
    StartPage.Click inventory in checkbox
    sleep   2s
    Inventory Page Should Be Open

Test#7.1 FunctionalTestInventoryButton
    [documentation]  This test case verifies functional inventory button
    [tags]  TC7
    StartPage.Click inventory button
    sleep   2s
    Inventory Page Should Be Open

Test#7.2 FunctionalTestToolsButton
    [documentation]  This test case verifies functional tools button in checkbox
    [tags]  TC7
    StartPage.Open navigation checkbox
    StartPage.Click tools
    sleep   2s
    Administrative tools Page Should Be Open


Test#7.3 FunctionalTestSearch
    [documentation]  This test case verifies functional search field
    [tags]  TC7
    StartPage.Open search checkbox
    StartPage.Check find country
    StartPage.Open search checkbox
    StartPage.Check find city
    StartPage.Open search checkbox
    StartPage.Check find building
    StartPage.Open search checkbox
    StartPage.Check find floor
    StartPage.Open search checkbox
    StartPage.Check find room
    StartPage.Open search checkbox
    StartPage.Check find rack
    StartPage.Open search checkbox
    StartPage.Check find device
    StartPage.Open search checkbox
    StartPage.Check find POS terminal
    StartPage.Open search checkbox
    StartPage.Check find pay box
    StartPage.Open search checkbox
    StartPage.Check find ATM
    sleep   2s


