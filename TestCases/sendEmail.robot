#TODO suvestu neteisinga elpasto sugeneruota pass, tada suvestu teisinga ir prisijungti viskas per python ir python koda (generavima slaptazodzio) priristi prie keyword robot
*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  BuiltIn
Library  ../Resources/password_generator.py
Variables  ../Resources/global_variables.py
Resource  ../Resources/configurations.robot

#Test Setup  StartBrowserAndMaximizeAndSpeed

#Test Teardown  closeBrowserWindow
*** Variables ***
${index}  2
${minValue}  99
${minIndex}  99
${price}  0
${address}
*** Test Cases ***
robotframework-testing_selenium
     ${value}=  RANDOM_PASSWORD
     Log To Console  ${value}
#    selectSpecificCityFuelStation
#    @{minPrice_address}=  fetchMinPriceAndAddress
#    openNewTabGmailLogin
#    loginToGmail
#    click    ${CREATE_LETTER_BUTTON}
#    inputGmailAddress
#    selectSearchBar
#    inputLetterContent  @{minPrice_address}
#    sendEmail
*** Keywords ***
open
    [Arguments]    ${element}
    Go To          ${element}

click
    [Arguments]    ${element}
    Click Element  ${element}

type
    [Arguments]    ${element}    ${value}
    Input Text     ${element}    ${value}

storeText
    [Documentation]  Storing text to variable from html element
    [Arguments]  ${element}  ${variable}
    ${temp}=  Get Text    ${element}
    ${variable}=  Set Variable  ${temp}
    [Return]  ${variable}

storeMinValue
    [Documentation]  Store minimum value
    [Arguments]  ${element_min}  ${variable}
    ${element_min}=  Set Variable  ${variable}
    [Return]  ${element_min}

fetchMinPriceAndAddress
    [Documentation]  fetch and sorted min price and address
    ${price}=  storeText    xpath=/html/body/div[1]/div[2]/div[2]/div/form/div/div[2]/table/tbody/tr[${index}]/td[5]    ${price}
    WHILE  "${price}"!="-"
        IF    ${price} < ${minValue}
            ${minValue}=  storeMinValue  ${minValue}  ${price}
            ${minIndex}=  storeMinValue  ${minIndex}  ${index}
        END
        ${index}=  Evaluate  ${index} + 1
        ${price}=  storeText    xpath=/html/body/div[1]/div[2]/div[2]/div/form/div/div[2]/table/tbody/tr[${index}]/td[5]    ${price}
        ${address}=  storeText    xpath=/html/body/div[1]/div[2]/div[2]/div/form/div/div[2]/table/tbody/tr[${minIndex}]/td[3]    ${address}
    END
    @{address_and_minValue}  Create List  ${address},${minValue}
    [Return]  @{address_and_minValue}

selectSpecificCityFuelStation
    click    ${CITY_LIST}
    Select From List By Label  ${CITY_LIST}  ${CITY}
    click    ${FIND_BUTTON}

openNewTabGmailLogin
    open     ${NEW_TAB}
    open     ${GMAIL_LOGIN_URL}
    Sleep    ${SLEEP_TIME}

loginToGmail
    click    ${BOX_LOGIN_NAME}
    type    ${BOX_LOGIN_NAME}    ${EMAIL_NAME}
    click    ${LOGIN_NAME_BUTTON_NEXT}
    Sleep    ${SLEEP_TIME}
    click  ${BOX_LOGIN_PASSWORD}
    type    ${BOX_LOGIN_PASSWORD}    ${PASSWORD}
    click    ${LOGIN_PASSWORD_BUTTON_NEXT}

inputGmailAddress
    click   ${EMAIL_TO_SEND_BOX}
    Press Keys  ${EMAIL_TO_SEND_BOX}  ${EMAIL_NAME}

selectSearchBar
    Mouse Over  ${DESELECT_EMAIL_NAME}
    Click  ${DESELECT_EMAIL_NAME}

inputLetterContent
    [Arguments]  @{minPrice_address}
    Mouse Over    ${EMAIL_TEXT_FIELD}
    Click Element    ${EMAIL_TEXT_FIELD}
    Press Keys  ${EMAIL_TEXT_FIELD}    @{minPrice_address}

sendEmail
    Mouse Over    ${GMAIL_SEND_BUTTON}
    Click Element  ${GMAIL_SEND_BUTTON}