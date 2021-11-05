*** Settings ***
Library    SeleniumLibrary
Resource    ../service/InventoryPage.robot
Suite Setup    Log to Console      Test start
Suite Teardown      Log to Console     Test end
Test Setup    Go to Inventory page      ${username}       ${password}
Test Teardown   Close Browser

#robot -i TC9 TestCreateObject.robot

*** Variables ***
${username}     Volodin_admin
${password}     Password123$
*** Test Cases ***
Test#1 EnterInformationAboutEquipment
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
    Choice tab              ${TABELEMENT}[1]
    Create object           ${TABELEMENT}[1]
    switch window       Create posterm
    Click save
    wait until page contains    post
    title should be    post
    click element           link:Building
    Choice tab      ${TABELEMENT}[2]
    Create object       ${TABELEMENT}[2]
    switch window       Create paybox
    Click save
    sleep       2s
    wait until page contains    box
    title should be    box
    click element       link: Inventory
    wait until element is visible    xpath://*[@id="j_idt76:tabView:j_idt89_data"]/tr[3]/td[1]/input
    sleep       3s
#    click element       xpath://*[@id="j_idt76:tabView:j_idt89_data"]/tr[3]/td[1]/input
#    sleep       4s
#    click delete
#    page should not contain    Ukraine

