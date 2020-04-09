*** Keywords ***
Begin Web Test
    Open Browser            about:blank  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed      0.2

Go to Web Page
    Load Page
    Verify Page Loaded

Load Page
    Go to                   ${URL}

Verify Page Loaded
    ${link_text} =    Get Text   id:title
    Should Be Equal   ${link_text}   Infotiv Car Rental

Search for Product
    [Arguments]         ${search_term}   ${search_result}
    Enter Search Term    ${search_term}
    Submit Search
    Verify Search Completed   ${search_term}   ${search_result}

Verfy Create User Loaded
    ${link_text} =    Get Text   id:questionText
    Should Be Equal   ${link_text}   Create a new user

Create User
    [Arguments]         ${first_name}   ${last_name}   ${phone_number}   ${email}   ${password}
    Click Button         xpath://*[@id="createUser"]
    Verfy Create User Loaded
    Enter First Name     ${first_name}
    Enter Last Name      ${last_name}
    Enter Phonenumber       ${phone_number}
    Enter Email             ${email}
    Confirm Email           ${email}
    Enter Password          ${password}
    Confirm Password        ${password}
    Click Button         xpath://*[@id="create"]

Verify Email Taken
    ${link_text} =          Get Text   id:signInError
    Should Be Equal         ${link_text}   That E-mail is already taken

Verfy User Is Created
    ${link_text} =    Get Text   id:questionText
    Should Be Equal   ${link_text}   When do you want to make your trip?


Enter First Name
    [Arguments]         ${search_term}
    Input Text          id:name       ${search_term}

Enter Last Name
    [Arguments]         ${search_term}
    Input Text          id:last       ${search_term}

Enter Phonenumber
    [Arguments]         ${search_term}
    Input Text          id:phone       ${search_term}

Enter Email
    [Arguments]         ${search_term}
    Input Text          id:emailCreate       ${search_term}

Confirm Email
    [Arguments]         ${search_term}
    Input Text          id:confirmEmail       ${search_term}

Enter Password
    [Arguments]         ${search_term}
    Input Text          id:passwordCreate       ${search_term}

Confirm Password
    [Arguments]         ${search_term}
    Input Text          id:confirmPassword       ${search_term}

User is Logged in
    [Arguments]          ${email}   ${password}  ${search_term}
    Go to Web Page
    Input email and password  ${email}     ${password}
    Log in success        ${search_term}

Log in success
    [Arguments]          ${search_term}
    Verify login page    ${search_term}

Input email and password
    [Arguments]          ${email}   ${password}
    Enter Email_login            ${email}
    Enter Password_login          ${password}
    Click Button         xpath://*[@id="login"]

Log in fail
    [Arguments]          ${email}   ${password}  ${search_term}
    Enter Email_login            ${email}
    Enter Password_login          ${password}
    Click Button         xpath://*[@id="login"]

Log out
    [Arguments]                 ${email}   ${password}  ${search_term}
    Enter Email_login           ${email}
    Enter Password_login        ${password}
    Click Button                xpath://*[@id="login"]
    Verify login page           ${search_term}
    Click Button                xpath://*[@id="logout"]

Verify login fail page
    ${link_text} =    Get Text   id:signInError
    Should Be Equal   ${link_text}   Wrong e-mail or password

Enter Email_login
    [Arguments]         ${search_term}
    Input Text          id:email       ${search_term}

Enter Password_login
    [Arguments]         ${search_term}
    Input Text          id:password       ${search_term}

Verify login page
    [Arguments]          ${search_term}
    ${expected_result} =   Set Variable    You are signed in as ${search_term}
    ${actual_term} =       Get Text        xpath://*[@id="welcomePhrase"]
    ${actual_result} =     Set Variable     ${actual_term}
    Should Be Equal       ${expected_result}    ${actual_result}

Enter Search Term
    [Arguments]         ${search_term}
    Input Text          id:twotabsearchtextbox   ${search_term}

Submit Search
    Click Button         xpath://*[@id="nav-search"]/form/div[2]/div/input


Verify Search Completed
    [Arguments]         ${search_term}   ${search_result}
    ${result_text} =    Set Variable   results for "${search_term}"
    Should Be Equal     ${result_text}   ${search_result}


User Book a Car
    [Arguments]           ${card_number}  ${card_name}  ${card_cvc}
    Click Button          id:continue
    Booking page loaded
    Click Button          id:bookQ7pass5
    Confirm page loaded
    Enter card number       ${card_number}
    Enter card name         ${card_name}
    Enter cvc               ${card_cvc}
    Click Button            id:confirm

Booking page loaded
    ${expected_result} =        Set Variable   What would you like to drive?
    ${actual_term} =            Get Text   id:questionText
    Should Be Equal             ${expected_result}   ${actual_term}

Confirm page loaded
    ${expected_result} =        Set Variable   Confirm booking of Audi Q7
    ${actual_term} =            Get Text    id:questionText
    Should Be Equal             ${expected_result}   ${actual_term}

Enter card number
    [Arguments]                 ${card_number}
    Input Text                  id:cardNum   ${card_number}

Enter card name
    [Arguments]                 ${card_name}
    Input Text                  id:fullName      ${card_name}

Enter cvc
    [Arguments]                 ${card_cvc}
    Input Text                  id:cvc     ${card_cvc}

Verify Booked Page Loaded
    ${CurrentDate} =            Get Current Date   result_format=%Y-%m-%d
    ${expected_result} =        Set Variable  A Audi Q7 is now ready for pickup ${CurrentDate}
    ${actual_term} =            Get Text   id:questionTextSmall
    Should Be Equal             ${expected_result}   ${actual_term}

Delete booking
    Click Button                id:mypage
    Click Button                id:unBook1
    Handle Alert

End Web Test
    Close Browser