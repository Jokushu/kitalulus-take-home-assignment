*** Settings ***
Documentation       This is to test text box field
...                 Testing text box field from qademo
Resource            ../resources.robot
Test Setup          Open Chrome Browser    ${HOST}
Test Teardown       Close Browser
Library    OperatingSystem

*** Variables ***
${elements_card_path}                     xpath=(//div[@class='card mt-4 top-card'])[1]
${radio_button_path}                      xpath=//span[.='Radio Button']
${radio_buttons}                          xpath=//input[@type="radio"]
${yes_radio_path}                         xpath=//label[@for="yesRadio"]
${no_radio_path}                          xpath=//label[@for="impressiveRadio"]
${no_radio_path}                          xpath=//label[@for="noRadio"]
${yes_radio_path}                         xpath=//label[@for="yesRadio"]
${impressive_radio_path}                  xpath=//label[@for="impressiveRadio"]
${output_path}                            xpath=//p[@class='mt-3']
${output_yes_path}                        xpath=//p[.='You have selected Yes']
${output_impressive_path}                 xpath=//p[.='You have selected Impressive']
${output_no_path}                         xpath=//p[.='You have selected No']
${yes_text}                               xpath=//span[.='Yes']
${impressive_text}                        xpath=//span[.='Impressive']

*** Test Cases ***
Test Page Should Contain Three Radio Button
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${radio_button_path}
  Click Element                           ${radio_button_path}
  Location Should Be                      https://demoqa.com/radio-button
  ${elements with alt}=                   Get Webelements         ${radio_buttons}
  Length Should Be                        ${elements with alt}     3

Test All Radio Button Should Be Enable
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${radio_button_path}
  Click Element                           ${radio_button_path}
  Location Should Be                      https://demoqa.com/radio-button
  Element Should Be Enabled               ${yes_radio_path}
  Element Should Be Enabled               ${impressive_radio_path}
  Element Should Be Enabled               ${no_radio_path}

Test Page Should Not Contain Output Paragraph Before Clicked Any Button
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${radio_button_path}
  Click Element                           ${radio_button_path}
  Location Should Be                      https://demoqa.com/radio-button
  Page Should Not Contain Element         ${output_path}

Test Page Should Contain Text After Click Yes Radio Button
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${radio_button_path}
  Click Element                           ${radio_button_path}
  Location Should Be                      https://demoqa.com/radio-button
  Click Element                           ${yes_radio_path}
  Page Should Contain Element             ${output_yes_path}
  ${class}=                               Get Element Attribute            ${yes_text}    class
  Should Be Equal                         text-success    ${class}

Test Page Should Contain Text After Click Impressive Radio Button
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${radio_button_path}
  Click Element                           ${radio_button_path}
  Location Should Be                      https://demoqa.com/radio-button
  Click Element                           ${impressive_radio_path}
  Page Should Contain Element             ${output_impressive_path}
  ${class}=                               Get Element Attribute            ${impressive_text}    class
  Should Be Equal                         text-success    ${class}

Test Page Should Contain Text After Click No Radio Button
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${radio_button_path}
  Click Element                           ${radio_button_path}
  Location Should Be                      https://demoqa.com/radio-button
  Click Element                           ${no_radio_path}
  Page Should Contain Element             ${output_yes_path}