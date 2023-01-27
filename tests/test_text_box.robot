*** Settings ***
Documentation       This is to test text box field
...                 Testing text box field from qademo
Resource            ../resources.robot
Test Setup          Open Chrome Browser    ${HOST}
Test Teardown       Close Browser
Library    OperatingSystem

*** Variables ***
${elements_card_path}                    xpath=(//div[@class='card mt-4 top-card'])[1]
${text_box_path}                         xpath=//span[.='Text Box']
${text_box_form}                         id=userForm
${full_name_input}                       id=userName
${email_input}                           id=userEmail
${current_address_input}                 id=currentAddress
${permanent_address_input}               id=permanentAddress
${submit_button}                         id=submit
${output_container}                      xpath=//div[@id="output"]/div[@class='border col-md-12 col-sm-12']

${name}                              Joko
${email}                             joko@mailsac.com
${invalid_email}                     joko@mailsac
${current_address}                   Jl. Ketimun Raya No 4
${permanent_address}                 Jl. Suka Rela No 5

*** Test Cases ***
Test Text Box Placeholder Should Be Correct
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${text_box_path}
  Click Element                           ${text_box_path}
  Location Should Be                      https://demoqa.com/text-box
  Wait Until Element Is Visible           ${text_box_form}
  ${name_placeholder}=                    Get Element Attribute            ${full_name_input}            placeholder
  ${email_placeholder}=                   Get Element Attribute            ${email_input}                placeholder
  ${current_address_placeholder}=         Get Element Attribute            ${current_address_input}      placeholder
  ${permanent_address_placeholder}=       Get Element Attribute            ${permanent_address_input}    placeholder
  Should Be Equal                         Full Name                        ${name_placeholder}
  Should Be Equal                         name@example.com                 ${email_placeholder}
  Should Be Equal                         Current Address                  ${current_address_placeholder}

  Should Be Equal                         Permanent Address                ${permanent_address_placeholder}

Test Input Text Box With Valid Data
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${text_box_path}
  Click Element                           ${text_box_path}
  Location Should Be                      https://demoqa.com/text-box
  Wait Until Element Is Visible           ${text_box_form}
  Input Text                              ${full_name_input}               ${name}
  Input Text                              ${email_input}                   ${email} 
  Input Text                              ${current_address_input}         ${current_address}
  Input Text                              ${permanent_address_input}       ${permanent_address}
  Click Button                            ${submit_button}
  Wait Until Element Is Visible           id=name
  Wait Until Element Is Visible           id=email
  Wait Until Element Is Visible           id=currentAddress
  Wait Until Element Is Visible           id=permanentAddress

Test Submit Text Box Without Any Data
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${text_box_path}
  Click Element                           ${text_box_path}
  Location Should Be                      https://demoqa.com/text-box
  Wait Until Element Is Visible           ${text_box_form}
  Click Button                            ${submit_button}
  Page Should Not Contain Element         ${output_container}

Test Submit Text Box With Blank Name
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${text_box_path}
  Click Element                           ${text_box_path}
  Location Should Be                      https://demoqa.com/text-box
  Wait Until Element Is Visible           ${text_box_form}
  Input Text                              ${email_input}                   ${email} 
  Input Text                              ${current_address_input}         ${current_address}
  Input Text                              ${permanent_address_input}       ${permanent_address}
  Click Button                            ${submit_button}
  ${class}=                               Get Element Attribute            ${full_name_input}    class
  Should Be Equal                         mr-sm-2 field-error form-control    ${class}
  Page Should Not Contain Element         ${output_container}

Test Submit Text Box With Blank Email
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${text_box_path}
  Click Element                           ${text_box_path}
  Location Should Be                      https://demoqa.com/text-box
  Wait Until Element Is Visible           ${text_box_form}
  Input Text                              ${full_name_input}               ${name} 
  Input Text                              ${current_address_input}         ${current_address}
  Input Text                              ${permanent_address_input}       ${permanent_address}
  Click Button                            ${submit_button}
  ${class}=                               Get Element Attribute            ${email_input}    class
  Should Be Equal                         mr-sm-2 field-error form-control    ${class}
  Page Should Not Contain Element         ${output_container}

Test Submit Text Box With Invalid Email
  Wait Until Element Is Visible           ${elements_card_path}
  Click Element                           ${elements_card_path}
  Location Should Be                      https://demoqa.com/elements
  Wait Until Element Is Visible           ${text_box_path}
  Click Element                           ${text_box_path}
  Location Should Be                      https://demoqa.com/text-box
  Wait Until Element Is Visible           ${text_box_form}
  Input Text                              ${full_name_input}               ${name} 
  Input Text                              ${email_input}                   ${invalid_email}
  Input Text                              ${current_address_input}         ${current_address}
  Input Text                              ${permanent_address_input}       ${permanent_address}
  Click Button                            ${submit_button}
  ${class}=                               Get Element Attribute            ${email_input}    class
  Should Be Equal                         mr-sm-2 field-error form-control    ${class}
  Page Should Not Contain Element         ${output_container}

