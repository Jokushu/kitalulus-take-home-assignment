*** Settings ***
Documentation       This is to test ToolsQA logo
...                 Testing logo from qademo
Resource            ../resources.robot
Test Setup          Open Chrome Browser    ${HOST}
Test Teardown       Close Browser
Library    OperatingSystem

*** Variables ***
${elements_card_path}                    xpath=(//div[@class='card mt-4 top-card'])[1]
${logo_image_path}                       xpath=//div[@id="app"]//header//a//img
${middle_div_path}                       xpath=//div[@class='col-12 mt-4 col-md-6']
${default_text_path}                     xpath=//div[@class='col-12 mt-4 col-md-6'][contains(text(),"Please select an item from left to start practice.")]
${katalon_acedemy_image_path}            xpath=//*[@id="Katalon"]/img[@alt='Katalon Acedemy']
${text_box_path}                         xpath=//span[.='Text Box']
${check_box_path}                        xpath=//span[.='Check Box']
${radio_button_path}                     xpath=//span[.='Radio Button']
${web_tables_path}                       xpath=//span[.='Web Tables']
${buttons_path}                          xpath=//span[.='Buttons']
${links_path}                            xpath=//span[.='Links']
${broken_links_path}                     xpath=//span[.='Broken Links - Images']
${upload_and_download_path}              xpath=//span[.='Upload and Download']
${dynamic_properties_path}               xpath=//span[.='Dynamic Properties']    



*** Test Cases ***
Test Click Logo Redirect To Correct Link
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${logo_image_path}
  Click Image                             ${logo_image_path}
  Location Should Be                      https://demoqa.com/

Test Default Text When Open Page
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${middle_div_path}
  ${default_text}=                        Get Text        ${default_text_path}
  Should Be Equal                         Please select an item from left to start practice.    ${default_text}

Test Alt Text Should Not Be Null Or Empty
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  ${elements with alt}=                   Get Webelements         ${katalon_acedemy_image_path}
  Length Should Be                        ${elements with alt}     1 

Test Text Box Menu Direct To Correct Path
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${text_box_path}
  Click Element                           ${text_box_path}
  Location Should Be                      https://demoqa.com/text-box

Test Check Box Menu Direct To Correct Path
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${check_box_path}
  Click Element                           ${check_box_path}
  Location Should Be                      https://demoqa.com/checkbox

Test Radio Button Menu Direct To Correct Path
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${radio_button_path}
  Click Element                           ${radio_button_path}
  Location Should Be                      https://demoqa.com/radio-button

Test Web Tables Menu Direct To Correct Path
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${web_tables_path}
  Click Element                           ${web_tables_path}
  Location Should Be                      https://demoqa.com/webtables

Test Buttons Menu Direct To Correct Path
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${buttons_path}
  Click Element                           ${buttons_path}
  Location Should Be                      https://demoqa.com/buttons

Test Links Menu Direct To Correct Path
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${links_path}
  Click Element                           ${links_path}
  Location Should Be                      https://demoqa.com/links

Test Broken Links Menu Direct To Correct Path
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${broken_links_path}
  Click Element                           ${broken_links_path}
  Location Should Be                      https://demoqa.com/broken

Test Upload and Download Menu Direct To Correct Path
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${upload_and_download_path}
  Click Element                           ${upload_and_download_path}
  Location Should Be                      https://demoqa.com/upload-download

Test Dynamic Properties Menu Direct To Correct Path
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${dynamic_properties_path}
  Execute JavaScript                      window.scrollTo(0, document.body.scrollHeight)
  Click Element                           ${dynamic_properties_path}
  Location Should Be                      https://demoqa.com/dynamic-properties