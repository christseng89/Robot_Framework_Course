import time
import pyautogui

time.sleep(5)  # Give time for the security prompt to appear
pyautogui.write("02101216")  # Replace with your PIN
pyautogui.press("enter")
