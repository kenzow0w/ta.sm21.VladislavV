*** Settings ***
Library    SeleniumLibrary
Resource     ../Utils.robot
Resource    ../LoginPage.robot
Resource    ../RegistrationPage.robot
Resource    ../StartPage.robot
Resource    ../InventoryPage.robot
Suite Setup    Log      Test start
Suite Teardown      Log     Test end
Test Setup    Go to Inventory page
Test Teardown   Close Browser


*** Test Cases ***
Test#8 EnterInformationAboutEquipment
    [documentation]  This test case verifies that the user can select values from the dropdown and verify it
    [tags]  TC8
    Enter information about country    Brazil   Portuguese      2
    Choice tab