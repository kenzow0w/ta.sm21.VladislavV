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


#robot -i TC8,10 TestInventory.robot
*** Test Cases ***
Test#10 ButtonEditEqualCreateObject2
    [documentation]  This test case verifies enter information about equipment
    [tags]  TC8,10
    Enter information about country    Brazil   Rio      2      #Brazil musn't be exist
    sleep   4s
    Click save
    Click edit data
    CLear fields about country
    Edit information about country    Russia   Moscow      0
    sleep   4s
    Click save
    title should be          Russia

Test#8 ButtonEditEqualCreateObject
    [documentation]  This test case verifies enter information about equipment
    [tags]  TC8,10
    Enter information about country    Brazil   Rio      2
    sleep   4s
    Click save
    Click edit data
    page should contain     Brazil
    sleep   4s
    Click save
    title should be          Brazil