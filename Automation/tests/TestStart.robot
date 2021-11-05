*** Settings ***
Library    SeleniumLibrary
Resource     ../service/Utils.robot
Resource    ../service/StartPage.robot
Resource    ../service/SearchFunctional.robot
Suite Setup    Log to Console      Test start
Suite Teardown      Log to Console     Test end
Test Setup    StartPage.Go to Start Page        ${username}       ${password}
Test Teardown   Close Browser

*** Variables ***
${username}     User123
${password}     Password123$

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
    [tags]  TC7.1
    StartPage.Open search checkbox
    SearchFunctional.Check find country
    make screenshot    test7.3_step1
    StartPage.Open search checkbox
    SearchFunctional.Check find city
    StartPage.Open search checkbox
    SearchFunctional.Check find building
    StartPage.Open search checkbox
    SearchFunctional.Check find floor
    StartPage.Open search checkbox
    SearchFunctional.Check find room
    StartPage.Open search checkbox
    SearchFunctional.Check find rack
    StartPage.Open search checkbox
    SearchFunctional.Check find device
    StartPage.Open search checkbox
    SearchFunctional.Check find POS terminal
    StartPage.Open search checkbox
    SearchFunctional.Check find pay box
    StartPage.Open search checkbox
    SearchFunctional.Check find ATM
    sleep   2s

