*** Settings ***
Documentation       This is to test ToolsQA logo
...                 Testing logo from qademo
Resource            ../resources.robot
Test Setup          Open Chrome Browser    ${HOST}
Test Teardown       Close Browser
Library    OperatingSystem

*** Variables ***
${logo_image_path}            xpath=//div[@id="app"]//header//a//img
${banner_image_path}          xpath=//div[@class="home-banner"]//a//img
${elements_card_path}         xpath=(//div[@class='card mt-4 top-card'])[1]
${forms_card_path}            xpath=(//div[@class='card mt-4 top-card'])[2]
${alerts_card_path}           xpath=(//div[@class='card mt-4 top-card'])[3]
${widgets_card_path}          xpath=(//div[@class='card mt-4 top-card'])[4]
${interactions_card_path}     xpath=(//div[@class='card mt-4 top-card'])[5]
${store_card_path}            xpath=(//div[@class='card mt-4 top-card'])[6]


*** Test Cases ***
Test Click Logo Redirect To Correct Link
  Wait Until Element Is Visible           ${logo_image_path}
  Click Image                             ${logo_image_path}
  Location Should Be                      https://demoqa.com/


Test Click Banner Redirect To Correct Link
  Wait Until Element Is Visible           ${banner_image_path}
  Click Image                             ${banner_image_path}
  ${handles}=                             Get Window Handles
  Switch Window                           ${handles}[1]
  Location Should Be                      https://www.toolsqa.com/selenium-training/

Test Click Elements Card Redirect To Elements Page
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements

Test Click Forms Card Redirect To Elements Page
  Wait Until Element Is Visible           ${forms_card_path}
  Click Element                           ${forms_card_path}
  Location Should Be                      https://demoqa.com/forms

Test Click Alerts & Windows Card Redirect To Elements Page
  Wait Until Element Is Visible           ${alerts_card_path}
  Click Element                           ${alerts_card_path}
  Location Should Be                      https://demoqa.com/alertsWindows

Test Click Widgets Card Redirect To Elements Page
  Wait Until Element Is Visible           ${widgets_card_path}
  Click Element                           ${widgets_card_path}
  Location Should Be                      https://demoqa.com/widgets

Test Click Interactions Card Redirect To Elements Page
  Wait Until Element Is Visible           ${interactions_card_path}
  Click Element                           ${interactions_card_path}
  Location Should Be                      https://demoqa.com/interaction

Test Click Store Card Redirect To Elements Page
  Wait Until Element Is Visible           ${store_card_path}
  Execute JavaScript                      window.scrollTo(0, document.body.scrollHeight)
  Click Element    ${store_card_path}
  Location Should Be                      https://demoqa.com/books