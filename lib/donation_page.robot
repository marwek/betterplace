*** Settings ***
Documentation                                    Donation page
Resource                                         page_objects/donations_form_object.robot
Resource                                         page_objects/dontations_type_object.robot
Resource                                         page_objects/codonations_form.robot
Resource                                         page_objects/payment_object.robot
Library                                          SeleniumLibrary
Library    String


*** Variables ***
${regex_total_donation} =                         .*(?P<total>\\d+,\\d+).*
${default_codonation} =                          ${1.00}



*** Keywords ***
Check Total Donation Amount with Default Codonation
    [Documentation]    Check if donation amount is correct
    ${f_donation} =    Convert To Number    ${donation}
    ${codonation_value} =    Get Text    ${codonation_amount_total_text}
    ${rx} =    Get Regexp Matches    ${codonation_value}    ${regex_total_donation}    total
    ${s} =    Replace String    ${rx}[0]    ,    .
    ${codonation} =    Convert To Number    ${s}
    ${total} =    Evaluate    ${f_donation}+${default_codonation}
    Should Be Equal As Numbers    ${codonation}    ${total}
