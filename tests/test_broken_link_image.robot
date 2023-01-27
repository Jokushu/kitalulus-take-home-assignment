*** Settings ***
Documentation       This is to test text box field
...                 Testing text box field from qademo
Resource            ../resources.robot
Test Setup          Open Chrome Browser    ${HOST}
Test Teardown       Close Browser
Library    OperatingSystem

*** Variables ***
${elements_card_path}                     xpath=(//div[@class='card mt-4 top-card'])[1]
${buttons_path}                           xpath=//span[.='Broken Links - Images']
${title_path}                             xpath=//div[@class='main-header']

*** Test Cases ***
Test Title Should Be Equal To Broken Links - Images
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${buttons_path}
  Click Element                           ${buttons_path}
  Location Should Be                      https://demoqa.com/broken
  Wait Until Element Is Visible           ${title_path}
  Element Text Should Be                  ${title_path}                    Broken Links - Images

