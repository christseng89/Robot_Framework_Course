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

Robot Framework Official Documentation
- https://robotframework.org/?tab=1#getting-started

SeleniumLibrary Official Documentation
- https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

```cmd
pip install robotframework
robot --version
   Robot Framework 7.2.2 (Python 3.13.1 on win32)

pip install robotframework-seleniumlibrary 
python -c "import SeleniumLibrary; print(SeleniumLibrary.__version__)"
   6.7.0
python -c "import selenium; print(selenium.__version__)"               
   4.29.0

REM Allure Library
pip install allure-robotframework
allure --version                
   2.32.0

REM Data Driver - Excel
pip install robotframework-datadriver
pip install pandas openpyxl


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
- xPath: https://www.w3schools.com/xml/xpath_intro.asp

### Xpath vs CSS Part 1
- Xpath Format ...

```cmd
//tagname[@attribute='value']
//id[@id='username']
//input[@name='username']
```

- Test xPath in Chrome Console
- https://www.way2automation.com/way2auto_jquery/index.php => Developer Tools => Console

```cmd
$x("(//input[@name='username'])")
$x("(//input[@name='username'])[1]")
$x("(//input[@name='username'])[2]")
```

### Xpath vs CSS Part 2
- Dynamic element
https://www.way2automation.com/way2auto_jquery/automation-practice-site.html
https://www.way2automation.com/way2auto_jquery/submit_button_clicked.php#load_box

```cmd
REM Starts with subxxx
$x('//*[starts-with(@id, "sub")]')
$x('//*[starts-with(@id, "111")]')
$x('//*[starts-with(@id, "iden")]')[0]

REM Contains xxxsubxxx
$x('//*[contains(@id, "sub")]')

REM Gmail contains
$x('//*[contains(@id, "fierId")]')
$x('//*[contains(@id, "fierId")]/..')
$x('//*[contains(@id, "fierId")]/parent::div')
$x('//*[contains(@id, "fierNext")]')
$x('//input[contains(@id, "fierId")]')

REM Following sibling
$x('//*[contains(@id, "fierId")]/following-sibling::input')

```
-  Following sibling: 在 XPath 中用于选择当前节点之后的同级元素（即具有相同父节点的元素）。
   它用于选择当前元素的下一个兄弟节点。

```html
<div>
  <p id="first">这是第一个段落。</p>
  <p id="second">这是第二个段落。</p>
  <p id="third">这是第三个段落。</p>
