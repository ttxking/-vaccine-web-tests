*** Settings ***
Documentation    Play around with selenium library
...              more documentation
Library          SeleniumLibrary

*** Variables ***
${SITE_URL}        https://vaccine-haven.herokuapp.com/
${BROWSER}         Chrome
${CITIZEN_ID}      9621054671484
${SITE_NAME}       OGYHSite
${VACCINE_NAME}    Pfizer


*** Keywords ***
# user defined expressions and actions

Open Application
    Open Browser       ${SITE_URL}      ${BROWSER}
    Title Should Be    Vaccine Haven

Verify Your Information Section
    Page Should Contain                 Your Information
    Page Should Contain                 See your reserved vaccine.
    Wait Until Page Contains Element    id:check_info__link

Verify Vaccine Site Section
    Page Should Contain                 Vaccine Site
    Page Should Contain                 See the Vaccine site information.
    Wait Until Page Contains Element    id:check_site__link

Visit Vaccine Reservation Page
    Click Button           Reserve Vaccine
    Page Should Contain    Vaccine Reservation

Input Vaccine Reservation Information
    Input Text                   id:citizen_id      ${CITIZEN_ID} 
    Select From List By Value    id:site_name       ${SITE_NAME}
    Select From List By Value    id:vaccine_name    ${VACCINE_NAME}
    Click Button                 Submit

Input Citizen ID and submit
    Input Text                  id:citizen_id                      ${CITIZEN_ID} 
    Click Button                Submit
    Wait Until Page Contains    Vaccine Reservation Information

Visit My Info page through nav
    Click Element               id:nav__info__link

Verify Reservation Information
    Page Should Contain Element    id:reserve_vaccine_value    
    Page Should Contain            ${VACCINE_NAME}
    Page Should Contain Element    id:reserve_site_value 
    Page Should Contain            ${SITE_NAME}

Make Cancellation
    Click Button          Cancel
    Location Should Be    https://vaccine-haven.herokuapp.com/info

Verify Cancellation
    Page Should Contain Element    id:reserve_vaccine_value    
    Page Should Contain            ""
    Page Should Contain Element    id:reserve_site_value 
    Page Should Contain            ""


*** Test Cases ***

Test verify 2 item on Home page
    SET SELENIUM SPEED                  0.5 seconds
    Open Application                    
    Verify Your Information Section 
    Verify Vaccine Site Section

Test Make Reservation
    SET SELENIUM SPEED                       0.5 seconds
    Visit Vaccine Reservation Page           
    Input Vaccine Reservation Information
    Visit My Info Page through nav
    Input Citizen ID and submit
    Verify Reservation Information

Test Cancellation
    SET SELENIUM SPEED    0.5 seconds
    Visit My Info Page through nav
    Input Citizen ID and submit
    Verify Cancellation
    [Teardown]                               Close Browser