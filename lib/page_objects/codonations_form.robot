*** Settings ***
Documentation                                    Codonation form page object elements
Library                                          SeleniumLibrary
Library                                          FakerLibrary
Resource                                         page_object.robot


*** Variables ***
${codonations_button} =                          xpath://div[@class="donations-form-codonation-selection"]/button
${close_modal_button} =                          css:button[class="modal-close"]
${codonation_value} =                            css:input[class="form-control"]
${submit_codonation_button} =                    css:button[class="btn btn-primary"]
${amount_button} =                               css:div.predefined-amount-box.has-show-buttons-hovered


*** Keywords ***
Choose Additional Donation
    [Documentation]    Click additional donation
    Element Should Be Visible    ${codonations_button}
    Click Element    ${codonations_button}

Close Codonations Form
    [Documentation]    Close codonations form popup
    Element Should Be Visible    ${close_modal_button}
    Click Element    ${close_modal_button}

Select Random Amount
    [Documentation]    Select random codonation button
    @{elements} =    Get WebElements    ${amount_button}
    ${random} =    Evaluate    random.randint(0, 3)
    Click Element    ${elements}[${random}]

Enter Additional Amount
    [Documentation]    Enter additional amount of money to donation
    [Arguments]    ${amount}
    Element Should Be Visible    ${codonation_value}
    Clear Element Text    ${codonation_value}
    Input Text    ${codonation_value}    ${amount}

Submit Additional Donation
    [Documentation]    Click submit button
    Element Should Be Visible    ${submit_codonation_button}
    Click Element    ${submit_codonation_button}