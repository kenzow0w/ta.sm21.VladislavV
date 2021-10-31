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

#robot -i TC8 TestCreateObject.robot

*** Test Cases ***
Test#9 EnterInformationAboutEquipment
    [documentation]  This test case verifies enter information about equipment
    [tags]  TC9
    Enter information about country    Ukraine   Ukrainian      0
    Click save
    Open next tab
    sleep   2s
    Enter information about city      Kiev        2000000     0
    Click save
    Open next tab
    Enter information about building    Building    Stara-zagora    137     5      0
    Click save
    Choice tab              ${TABELEMENT}[1]
    Create object           ${TABELEMENT}[1]

