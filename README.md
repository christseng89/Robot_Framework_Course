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
```cmd
robot -d tests test_if_else.robot
robot -d tests -v num1:15 test_if_else.robot
robot -d tests -v num1:8 test_if_else.robot
```

### Loops
```cmd
robot -d tests test_loops.robot

```