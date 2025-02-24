from robot.libraries.BuiltIn import BuiltIn
import random

seleniumLib = BuiltIn().get_library_instance('SeleniumLibrary')
allureLib = BuiltIn().get_library_instance('AllureLibrary')

def print_console():
    print("Hello")

def print_title():

    title = seleniumLib.get_title()
    print(title)

def select_month(xpath, month, date):

    while(seleniumLib.find_element(xpath).text != month):
        seleniumLib.find_element('//*[@id="ui-datepicker-div"]/div/a[1]/span').click()
    dateStr = f"//a[text() = {date}]"
    seleniumLib.find_element(dateStr).click()

def capture_screenshot():

    randomNum = random.randint(0,9999)
    fileName= f"selenium-{randomNum}.png"
    seleniumLib.capture_page_screenshot(fileName)
    allureLib.attach_file(f'./{fileName}')