*** Settings ***
Documentation                                    Donations page object elements
Resource                                         page_object.robot
Library                                          SeleniumLibrary


*** Variables ***
${amount_input} =                                xpath://input[@name="amount_cents"]
${single_radio} =                                xpath://label[@for="single"]
${monthly_radio} =                               xpath://label[@for="monthly"]
${yearly_radio} =                                xpath://label[@for="yearly"]

*** Keywords ***
Add Donation
    [Documentation]    Input given donation amount
    [Arguments]    ${donation}
    # find better way to clear text in input field
    ${text} =    Get Value    ${amount_input}
    ${length} =    Get Length    ${text}
    FOR   ${i}    IN RANGE    ${length}
        Press Keys    ${amount_input}    BACKSPACE
    END
    Input Text    ${amount_input}    ${donation}
    Set Test Variable    ${donation}

Select Single Donation
    [Documentation]    Select single amount radio button
    Wait Until Element Is Visible    ${single_radio}
    Click Element    ${single_radio}

Select Monthly Donation
    [Documentation]    Select monthly amount radio button
    Wait Until Element Is Visible    ${monthly_radio}
    Click Element    ${monthly_radio}

Select Yearly Donation
    [Documentation]    Select yearly amount radio button
    Wait Until Element Is Visible    ${yearly_radio}
    Click Element    ${yearly_radio}

