*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}   chrome
${NEW_TAB}  chrome://newtab/
${SELSPEED}  1.5s
${CITY}  Vilnius
${MAX_window}  Maximize Browser Window
${INDEX}  2
${minValue}  9999
${minIndex}  9999
${PRICE}  0
${ADDRESS}
${EMAIL_NAME}  work.selenium@gmail.com
${PASSWORD}  Selenium1]
*** Test Cases ***
robotframework-testing_selenium
    [Setup]  Run Keywords  Open Browser  http://www.degalukainos.lt/  ${BROWSER}
    ...              AND   Set Selenium Speed  ${SELSPEED}  AND  ${MAX_window}
    click    id=city
    Select From List By Label  id=city  ${CITY}
    click    xpath=//input[@value='Ieškoti']
    ${PRICE}=  storeText    xpath=/html/body/div[1]/div[2]/div[2]/div/form/div/div[2]/table/tbody/tr[${INDEX}]/td[5]    ${PRICE}
    WHILE  "${PRICE}"!="-"
        IF    ${PRICE} < ${minValue}
            ${minValue}=  store  ${minValue}  ${PRICE}
            ${minIndex}=  store  ${minIndex}  ${INDEX}
        END
        ${INDEX}=  Evaluate  ${INDEX} + 1
        ${PRICE}=  storeText    xpath=/html/body/div[1]/div[2]/div[2]/div/form/div/div[2]/table/tbody/tr[${INDEX}]/td[5]    ${PRICE}
        ${ADDRESS}=  storeText    xpath=/html/body/div[1]/div[2]/div[2]/div/form/div/div[2]/table/tbody/tr[${minIndex}]/td[3]    ${ADDRESS}
    END
    open    ${NEW_TAB}
    open    https://accounts.google.com/ServiceLogin?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service%27%27=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin
    Sleep    3
    click    id=identifierId
    type    id=identifierId    ${EMAIL_NAME}
    click    xpath://div[@id='identifierNext']/div/button/span
    Sleep    3
    click    xpath:/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div/form/span/section/div/div/div[1]/div[1]/div/div/div/div/div[1]/div/div[1]
    type    xpath://*[@id="password"]/div[1]/div/div[1]/input    ${PASSWORD}
    click    xpath://*[@id="passwordNext"]
    click    xpath:/html[1]/body[1]/div[7]/div[3]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]
    Sleep    2
    click   class:eV
    Press Keys  class:eV  ${EMAIL_NAME}
    Sleep    2
    Mouse Over  xpath:/html/body/div[7]/div[3]/div/div[1]/div[3]/header/div[2]/div[2]/div[2]
    Click  xpath:/html/body/div[7]/div[3]/div/div[1]/div[3]/header/div[2]/div[2]/div[2]
    Mouse Over    css:div[aria-label='Pranešimo turinys']
    Click Element    css:div[aria-label='Pranešimo turinys']
    Press Keys  css:div[aria-label='Pranešimo turinys']    ${ADDRESS}, ${minValue}
    Mouse Over    xpath://div[@aria-label='Siųsti ‪(Ctrl –Enter)‬']
    Click Element  xpath://div[@aria-label='Siųsti ‪(Ctrl –Enter)‬']
    #    [Teardown]  Close Browser

*** Keywords ***
open
    [Arguments]    ${element}
    Go To          ${element}

clickAndWait
    [Arguments]    ${element}
    Click Element  ${element}

click
    [Arguments]    ${element}
    Click Element  ${element}

sendKeys
    [Arguments]    ${element}    ${value}
    Press Keys     ${element}    ${value}

submit
    [Arguments]    ${element}
    Submit Form    ${element}

type
    [Arguments]    ${element}    ${value}
    Input Text     ${element}    ${value}

selectAndWait
    [Arguments]        ${element}  ${value}
    Select From List By Value    ${element}  ${value}
select
    [Arguments]        ${element}  ${value}
    Select From List By Value    ${element}  ${value}
verifyValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

verifyTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertConfirmation
    [Arguments]                  ${value}
    Alert Should Be Present      ${value}

assertText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

assertTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

waitForTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

doubleClick
    [Arguments]           ${element}
    Double Click Element  ${element}

doubleClickAndWait
    [Arguments]           ${element}
    Double Click Element  ${element}

goBack
    Go Back

goBackAndWait
    Go Back

runScript
    [Arguments]         ${code}
    Execute Javascript  ${code}

runScriptAndWait
    [Arguments]         ${code}
    Execute Javascript  ${code}

setSpeed
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

setSpeedAndWait
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

verifyAlert
    [Arguments]              ${value}
    Alert Should Be Present  ${value}

waitForPageToLoad
    [Arguments]   ${value}
    Sleep    ${value}

storeText
    [Arguments]  ${element}  ${variable}
    ${temp}=  Get Text    ${element}
    ${variable}=  Set Variable  ${temp}
    [Return]  ${variable}

store
    [Arguments]  ${elem_minPrice}  ${var_price}
    ${elem_minPrice}=  Set Variable  ${var_price}
    [Return]  ${elem_minPrice}