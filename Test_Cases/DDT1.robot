*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/login_resources.resource
Suite Setup     Open My Browser
Suite Teardown  Close My Browser
Test Template       Login

*** Keywords ***
Invalid Login
    Sleep    4s
    [Arguments]     ${username}     ${password}
    Input Username  ${username}
    Input Pwd    ${password}
    Click Login Button
    Sleep    4s
    Error Message Should Be Visible
    
    
Valid Login
    [Arguments]     ${username}     ${password}
    Input Username  ${username}
    Input Pwd    ${password}
    Click Login Button
    Dashboard Page Should Be Visible
    
    
Login
    Sleep    4s
    [Arguments]     ${username}     ${password}
    Input Username  ${username}
    Input Pwd    ${password}
    Click Login Button
    Sleep    4s
    IF    '${username}' == 'Admin' and '${password}' == 'admin123'
        Dashboard Page Should Be Visible
    ELSE
        Error Message Should Be Visible
         
    END

*** Test Cases ***
Right User Wrong Password       Admin     123
Wrong User Right Password       adm       admin123
Wrong User Wrong Password       adm       123
Right User Right Password       Admin     admin123




