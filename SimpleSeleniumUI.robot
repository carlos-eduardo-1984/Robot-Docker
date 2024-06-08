*** Settings ***
Library  Collections
Library  SeleniumLibrary

*** Test Cases ***
Heroku Login chrome 
    Open Browser  https://www.google.com   browser=chrome
    Go To  http://the-internet.herokuapp.com/login    
    Input Text  //input[@id='username']  tomsmith
    Input Text  //input[@id='password']  SuperSecretPassword!
    Click Button  Login
    Element Text Should be  //h4  Welcome to the Secure Area. When you are done click logout below.  Expected message is not shown
    Capture Page Screenshot
    Click Link  Logout
    Capture Page Screenshot