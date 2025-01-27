*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}             http://localhost:7272/Form.html
${COMPLETE_URL}         http://localhost:7272/Complete.html
${BROWSER}              Chrome
${CHROMEDRIVER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chromedriver.exe

*** Test Cases ***

Test Case 1: Valid Input
    [Documentation]  Ensure the form accepts valid input and redirects to the completion page.
    Open Browser    ${BASE_URL}    ${BROWSER}    service.executable_path=${CHROMEDRIVER_PATH}
    Input Text    id=firstname    Somsong
    Input Text    id=lastname     Sandee
    Input Text    id=destination  Europe
    Input Text    id=contactperson   Sodsai Sandee
    Input Text    id=relationship    Mother
    Input Text    id=email       somsong@kkumail.com
    Input Text    id=phone       081-111-1234
    Click Button  id=submitButton
    Wait Until Page Contains Element    //h1[text()='Our agent will contact you shortly.']
    Page Should Contain    Completed
    Close Browser

Test Case 2: Missing Destination
    [Documentation]  Ensure the form shows an error when the destination field is empty.
    Open Browser    ${BASE_URL}    ${BROWSER}    service.executable_path=${CHROMEDRIVER_PATH}
    Input Text    id=firstname    Somsong
    Input Text    id=lastname     Sandee
    Input Text    id=contactperson   Sodsai Sandee
    Input Text    id=relationship    Mother
    Input Text    id=email       somsong@kkumail.com
    Input Text    id=phone       081-111-1234
    Click Button  id=submitButton
    Page Should Contain    *Please enter your destination.
    Close Browser

Test Case 3: Invalid Email Format
    [Documentation]  Ensure the form shows an error for invalid email formats.
    Open Browser    ${BASE_URL}    ${BROWSER}    service.executable_path=${CHROMEDRIVER_PATH}
    Input Text    id=firstname    Somsong
    Input Text    id=lastname     Sandee
    Input Text    id=destination  Europe
    Input Text    id=contactperson   Sodsai Sandee
    Input Text    id=relationship    Mother
    Input Text    id=email       somsong@
    Input Text    id=phone       081-111-1234
    Click Button  id=submitButton
    Page Should Contain    *Please enter a valid email!!
    Close Browser

Test Case 4: Missing Phone Number
    [Documentation]  Ensure the form shows an error when the phone number field is empty.
    Open Browser    ${BASE_URL}    ${BROWSER}    service.executable_path=${CHROMEDRIVER_PATH}
    Input Text    id=firstname    Somsong
    Input Text    id=lastname     Sandee
    Input Text    id=destination  Europe
    Input Text    id=contactperson   Sodsai Sandee
    Input Text    id=relationship    Mother
    Input Text    id=email       somsong@kkumail.com
    Click Button  id=submitButton
    Page Should Contain    *Please enter a phone number!!
    Close Browser

Test Case 5: Invalid Phone Number Format
    [Documentation]  Ensure the form shows an error for invalid phone number formats.
    Open Browser    ${BASE_URL}    ${BROWSER}    service.executable_path=${CHROMEDRIVER_PATH}
    Input Text    id=firstname    Somsong
    Input Text    id=lastname     Sandee
    Input Text    id=destination  Europe
    Input Text    id=contactperson   Sodsai Sandee
    Input Text    id=relationship    Mother
    Input Text    id=email       somsong@kkumail.com
    Input Text    id=phone       191
    Click Button  id=submitButton
    Page Should Contain    *Please enter a valid phone number!!
    Close Browser

Test Case 6: Missing Contact Person
    [Documentation]  Ensure the form shows an error when the contact person field is empty.
    Open Browser    ${BASE_URL}    ${BROWSER}    service.executable_path=${CHROMEDRIVER_PATH}
    Input Text    id=firstname    Somsong
    Input Text    id=lastname     Sandee
    Input Text    id=destination  Europe
    Input Text    id=relationship    Mother
    Input Text    id=email       somsong@kkumail.com
    Input Text    id=phone       081-111-1234
    Click Button  id=submitButton
    Page Should Contain    *Please enter a contact person’s name!!
    Close Browser