</div>
```

```Chrome Console
$x('//p[@id="first"]/following-sibling::p')
   (2) [p#second, p#third]
$x('//p[@id="first"]/following-sibling::p')[0]
   <p id="second">这是第二个段落。</p>
```

- Xpath Format ...
```
//tagName[@attribute='value']
//tagName[@attribute='value'][@attribute='value']
//tagName[starts-with(@attribute,'value')]
//tagName[contains(@attribute,'value')]

//tagName[text()='value']
//tagName[contains(text(),'partialvalue')]

//tagName[@attribute='value']/..
//tagName[@attribute='value']/parent::tagname
//tagName[@attribute='value']/following-sibling::tagname
//tagName[@attribute='value']/preceding-sibling::tagname[1]
```

### Xpath vs CSS Part 3
- CSS Format ...
```cmd
$$('body > form > input[type=text]:nth-child(1)')

REM Gmail
$$('#yDmH0d > c-wiz > div > div.UXFQgc > div > div > div.AcKKx > form > span > section > div > div > div.AFTWye.vEQsqe >) div > div.aCsJod.oJeWuf > div > div.Xb9hP > div'
$$("input[id='identifierId']")
$$("input[id='identifierId'][type='email']")
$$("input[id^='identif']")
$$("input[id$='fierId']")
$$("input[id*='dentif']")
$$('#identifierId')
$$('input#identifierId')
$$("input.whsOnd.zHQkBf")[0]

$$("div.rFrNMe.X3mtXb.UOsO2.ToAxb.zKHdkd.sdJrJc.Tyc9J")

document.querySelector("#identifierId")
```

## Advance Topics
- https://www.way2automation.com/way2auto_jquery/automation-practice-site.html

### Handling Tabs and Popup windows
- Registration https://www.way2automation.com/way2auto_jquery/registration.php#load_box

```cmd
robot -d tests test_registration.robot

robot -d tests test_windowHandling.robot
``` 

### Conditional statements - If and Else
- https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#if-else-syntax

```cmd
robot -d tests test_if_else.robot
robot -d tests -v num1:15 test_if_else.robot
robot -d tests -v num1:8 test_if_else.robot
```

### Loops
- https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#for-loops

```cmd
robot -d tests test_loops.robot

```

### Handling Dropdown list
- https://www.wikipedia.org/

```
robot -d tests test_dropdown.robot

robot -d tests -v LANG:zh test_dropdown.robot
robot -d tests -v LANG:en test_dropdown.robot
robot -d tests -v LANG:hi test_dropdown.robot
robot -d tests -v LANG:ja test_dropdown.robot

```

### Handling Checkboxes
- http://www.tizag.com/htmlT/htmlcheckboxes.php

```cmd
robot -d tests test_checkboxes.robot

```

### Handling Frames
- https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_submit_get

```cmd
robot -d tests test_frames.robot

```

### Handling Alerts
- https://way2automation.com/way2auto_jquery/index.php
- https://www.way2automation.com/way2auto_jquery/automation-practice-site.html

Alert Page (via Window Handling)
- https://www.way2automation.com/way2auto_jquery/alert.php#load_box

```cmd
robot -d tests test_alerts.robot

```

## Handling Complex User Gestures

### Handling MouseOver
- https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Mouse%20Over

```cmd
robot -d tests test_mouseover.robot

```

### Handling Drag and Drop Offsets (Slider)
- https://jqueryui.com/resources/demos/slider/default.html
- https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Drag%20And%20Drop%20By%20Offset

```cmd
robot -d tests test_slider.robot
robot -d tests -v OFFSET_X:700 test_slider.robot

```

### Refactor the code #1

```cmd
robot -d tests test_calendar.robot
robot -d tests test_calendar_jq.robot
robot -d tests DataDrivenTest\test_datadriven.robot
```

### Handling Resizable elements
- https://jqueryui.com/resources/demos/resizable/default.html

```cmd
robot -d tests test_resizable.robot
robot -d tests -v OFFSET_X:700 test_resizable.robot

```

### Handling Drag and Drop
```cmd
robot -d tests test_drag_and_drop.robot

```

### Handling Right click and Multi mouse over elements
- https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Open%20Context%20Menu
- https://deluxe-menu.com/popup-mode-sample.html

```cmd
robot -d tests test_right_click.robot

```

## JavaScipt, Screen Shots and Headless Mode

### Handling JavaScript Execution
- https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_submit_get

```cmd
robot -d tests test_javascript.robot

```

### Capture Screenshots (Element and Full Page)
https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Capture%20Element%20Screenshot

```cmd
robot -d tests test_javascript.robot
robot -d tests test_javascript2.robot

```

### Running the test in Headless mode
- headlesschrome

```note
    launching browser  https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_submit_get    headlesschrome
```

## Handing Web Tables, Calendar/Date Picker and Custom Python Library

### Handling WebTables
- https://imsports.rediff.com/score/in_asa_1081672.html

```cmd
robot -d tests test_webtables.robot

```

### Handling Calendars - Integrating Custom Python Library
- https://www.way2automation.com/way2auto_jquery/datepicker.php#load_box
- Custom Python Library -> Built_In/CustomLib.py

```cmd
robot -d tests test_calendar.robot

```

### Format Robot Framework Test Cases
- https://github.com/MarketSquare/robotframework-tidy?tab=readme-ov-file#installation-

```cmd
pip install -U robotframework-tidy
robotidy test_calendar.robot
```

### Exception Handling in ROBOT Framework
- https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#try-except-syntax

```cmd
robot -d tests test_exception.robot
robot -d tests -v DIVISOR:4 test_try_except.robot
robot -d tests -v DIVISOR:0 test_try_except.robot

robot -d tests test_try_except2.robot
robot -d tests -v email_id:email test_try_except2.robot

```

## Allure Reports

### Generating Allure Reports
- https://pypi.org/project/allure-robotframework/

```cmd
pip install allure-robotframework
```

- NodeJS
```cmd
npm install -g allure-commandline --save-dev
```

```cmd
robot -d tests --listener allure_robotframework test_try_except2.robot
REM output\allure folder

robot -d tests --listener allure_robotframework:Allure_Report test_try_except2.robot
robot -d tests -v email_id:email --listener allure_robotframework:Allure_Report test_try_except2.robot
REM Failed Test Case
robot -d tests --listener allure_robotframework:Allure_Report test_calendar.robot

```

- Open Allure Report - last one Only
```cmd
allure serve Allure_Report
REM 2 Test Cases ONLY...
REM Timeline will show the 3 runs
```

### Capture screenshots and attaching it to Allure Reports
- Edit test_try_except2.robot

```note
Library             BuiltIn
Library             SeleniumLibrary
Library             AllureLibrary
Library             Built_In/CustomLib.py
...
    FINALLY
        Capture Screenshot
        close browser
...
Divide
    [Arguments]    ${a}    ${b}
    TRY
        ${result}=    Evaluate    ${a} / ${b}
        RETURN    PASS    ${result}
    EXCEPT
        RETURN    FAIL    0
    END

```

- Edit CustomLib.py

```python
# Use -d tests from the Command Line ...
...
import os
...

def capture_screenshot():
    lib = get_selenium_lib()
    randomNum = random.randint(0, 9999)
    fileName = f"seleniumLib-{randomNum}.png"

    # Get the output directory from Robot Framework
    output_dir = BuiltIn().get_variable_value('${OUTPUT_DIR}', 'tests1')

    # Construct absolute path for the screenshot
    file_path = os.path.join(output_dir, fileName)

    # Capture screenshot
    lib.capture_page_screenshot(file_path)

    # Attach file to Allure report if Allure is available
    allure = get_allure_lib()
    if allure:
        allure.attach_file(file_path)

    return file_path
```

```cmd
robot -d tests test_try_except2.robot
robot -d tests -v email_id:email test_try_except2.robot
```

```cmd
robot -d tests -v email_id:email --listener allure_robotframework:Allure_Report test_try_except2.robot
robot -d tests --listener allure_robotframework:Allure_Report test_try_except2.robot

robot -d tests --listener allure_robotframework:Allure_Report test_calendar.robot
```
- test_calendar.robot

```code
Teardown
    run keyword if test failed    Capture Screenshot
    
```

```cmd
allure serve --port 2666 Allure_Report

```

## Parallet Test Execution
### Parallel Test Execution using Pabot
- https://docs.robotframework.org/docs/parallel

```cmd
pip install -U robotframework-pabot
robot -d tests --listener allure_robotframework:Allure_Report DataDrivenTest\test_datadriven.robot

pabot --processes 2 -d tests --listener allure_robotframework:Allure_Report DataDrivenTest\test_datadriven.robot
   ...
   Robot Framework remote server at 127.0.0.1:8270 started.
   Storing .pabotsuitenames file
   2025-03-11 14:47:52.104115 [PID:6764] [0] [ID:0] EXECUTING Test Datadriven
   2025-03-11 14:48:07.381371 [PID:6764] [0] [ID:0] still running Test Datadriven after 15.0 seconds
   2025-03-11 14:48:27.715000 [PID:6764] [0] [ID:0] still running Test Datadriven after 35.0 seconds
   2025-03-11 14:48:53.116358 [PID:6764] [0] [ID:0] still running Test Datadriven after 60.0 seconds
   2025-03-11 14:49:07.098242 [PID:6764] [0] [ID:0] PASSED Test Datadriven in 73.8 seconds
   4 tests, 4 passed, 0 failed, 0 skipped.
   ===================================================
   Output:  C:\Users\samfi\PycharmProjects\Robot_Framework\tests\output.xml
   Log:     C:\Users\samfi\PycharmProjects\Robot_Framework\tests\log.html
   Report:  C:\Users\samfi\PycharmProjects\Robot_Framework\tests\report.html
   ...
   Total testing: 1 minute 13.80 seconds
   Elapsed time:  1 minute 15.82 seconds
   
```

- Test all robots in the folder Parallel
```cmd
REM All folders and subfolders
pabot --processes 3 -d tests --listener allure_robotframework:Allure_Report .

REM Only the current folder
pabot --processes 3 -d tests --listener allure_robotframework:Allure_Report test*.robot
   ...
   34 tests, 34 passed, 0 failed, 0 skipped.
   ...
   Total testing: 6 minutes 36.30 seconds
   Elapsed time:  2 minutes 24.37 seconds

allure serve --port 2666 Allure_Report
```
- Test Subfolder

```cmd
pabot --processes 3 -d tests --listener allure_robotframework:Allure_Report .\DataDrivenTest
   ...
   4 tests, 4 passed, 0 failed, 0 skipped.
   ...
   Total testing: 52.50 seconds
   Elapsed time:  54.19 seconds
 
```
