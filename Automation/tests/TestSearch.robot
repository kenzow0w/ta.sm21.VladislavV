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


#robot -i TC11 TestSearch.robot
*** Test Cases ***
Test#11 FunctionalTestSearch
    [documentation]  This test case verifies thath in search field you can enter something data
    [tags]  TC11
    StartPage.Input text and search    Brazil
    sleep    5s
    title should be    Generic Search

Test#12FunctionalTestSearch
    [documentation]  This test case verifies functional search field
    [tags]  TC12
    StartPage.Open search checkbox
    StartPage.Search - Find Country    Ukraine       Ukrainian






