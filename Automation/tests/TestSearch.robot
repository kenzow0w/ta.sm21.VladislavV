*** Settings ***
Library    SeleniumLibrary
Resource    ../service/StartPage.robot
Resource    ../service/SearchFunctional.robot
Suite Setup    Log to Console      Test start
Suite Teardown      Log to Console     Test end
Test Setup    StartPage.Go to Start Page        ${username}       ${password}
Test Teardown   Close Browser

*** Variables ***
${username}     User123
${password}     Password123$


#robot -i TC11 TestSearch.robot
*** Test Cases ***
Test#11 FunctionalTestSearch
    [documentation]  This test case verifies thath in search field you can enter something data
    [tags]  TC11
    StartPage.Input text and search    Brazil
    sleep    5s
    title should be    Generic Search

Test#12 FunctionalTestSearch
    [documentation]  This test case verifies functional search field
    [tags]  TC12    #Russia country must be exist.
    StartPage.Open search checkbox
    SearchFunctional.Check find country
    Enter data about country and search     Ukraine      1       Ukrainian     2

Test#12.1 FunctionalTestSearch
    [documentation]  This test case verifies functional search field
    [tags]  TC12.1    #Ukraine country must be exist.
    StartPage.Open search checkbox
    SearchFunctional.Check find city
    SearchFunctional.Enter data about city and search     Kiev      1       500000     1       0

Test#12.2 FunctionalTestSearch
    [documentation]  This test case verifies functional search field
    [tags]  TC12.2
    StartPage.Open search checkbox
    SearchFunctional.Check find room
    SearchFunctional.Enter data about room and search     1      0       1     1


