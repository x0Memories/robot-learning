*** Settings ***
Documentation     Example using the space separated format.
Library           RequestsLibrary

*** Variables ***
${base_url}       https://google.com
${url}            /
${login_url}      https://accounts.google.com

*** Test Cases ***
Проверка доступности Google
                    Create session     conn     ${base_url}    disable_warnings=1
    ${response}     Get request        conn     ${url}
                    Delete all sessions
                    Should be equal    ${response.status_code}    ${200}

Проверка редиректа Google Login Form

                    Create session     conn     ${login_url}    disable_warnings=1 
    ${response}     Get request        conn     ${url}
                    Delete all sessions
                    Should be equal    ${response.status_code}    ${200}