*** Settings ***
Documentation  This is some basic info about the whole test suite
Resource        ../Resources/keywords.robot
Library  SeleniumLibrary
Library  DateTime
Test Setup      Begin Web Test
Test Teardown   End Web Test

*** Variables ***
${BROWSER} =  chrome
${URL} =   http://rental24.infotiv.net/
${firstname} =  Kate
${lastname} =  James
${email} =  helfofdi@gmail.com
${password} =  26278397
${phone_number} =  7237823898

*** Test Cases ***
User can access infotiv Car Rental
    [Documentation]             Access to Infotiv Car Rental
    [Tags]                      Test 1
    Go to Web Page

User cannot create user account
    [Documentation]             Create user
    [Tags]                      Test 2
    Go to Web Page
    Create User                 ${firstname}   ${lastname}    ${phone_number}    ${email}   ${password}
    Verify Email Taken

User can log in
    [Documentation]             Log in success
    [Tags]                      Test 3
    Given Go to Web Page
    When Input email and password           ${email}    ${password}
    Then log in success                     ${firstname}

User can not log in
    [Documentation]             Log in fail
    [Tags]                      Test 4
    Go to Web Page
    Log in fail                   ${email}    262783      ${firstname}
    Verify login fail page

User log out
    [Documentation]             Log out
    [Tags]                      Test 5
    Go to Web Page
    Log out                     ${email}     ${password}      ${firstname}
    Page Should Contain Button  xpath://*[@id="login"]

User can book car
    [Documentation]             Book car
    [Tags]                      Test 6
    [Teardown]                  Delete booking

    Given User is Logged in               ${email}   ${password}  ${firstname}
    When User Book a Car                 1234567898765432  ${firstname}   123
    Then Verify Booked Page Loaded







