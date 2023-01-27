*** Settings ***
Documentation       This is to test text box field
...                 Testing text box field from qademo
Resource            ../resources.robot
Test Setup          Open Chrome Browser    ${HOST}
Test Teardown       Close Browser
Library    OperatingSystem

*** Variables ***
${elements_card_path}                     xpath=(//div[@class='card mt-4 top-card'])[1]
${check_box_path}                         xpath=//span[.='Check Box']
${title_path}                             xpath=//div[@class='main-header']
${expand_button_path}                     xpath=//button[@title='Expand all']
${collapse_button_path}                   xpath=//button[@title='Collapse all']
${checkboxes_path}                        xpath=//input[@type='checkbox']
${toggles_path}                           xpath=//button[@title='Toggle']
${home_toggle_path}                       xpath=//button[@title='Toggle'][1]


*** Test Cases ***
Test Title Should Be Equal To Check Box
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${check_box_path}
  Click Element                           ${check_box_path}
  Location Should Be                      https://demoqa.com/checkbox
  Wait Until Element Is Visible           ${title_path}
  Element Text Should Be                  ${title_path}                    Check Box

Test Expand Button Should Show All Dropdowns
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${check_box_path}
  Click Element                           ${check_box_path}
  Location Should Be                      https://demoqa.com/checkbox
  Wait Until Element Is Visible           ${expand_button_path}
  Click Button                            ${expand_button_path}
  Page Should Contain Element             xpath=//span[@class='rct-text']
  ${checkboxes_count}=                    Get WebElements                       ${checkboxes_path}
  Length Should Be                        ${checkboxes_count}                   17

Test Collapse Button Should Hide All Dropdowns
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${check_box_path}
  Click Element                           ${check_box_path}
  Location Should Be                      https://demoqa.com/checkbox
  Wait Until Element Is Visible           ${collapse_button_path}
  Click Button                            ${collapse_button_path}
  Page Should Contain Element             xpath=//span[@class='rct-text']
  ${checkboxes_count}=                    Get WebElements                       ${checkboxes_path}
  Length Should Be                        ${checkboxes_count}                   1

Test Expand Home Arrow
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${check_box_path}
  Click Element                           ${check_box_path}
  Location Should Be                      https://demoqa.com/checkbox
  Wait Until Element Is Visible           ${home_toggle_path}
  ${toggle_count}=                        Get Webelements         ${toggles_path}
  Length Should Be                        ${toggle_count}     1
  Click Button                            ${home_toggle_path}
  ${toggle_count}=                        Get Webelements         ${toggles_path}
  Length Should Be                        ${toggle_count}     4

Test Check Home Checkbox Should Selected All Checkboxes
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${check_box_path}
  Click Element                           ${check_box_path}
  Location Should Be                      https://demoqa.com/checkbox
  Wait Until Element Is Visible           xpath=//label[@for='tree-node-home']
  Click Element                           xpath=//label[@for='tree-node-home']
  Click Button                            ${expand_button_path}
  ${checked_box}=                         Get WebElements                        xpath=//*[local-name()='svg' and @class='rct-icon rct-icon-check']
  Length Should Be                        ${checked_box}                   17