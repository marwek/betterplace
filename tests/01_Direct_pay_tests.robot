*** Settings ***
Documentation                                    Donate 5€ via direct pay
Resource                                         ../lib/donation_page.robot
Resource                                         ../resources/initialization.robot
Resource                                         ../resources/url.robot
Test Teardown                                    Close All Browsers


*** Test Cases ***
Make direct pay ok
    [Setup]    Start Headless Chrome Browser    ${bp42_ok}
    Provide Direct Deposit Payment
    Check Payment WebElement Size
    Check Payment Receipt


Make direct pay fail
    [Setup]    Start Headless Chrome Browser    ${bp_42_fail}
    Provide Direct Deposit Payment
    Check Payment WebElement Size
    Check Payment Receipt


*** Keywords ***
Provide Direct Deposit Payment
    Add Donation    5
    Select Single Donation
    Select Direct Deposit Payment
    Enter User First and Last Name
    Enter User Email
    Check Total Donation Amount with Default Codonation
    Submit Paymemt

Check Payment Receipt
    Wait Until Page Contains    ${user_email}
    Wait Until Page Contains    IBAN

Check Payment WebElement Size
    [Documentation]    Get element size and in case of an error capture screenshot
    ${width}    ${height} =    Get Element Size    ${payment_webelement}
    Convert To Integer    ${height}
    Run Keyword If    ${height} < ${290}    Log WebElement Error

Log WebElement Error
    Capture Element Screenshot    ${payment_webelement}
    Fail    Element size is not visible on the screen or has incorrect size