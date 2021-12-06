*** Settings ***
Documentation                                    Payment page object elements
Resource                                         page_object.robot
Library                                          SeleniumLibrary


*** Variables ***
${direct_deposit_radio} =                        xpath://label[@for="direct_deposit"]
${paydirekt_radio} =                             xpath://label[@for="paydirekt"]
${stripe_cc_radio} =                             xpath://label[@for="stripe_cc"]
${stripe_sepa_debit_radio} =                     xpath://label[@for="stripe_sepa_debit"]
${paypal_radio} =                                xpath://label[@for="paypal"]
${payment_webelement} =                          css:div[class="donation-form-payment-method-links mb-3"]


*** Keywords ***
Select Paypal Payment
    [Documentation]    Select PayPal as payment method
    Wait Until Element Is Visible    ${paypal_radio}
    Click Element    ${paypal_radio}

Select SEPA Payment
    [Documentation]    Select SEPA as payment method
    Wait Until Element Is Visible    ${stripe_sepa_debit_radio}
    Click Element    ${stripe_sepa_debit_radio}

Select Credit Card Payment
    [Documentation]    Select credit card as payment method
    Wait Until Element Is Visible    ${stripe_cc_radio}
    Click Element    ${stripe_cc_radio}

Select Giropay Payment
    [Documentation]    Select Giropay/Paydirekt as payment method
    Wait Until Element Is Visible    ${paydirekt_radio}
    Click Element    ${paydirekt_radio}

Select Direct Deposit Payment
    [Documentation]    Select direct deposit as payment method
    Wait Until Element Is Visible    ${direct_deposit_radio}
    Click Element    ${direct_deposit_radio}

