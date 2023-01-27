*** Settings ***
Documentation       This is to test text box field
...                 Testing text box field from qademo
Resource            ../resources.robot
Test Setup          Open Chrome Browser    ${HOST}
Test Teardown       Close Browser
Library    OperatingSystem

*** Variables ***
${elements_card_path}                     xpath=(//div[@class='card mt-4 top-card'])[1]
${buttons_path}                           xpath=//span[.='Buttons']
${title_path}                             xpath=//div[@class='main-header']
${double_click_button_path}               xpath=//button[@id='doubleClickBtn']
${double_click_msg_path}                  xpath=//p[@id='doubleClickMessage']
${right_click_button_path}                xpath=//button[@id='rightClickBtn']
${right_click_msg_path}                   xpath=//p[@id='rightClickMessage']
${click_me_button_path}                   xpath=/html/body/div[2]/div/div/div[2]/div[2]/div[2]/div[3]/button
${click_me_msg_path}                      xpath=//p[@id='dynamicClickMessage']

*** Test Cases ***
Test Title Should Be Equal To Buttons
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${buttons_path}
  Click Element                           ${buttons_path}
  Location Should Be                      https://demoqa.com/buttons
  Wait Until Element Is Visible           ${title_path}
  Element Text Should Be                  ${title_path}                    Buttons

Test Double Click Double-Clicked Button
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${buttons_path}
  Click Element                           ${buttons_path}
  Location Should Be                      https://demoqa.com/buttons
  Page Should Not Contain Element         ${double_click_msg_path}
  Wait Until Element Is Visible           ${double_click_button_path}
  Double Click Element                    ${double_click_button_path}
  Wait Until Element Is Visible           ${double_click_msg_path}
  Page Should Contain Element             ${double_click_msg_path}
  ${message}=                             Get Text                              ${double_click_msg_path}
  Should Be Equal                         You have done a double click          ${message}

Test Single Click Double-Clicked Button
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${buttons_path}
  Click Element                           ${buttons_path}
  Location Should Be                      https://demoqa.com/buttons
  Page Should Not Contain Element         ${double_click_msg_path}
  Wait Until Element Is Visible           ${double_click_button_path}
  Click Element                           ${double_click_button_path}
  Wait Until Element Is Not Visible       ${double_click_msg_path}         timeout=10
  Page Should Not Contain Element         ${double_click_msg_path}

Test Right Click Right-Clicked Button
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${buttons_path}
  Click Element                           ${buttons_path}
  Location Should Be                      https://demoqa.com/buttons
  Page Should Not Contain Element         ${right_click_msg_path}
  Wait Until Element Is Visible           ${right_click_button_path}
  Open Context Menu                       ${right_click_button_path}
  Wait Until Element Is Visible           ${right_click_msg_path}
  Page Should Contain Element             ${right_click_button_path}
  ${message}=                             Get Text                              ${right_click_msg_path}
  Should Be Equal                         You have done a right click           ${message}

Test Left Click Right-Clicked Button
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${buttons_path}
  Click Element                           ${buttons_path}
  Location Should Be                      https://demoqa.com/buttons
  Page Should Not Contain Element         ${right_click_msg_path}
  Wait Until Element Is Visible           ${right_click_button_path}
  Click Element                           ${right_click_button_path}
  Wait Until Element Is Not Visible       ${right_click_msg_path}               timeout=10
  Page Should Not Contain Element         ${right_click_msg_path}

Test Click Click-Me Button
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${buttons_path}
  Click Element                           ${buttons_path}
  Location Should Be                      https://demoqa.com/buttons
  Page Should Not Contain Element         ${click_me_msg_path}
  Click Button                            ${click_me_button_path}
  Wait Until Element Is Visible           ${click_me_msg_path}
  Page Should Contain Element             ${click_me_button_path}
  ${message}=                             Get Text                              ${click_me_msg_path}
  Should Be Equal                         You have done a dynamic click         ${message}