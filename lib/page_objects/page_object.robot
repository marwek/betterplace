*** Settings ***
Documentation                                    Default objects and keywords for the web page
Library                                          SeleniumLibrary
Resource                                         ../../resources/url.robot


*** Variables ***
${cookies_ok_button} =                           css:button[class="btn btn-primary btn-large flex-grow mb-3"]
${cookies_no_button} =                           css:button[class="btn btn-outline btn-large flex-grow mb-3"]


*** Keywords ***
Accept Cookies
    [Documentation]    Accept cookies popup when visible
    ${visible}    ${error} =    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${cookies_ok_button}
    Run Keyword If    '${visible}' == 'PASS'    Click Element    ${cookies_ok_button}

Decline Cookies
    [Documentation]    Accept cookies popup when visible
    ${visible}    ${error} =    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${cookies_no_button}
    Run Keyword If    '${visible}' == 'PASS'    Click Element    ${cookies_no_button}