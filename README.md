# Robot Framework Course

## Python Virtual Environment

### Create Virtual Environment
```cmd
python -m venv venv
venv\Scripts\activate
```
### Set Virtual Environment in PyCharm
1. Open File → Settings (or Ctrl + Alt + S).
2. Navigate to Project: Robot_Framework → Python Interpreter 
3. Add Interpreter -> Add Local Interpreter
4. Choose 'Select existing' option -> OK -> OK
5. Restart PyCharm

### Installing Robot framework and required plugins
1. Open File -> Settings -> Plugins -> Marketplace
2. Search for 'IntelliBot #Update' -> Install 
3. Restart PyCharm

https://robotframework.org/?tab=1#getting-started
```cmd
pip install robotframework
robot --version
   Robot Framework 7.2.2 (Python 3.13.1 on win32)

pip install robotframework-seleniumlibrary 
python -c "import SeleniumLibrary; print(SeleniumLibrary.__version__)"
   6.7.0
python -c "import selenium; print(selenium.__version__)"               
   4.29.0

```

OR
1. Open File → Settings (or Ctrl + Alt + S).
2. Navigate to Project: Robot_Framework → Python Interpreter
3. Click '+' 
    - robotframework -> Install Package
    - robotframework-SeleniumLibrary -> Install Package
4. Close -> OK

### Creating the first robot demo case

```cmd
robot first_demo.robot
```

report.html -> Open In -> Browser -> Chrome

### Handling Sync issues
https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Set%20Selenium%20Implicit%20Wait

```note
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}      https://www.google.com/
${BROWSER}  Chrome
${TIMEOUT}  10s

*** Test Cases ***
Test Case 1
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Google
    Close Browser
```

```note
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}      https://www.google.com/
${BROWSER}  Chrome
${TIMEOUT}  10s

*** Test Cases ***
Test Case 1
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Google
    Close Browser
```

```note
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}      https://www.google.com/
${BROWSER}  Chrome
${TIMEOUT}  10s

*** Test Cases ***
Test Case 1
    Open Browser    ${URL}    ${BROWSER}
    Set selenium implicit wait    10s
    Title Should Be    Google
    Close Browser
```

```note
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}      https://www.google.com/
${BROWSER}  Chrome
${TIMEOUT}  10s

*** Test Cases ***
Test Case 1
    Open Browser    ${URL}    ${BROWSER}
    Set selenium implicit wait    ${TIMEOUT}
    Title Should Be    Google
    Close Browser
```

### Running the robot script
```cmd
robot first_demo.robot
```

### Creating the first robot demo case with reports
```note
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}      https://www.google.com/
${BROWSER}  Chrome
${TIMEOUT}  10s

*** Test Cases ***
Test Case 1
    Open Browser    ${URL}    ${BROWSER}
    Set selenium implicit wait    ${TIMEOUT}
    Title Should Be    Google
    Close Browser
```

```note
...
Open Browser    ${URL}    ${BROWSER}
Set selenium implicit wait    ${TIMEOUT}
...
```

```cmd
robot -d reports first_demo.robot
```