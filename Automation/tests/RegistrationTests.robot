*** Settings ***
Library    SeleniumLibrary
Resource     ../Utils.robot
Resource    ../LoginPage.robot
Resource    ../RegistrationPage.robot
Resource    ../StartPage.robot
Resource    ../InventoryPage.robot
Suite Setup    Log      Test start
Suite Teardown      Log     Test end
Test Setup    Go to Registration Page
Test Teardown   Close Browser


*** Variables ***
${user}         Useeexeerzxcaasdq12x3an1b4w1s2q421o4

# robot -i TC1 RegistrationTests.robot
# robot -i TC2 RegistrationTests.robot
# robot -i TC3456 RegistrationTests.robot

*** Test Cases ***
Test#1 SuccessRegistration
    [documentation]  This test case verifies that the user success registration
    [tags]  TC1
    Fills registration form
    Registration Set Username        ${user}
    sleep    3s
    make screenshot    test1_step1
    Click registration
    Login Page Should Be Open
    sleep   3s
    make screenshot    test1_step2
    LoginPage.Fills login form      ${user}        ${passwordField}
    LoginPage.Click login
    Start Page Should Be Open
    sleep   1s
    make screenshot    test1_step3


Test#2 testNecessaryUserNameField
    [documentation]  This test case verifies that username field must have at least 1 digit letter
    [tags]  TC2
    Fills registration form
    sleep    2s
    Registration Set Username        Usernamefieldpokemon            #<<<     username musn't repeat        don't work. will be success registration.
    make screenshot    test2_step1
    Click registration
    Registration Page Should Be Open
    element text should be      //*[@id="registerForm"]/table/tbody/tr[1]/td[3]/span        Login must not be empty.
    make screenshot    test2_step2

Test#2.1 testNecessaryUserNameField
    [documentation]  This test case verifies that username field must have at least 1 Latin letter
    [tags]  TC2
    Fills registration form
    sleep    2s
    Registration Set Username        1234567891011121314            #<<<     username musn't repeat         don't work. will be success registration.
    make screenshot    test2.1_step1
    Click registration
    Registration Page Should Be Open
    element text should be      //*[@id="registerForm"]/table/tbody/tr[1]/td[3]/span        Login must not be empty.
    make screenshot    test2.2_step2


Test#3.1 testNecessaryPasswordField
    [documentation]  This test case verifies requirements for password field
    [tags]  TC3456
    Fills registration form
    Registration Set Username      UserName123      #<<<     username musn't repeat
    sleep       2s
    Registration Set Password    ${EMPTY}
    make screenshot    test3.1_step1
    Click registration
    Registration Page Should Be Open
    element text should be      //span[@class='error']        Please enter password.
    make screenshot    test3.1_step2


Test#3.2 testRequirementPasswordField
    [documentation]  This test case verifies requirements for password field
    [tags]  TC3456
    Fills registration form
    Registration Set Username      UserName123      #<<<     username musn't repeat
    sleep       2s
    Registration Set Password    pass
    make screenshot    test3.2_step1
    Click registration
    Registration Page Should Be Open
    element text should be      //span[@class='error']        Password length must me >= 8 and <= 50.
    make screenshot    test3.2_step2


Test#3.3 testRequirementPasswordField2
    [documentation]  This test case verifies requirements for password field
    [tags]  TC3456
    Fills registration form
    Registration Set Username      UserName123      #<<<     Username musn't repeat
    sleep       2s
    Registration Set Password    password123
    make screenshot    test3.3_step1
    Click registration
    Registration Page Should Be Open
    element text should be      //span[@class='error']      At least one upper letter must be in password
    make screenshot    test3.3_step2

Test#3.4 testRequirementPasswordField3
    [documentation]  This test case verifies requirements for password field
    [tags]  TC3456
    Fills registration form
    Registration Set Username      UserName123      #<<<     Username musn't repeat
    sleep       2s
    Registration Set Password    PASSWORD123
    make screenshot    test3.4_step1
    Click registration
    Registration Page Should Be Open
    element text should be      //span[@class='error']      At least one lower letter must be in password
    make screenshot    test3.4_step2

Test#3.5 testRequirementPasswordField4
    [documentation]  This test case verifies requirements for password field
    [tags]  TC3456
    Fills registration form
    Registration Set Username      UserName123      #<<<     Username musn't repeat
    sleep       2s
    Registration Set Password    PASSWORd
    make screenshot    test3.5_step1
    Click registration
    Registration Page Should Be Open
    element text should be      //span[@class='error']      At least one digit must be in password
    make screenshot    test3.5_step2


Test#3.6 testRequirementPasswordField5
    [documentation]  This test case verifies requirements for password field
    [tags]  TC3456
    Fills registration form
    Registration Set Username      UserName123      #<<<     Username musn't repeat
    sleep       2s
    Registration Set Password    PASSWORd1
    make screenshot    test3.6_step1
    Click registration
    Registration Page Should Be Open
    element text should be      //span[@class='error']      At least one non alpha numeric symbol must be in password
    make screenshot     test3.6_step2

Test#3.7 testRequirementPasswordField6
    [documentation]  This test case verifies requirements for password field
    [tags]  TC3456
    Fills registration form
    Registration Set Username      UserName123      #<<<     Username musn't repeat
    sleep       2s
    Registration Set Password    PASSWORd1234$
    make screenshot    test3.7_step1
    Click registration
    Registration Page Should Be Open
    element text should be      //span[@class='error']      Password must match confirm password.
    make screenshot     test3.7_step2

Test#4 testNecessaryEmailField
    [documentation]  This test case verifies that email field is necessary
    [tags]  TC3456
    Fills registration form
    Registration Set Username      UserName123      #<<<     Username musn't repeat
    sleep       2s
    Registration Set Email    ${EMPTY}
    make screenshot    test4_step1
    Click registration
    Registration Page Should Be Open
    element text should be      //span[@class='error']      email field can't be empty
    make screenshot     test4_step2


Test#5 testNotNecessaryRoleField
    [documentation]  This test case verifies functional options role field
    [tags]  TC3456
    Fills registration form
    Registration Set Username      UserName123      #<<<     Username musn't repeat
    sleep       2s
    Registration Set Role    2
    make screenshot    test5_step1
    list selection should be     id=registerForm:role       Admin
    Registration Set Role    1
    make screenshot    test5_step2
    list selection should be     id=registerForm:role       Read / Write
    Registration Set Role    0
    make screenshot    test5_step3
    list selection should be     id=registerForm:role       Read Only


