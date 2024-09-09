*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/login_resources.resource
Library     DataDriver  ../Test_Data/Login_Data.xlsx    sheet_name = Sheet1

Suite Setup     Open My Browser
Suite Teardown      Close My Browser
Test Template       Login

*** Keywords ***
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
LoginwithExcel using ${username} and ${password}



