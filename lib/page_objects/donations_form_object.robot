*** Settings ***
Documentation                                    Donation form page object elements
Library                                          SeleniumLibrary
Library                                          FakerLibrary
Library                                          Collections
Resource                                         page_object.robot
Resource                                         codonations_form.robot


*** Variables ***
${first_name} =                                  id:first_name
${last_name} =                                   id:last_name
${email} =                                       id:email
${message} =                                     id:message
${show_amount_checkbox} =                        id:show_amount
${show_name_checkbox} =                          id:show_user
${receipt_checkbox} =                            id:receiveReceipt
${country_dropdown} =                            id:country_alpha2
${zip_code} =                                    id:zip
${city} =                                        id:city
${address} =                                     css:input[name="street"]
${newsletter} =                                  id:subscribeToPlatformNewsletter
${submit_payment_button} =                       css:button[type="submit"]
${donation_summary_table} =                      xpath://table[@class="bpc-table donation-summary"]/tbody
${codonation_amount_text} =                      xpath://table[@class="bpc-table donation-summary"]/tbody/tr[1]/td[2]
${codonation_amount_total_text} =                xpath://table[@class="bpc-table donation-summary"]/tbody/tr[2]/td
${email_domain} =                                @betterplace.org


*** Keywords ***
Enter User First and Last Name
    [Documentation]    Enter first and last name
    Scroll Element Into View    ${first_name}
    Element Should Be Visible    ${first_name}
    Element Should Be Visible    ${last_name}
    ${first} =    First Name
    ${last} =    Last Name
    Set Test Variable    ${first}
    Set Test Variable    ${last}
    Input Text    ${first_name}    ${first}
    Input Text    ${last_name}    ${last}

Enter User Email
    [Documentation]    Enter user email
    Element Should Be Visible    ${email}
    ${username} =    User Name
    ${username_id} =    Ean 13
    ${user_email} =    Catenate    SEPARATOR=    ${username}    +    ${username_id}    ${email_domain}
    Set Test Variable    ${user_email}
    Input Text    ${email}    ${user_email}

Select Show Amount
    [Documentation]    Select show amount checkbox
    Element Should Be Visible    ${show_amount_checkbox}
    Click Element    ${show_amount_checkbox}

Select Show Name
    [Documentation]    Select show name checkbox
    Element Should Be Visible    ${show_name_checkbox}
    Click Element    ${show_name_checkbox}

Select Receive Receipt
    [Documentation]    Select receive receipt checkbox
    Element Should Be Visible    ${receipt_checkbox}
    Click Element    ${receipt_checkbox}

Subscribe Newsletter
    [Documentation]    Select subscribe newsletter checkbox
    Element Should Be Visible    ${newsletter}
    Click Element    ${newsletter}

Submit Paymemt
    [Documentation]    Click payment button
    Set Focus To Element    ${submit_payment_button}
    Click Element    ${submit_payment_button}

