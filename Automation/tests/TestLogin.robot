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

*** Test Cases ***
Test#7 FunctionalTestInventoryButton
    [documentation]  This test case verifies that the user can select values from the dropdown and verify it
    [tags]  TC7
    StartPage.Open navigation checkbox
    StartPage.Click inventory in checkbox
    sleep   2s
    Inventory Page Should Be Open