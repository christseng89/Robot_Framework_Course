from robot.libraries.BuiltIn import BuiltIn
import random

# Global variable initially set to None
seleniumLib = None
allureLib = None

# Helper function to get SeleniumLibrary instance
def get_selenium_lib():
    global seleniumLib
    if seleniumLib is None:
        seleniumLib = BuiltIn().get_library_instance('SeleniumLibrary')
    return seleniumLib

# Helper function to get AllureLibrary instance
def get_allure_lib():
    global allureLib
    if allureLib is None:
        allureLib = BuiltIn().get_library_instance('AllureLibrary')
    return allureLib

def print_console():
    print("Hello")

def print_title():
    title = get_selenium_lib().get_title()
    print(title)

def select_month(xpath, month, date):
    lib = get_selenium_lib()
    while lib.find_element(xpath).text != month:
        lib.find_element('//*[@id="ui-datepicker-div"]/div/a[1]/span').click()
    dateStr = f"//a[text()='{date}']"
    lib.find_element(dateStr).click()

def capture_screenshot():
    lib = get_selenium_lib()
    randomNum = random.randint(0, 9999)
    fileName = f"seleniumLib-{randomNum}.png"
    lib.capture_page_screenshot(fileName)
    get_allure_lib().attach_file(f'./{fileName}')
