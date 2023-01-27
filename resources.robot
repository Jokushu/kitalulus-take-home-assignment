*** Setting ***
Documentation         Global resources
Library               SeleniumLibrary        run_on_failure=Capture Page Screenshot     screenshot_root_directory=${SCREENSHOT_PATH}

*** Variables ***
${SCREENSHOT_PATH}        screenshots
${HOST}                   https://demoqa.com/
${BROWSER}                chrome

*** Keywords ***
Open Chrome Browser
  [Arguments]         ${url}    ${web_browser}=${BROWSER}
  Open Browser        ${url}    ${web_browser}
  Maximize Browser Window