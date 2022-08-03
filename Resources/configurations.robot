*** Settings ***
Library  SeleniumLibrary
Variables  global_variables.py
*** Variables ***
*** Keywords ***
StartBrowserAndMaximizeAndSpeed
    Open Browser  ${GAS_PRICE_URL}  ${BROWSER}
    Set Selenium Speed  1.5
    Maximize Browser Window

closeBrowserWindow
    Close Browser