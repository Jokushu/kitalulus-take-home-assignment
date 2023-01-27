*** Settings ***
Documentation       This is to test ToolsQA logo
...                 Testing logo from qademo
Resource            ../resources.robot
Test Setup          Open Chrome Browser    ${HOST}
Test Teardown       Close Browser
Library    OperatingSystem

*** Variables ***
${elements_card_path}                     xpath=(//div[@class='card mt-4 top-card'])[1]
${up_down_path}                           xpath=//span[.='Upload and Download']

*** Test Cases ***
Verify File Upload
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${up_down_path}
  Execute JavaScript                      window.scrollTo(0, document.body.scrollHeight)
  Click Element                           ${up_down_path}
  Location Should Be                      https://demoqa.com/upload-download
  Wait Until Element Is Visible      id:uploadFile  timeout=5
  Choose File                        id:uploadFile  /Users/vincentgunawan/Downloads/c949e7f5-4936-4c95-9e74-5eefcc88a58a.jpeg
  Element Text Should Be             xpath=//p[@id='uploadedFilePath']  C:\\fakepath\\c949e7f5-4936-4c95-9e74-5eefcc88a58a.jpeg
   
Verify File Download
  # ${chrome options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
  # ${prefs}  Create Dictionary   download.default_directory=/Users/vincentgunawan/Downloads/test_download
  # Call Method  ${chrome options}  add_experimental_option  prefs  ${prefs}
  # Create Webdriver  Chrome  chrome_options=${chrome options}
  # Goto                        https://demoqa.com/upload-download
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${up_down_path}
  Execute JavaScript                      window.scrollTo(0, document.body.scrollHeight)
  Click Element                           ${up_down_path}
  Location Should Be                      https://demoqa.com/upload-download
  Wait Until Element Is Visible           id:downloadButton
  Click Link  id:downloadButton
  Sleep  5s
  ${files}  List Files In Directory  /Users/vincentgunawan/Downloads
  Length Should Be  ${files}  1
  Close Browser