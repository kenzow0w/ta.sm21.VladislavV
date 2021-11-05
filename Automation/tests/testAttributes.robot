*** Settings ***
Library    SeleniumLibrary
Resource    ../service/InventoryPage.robot
Suite Setup    Log to Console     Test start
Suite Teardown      Log to Console     Test end
Test Setup    Go to Inventory page      ${username}       ${password}
Test Teardown   Close Browser

*** Variables ***
${username}     Volodin_admin
${password}     Password123$

# robot -i TC13 testAttributes.robot
*** Test Cases ***
Test Case#13 - 1
    [Documentation]    This test case Check object types for attributes: Created By; Modified By; Created When; Modified when
    [tags]    TC13
    click link  xpath://*[.//text() = 'Ukraine']
    click link  xpath://*[.//text() = 'Parameters']
    Check attributes

Test Case#13 - 2
    [tags]    TC13
    click link  xpath://*[.//text() = 'Ukraine']
    click link  xpath://*[.//text() = 'Kiev']
    click link  xpath://*[.//text() = 'Parameters']
    Check attributes

Test Case#13 - 3
    [tags]    TC13
    click link  xpath://*[.//text() = 'Ukraine']
    click link  xpath://*[.//text() = 'Kiev']
    click link  xpath://*[.//text() = 'Building']
    click link  xpath://*[.//text() = 'Parameters']
    Check attributes

*** Keywords ***
Check attributes
    [tags]    TC13
    wait until page contains element  xpath://*[@class="attribute" and text()="Created By"]/following-sibling::td
    #check creater
    ${createdBy} =  Get Text  xpath://*[@class="attribute" and text()="Created By"]/following-sibling::td
    Log To Console  \n createdBy = ${createdBy}
    Should Not Contain  ${createdBy}  None
    #check time of create
    ${createdWhen} =  Get Text    xpath://*[@class="attribute" and text()="Created When"]/following-sibling::td
    Log To Console  \n createdWhen = ${createdWhen}
    Should Not Contain  ${createdWhen}  None
    #check modificator
    ${modifiedBy} =  Get Text  xpath://*[@class="attribute" and text()="Modified By"]/following-sibling::td
    Log To Console  \n modifiedBy = ${modifiedBy}
    Should Not Contain  ${modifiedBy}  None
    #check time of edit
    ${modifiedWhen} =  Get Text  xpath://*[@class="attribute" and text()="Modified When"]/following-sibling::td
    Log To Console  \n modifiedWhen = ${modifiedWhen}
    Should Not Contain  ${modifiedWhen}  None
    sleep       3s
    click link          class=logout