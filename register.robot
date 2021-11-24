*** Settings ***
Documentation    Play around with selenium library
...              more documentation
Library          SeleniumLibrary
Library          DateTime 


*** Variables ***
${SITE_URL}        https://vaccine-haven.herokuapp.com/
${REGISTER_URL}    https://vaccine-haven.herokuapp.com/registration
${BROWSER}         Chrome
${CITIZEN_ID}      9621054671484
${FIRST_NAME}      Anusid 
${LAST_NAME}       Wachiracharoenwong
${BIRTH_DATE}      12102001  
${OCCUPATION}      Student
${PHONE_NUMBER}    0634566528
${ADDRESS}         18/149 The Selected Kaset-Ngamwongwan by LPN Ngamwongwan Road, Lad Yao, Chatuchak, Bangkok


*** Keywords ***
# user defined expressions and actions

Open Application
    Open Browser          ${SITE_URL}    ${BROWSER}
    SET SELENIUM SPEED    0.5 seconds

Go To Register Page
    Click Element    id:register__link

Input Registration Information
    Input Text      id:citizen_id        ${CITIZEN_ID} 
    Input Text      id:name              ${FIRST_NAME} 
    Input Text      id:surname           ${LAST_NAME} 
    Input Text      id:birth_date        ${BIRTH_DATE} 
    Input Text      id:occupation        ${OCCUPATION} 
    Input Text      id:phone_number      ${PHONE_NUMBER} 
    Input Text      id:address           ${ADDRESS}
    Click Button    id:register__btn 


*** Test Cases ***
Navigate to Home Page
    Open Application
    Title Should Be     Vaccine Haven

Register on the Service Taker site
    Go To Register Page
    Page Should Contain               Citizen Registration
    Input Registration Information
    Wait Until Page Contains Element    id:splash-img
    [Teardown]                        Close Browser

