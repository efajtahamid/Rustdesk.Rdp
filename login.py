import pyautogui as pag
import time
import pyperclip

# Define the coordinates and use the `actions` list
actions = [
    (116, 457, 10),  # install
    (116, 457, 2),   # install
    (539, 461, 10),  # install again
    (539, 461, 2),   # install again
    (761, 25, 7),    # maximize
    (761, 25, 2),    # maximize
    (89, 159, 2),    # rightclick
    (139, 169, 2),   # select all
    (88, 152, 2),    # right click
    (138, 162, 2),   # copy
    (930, 19, 2),    # 3 bars
    (930, 19, 2),    # 3 bars
    (53, 163, 2),    # security
    (53, 163, 2),    # security
    (445, 62, 2),    # enable
    (445, 62, 2),    # enable
    (357, 660, 2),   # set pass
    (357, 660, 2),   # set pass
    (278, 307, 2),   # first fill (username)
    (278, 396, 2),   # second fill (password)
    (741, 494, 2),   # ok
    (741, 494, 2),   # ok
    (958, 10, 2),    # minimize
]

# Wait for a few seconds to give time to focus on the target application
time.sleep(20)

# Perform the actions in the specified order
for x, y, duration in actions:
    if (x, y) == (89, 159) or (x, y) == (88, 152):
        # For right-click coordinates, perform right-click
        pag.rightClick(x, y, duration=duration)
    else:
        pag.click(x, y, duration=duration)
    if (x, y) == (278, 307):  # Username field
        pag.click(x, y, duration=duration)
        pag.typewrite("Admin")
    elif (x, y) == (278, 396):  # Password field
        pag.click(x, y, duration=duration)
        pag.typewrite("CryptoHunters")

# Helper functions to append info to show.bat
def save_echo_to_batch(file_path, echo_text):
    with open(file_path, 'a') as file:
        file.write(f'\necho {echo_text}\n')

def run_rustdesk_command():
    clipboard_text = pyperclip.paste()
    save_echo_to_batch('show.bat', f'RustDesk ID: {clipboard_text}')
    save_echo_to_batch('show.bat', 'Username: Admin')
    save_echo_to_batch('show.bat', 'Password: CryptoHunters')

if __name__ == "__main__":
    run_rustdesk_command()

print("✅ Done! Login credentials are below.")
