*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Login_URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${Browser}      Chrome

*** Keywords ***
Open My Browser
    Open Browser        ${Login_URL}      ${Browser}
    Maximize Browser Window

Close My Browser
    Close All Browsers

Open Login Page
    Go To    ${Login_URL}

Input Username
    [Arguments]     ${username}
    Input Text      name:username   ${username}
Input Pwd
    [Arguments]     ${password}
    Input Text    name:password    ${password}

Click Login Button
    Click Button    xpath=/html/body/div[1]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

#Click Logout Link
#    Click Link    logout

Error Message Should Be Visible
    Page Should Contain     Invalid credentials
Dashboard Page Should Be Visible
    Page Should Contain    Dashboard



