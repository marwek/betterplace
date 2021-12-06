*** Settings ***
Documentation                                    Direct receipt form page object elements
Library                                          SeleniumLibrary
Resource                                         page_object.robot


*** Variables ***
${deposit_receipt_form} =                        xpath://div[@class="direct-deposit-receipt"]