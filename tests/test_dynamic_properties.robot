*** Settings ***
*** Settings ***
Documentation       This is to test ToolsQA logo
...                 Testing logo from qademo
Resource            ../resources.robot
Test Setup          Open Chrome Browser    ${HOST}
Test Teardown       Close Browser
Library    OperatingSystem

*** Variables ***
${elements_card_path}                    xpath=(//div[@class='card mt-4 top-card'])[1]
${dynamic_properties_path}               xpath=//span[.='Dynamic Properties']    
${title_path}                            xpath=//div[@class='main-header']
${disable_to_enable_button_path}         id:enableAfter
${change_color_button_path}              id:colorChange
${visible_after_button_path}             id:visibleAfter

*** Test Cases ***
Test Title Should Be Dynamic Properties
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${dynamic_properties_path}
  Execute JavaScript                      window.scrollTo(0, document.body.scrollHeight)
  Click Element                           ${dynamic_properties_path}
  Location Should Be                      https://demoqa.com/dynamic-properties
  Wait Until Element Is Visible           ${title_path}
  ${title}=                               Get Text                                            ${title_path}
  Should Be Equal                         Dynamic Properties                                  ${title}

Test Button Will Be Enabled After 5 Seconds
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${dynamic_properties_path}
  Execute JavaScript                      window.scrollTo(0, document.body.scrollHeight)
  Click Element                           ${dynamic_properties_path}
  Location Should Be                      https://demoqa.com/dynamic-properties
  Page Should Contain Element             ${disable_to_enable_button_path}
  Element Should Be Disabled              ${disable_to_enable_button_path}
  Wait Until Element Is Enabled           ${disable_to_enable_button_path}                           timeout=5s
  Element Should Be Enabled               ${disable_to_enable_button_path}

Test Button Changed Text Color After 5 Seconds
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${dynamic_properties_path}
  Execute JavaScript                      window.scrollTo(0, document.body.scrollHeight)
  Click Element                           ${dynamic_properties_path}
  Location Should Be                      https://demoqa.com/dynamic-properties
  Page Should Contain Element             ${change_color_button_path}
  ${class}=                               Get Element Attribute                        ${change_color_button_path}    class
  Should Be Equal                         mt-4 btn btn-primary                         ${class}
  Sleep                                   5s
  ${class}=                               Get Element Attribute                        ${change_color_button_path}    class
  Should Be Equal                         mt-4 text-danger btn btn-primary             ${class}

Test Button Visible After 5 Seconds
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${dynamic_properties_path}
  Execute JavaScript                      window.scrollTo(0, document.body.scrollHeight)
  Click Element                           ${dynamic_properties_path}
  Location Should Be                      https://demoqa.com/dynamic-properties
  Page Should Not Contain Element         ${visible_after_button_path}
  Sleep                                   5s
  Page Should Contain Element             ${visible_after_button_path}