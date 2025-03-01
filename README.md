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
...
Open Browser    ${URL}    ${BROWSER}
Set selenium implicit wait    ${TIMEOUT}
...
```

```cmd
robot -d reports first_demo.robot
```

#### Download Selenium Webdriver Firefox and Test
https://github.com/mozilla/geckodriver/releases

```cmd
robot -d reports first_demov2.robot
REM Change config.robot => ${BROWSER_TYPE} = Firefox or Chrome
```

### Variables and their scope
```cmd
robot -d tests test_variables.robot
REM ${env}=    uat or qa
robot -d tests -v env:qa test_variables.robot

robot -d reports first_demov2.robot
REM Change config.robot => ${BROWSER_TYPE} = 1 for Chrome or 2 for Firefox 
REM ${BROWSER}            ${browsers["${BROWSER_TYPE}"]}

robot -d reports -v BROWSER_TYPE:1 first_demov2.robot
robot -d reports -v BROWSER_TYPE:2 first_demov2.robot
```

### Keywords and Argumented Keywords
```cmd
robot -d tests test_keywords.robot
robot -d tests -v browser:firefox test_keywords.robot
robot -d tests -v browser:chrome test_keywords.robot
REM Resource file Resource\commons.robot

REM Resource file Resource\common.robot
robot -d reports -v BROWSER_TYPE:1 first_demov2.robot
robot -d reports -v BROWSER_TYPE:2 first_demov2.robot
```

### Automating the registration by using a Python locators file
https://www.way2automation.com/
https://www.way2automation.com/way2auto_jquery/index.php

```cmd
robot -d tests test_registration.robot

robot -d reports -v BROWSER_TYPE:1 first_demov2.robot
robot -d reports -v BROWSER_TYPE:2 first_demov2.robot
```

## xPath and CSS Selectors
xPath: https://www.w3schools.com/xml/xpath_intro.asp

### Xpath vs CSS Part 1
Xpath Format ...

//tagname[@attribute='value']
//id[@id='username']
//input[@name='username']

https://www.way2automation.com/way2auto_jquery/index.php => Developer Tools => Console
$x("(//input[@name='username'])")
$x("(//input[@name='username'])[1]")
$x("(//input[@name='username'])[2]")
