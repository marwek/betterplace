*** Settings ***
Documentation                                    Arguments for browser, devices initialize during tests setup
Library                                          SeleniumLibrary
Resource                                         url.robot
Resource                                         ../lib/page_objects/page_object.robot


*** Variables ***
&{dev_metrics} =                                 width=${400}    height=${800}    pixelRatio=${3.0}
&{user_agent} =                                  userAgent='Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36'
${chrome_disable_extensions} =                   add_argument("--disable-extensions")

*** Keywords ***
Start Headless Chrome Browser
    [Documentation]    Start Chrome browser in headless mode with given url
    [Arguments]    ${www}
    &{mobile_emulation} =    Create Dictionary   deviceMetrics=${dev_metrics}    &{user_agent}
    Set Test Variable    ${mobile_emulation}
    Open Browser    ${www}    headlesschrome    options=add_experimental_option("mobileEmulation", ${mobile_emulation});${chrome_disable_extensions}
    Accept Cookies
