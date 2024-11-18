# Megafin Bot

This repository contains a script for interacting with the Megafin platform using a bearer token.

## Setup Instructions

Follow the steps below to set up and run the bot:

1. Go to [Megafin](https://app.megafin.xyz/).
2. Click `Inspect` (F12) to open the developer tools.
3. Navigate to Network > Fetch/XHR.
4. Connect your wallet.
5. Click the last `profile` you see in the network tab.
6. Under `Request Headers`, look for `Authorization:` and copy the text after `Bearer`.
7. Clone the repository:
    ```bash
	git clone https://github.com/raymundedgar/megafin-bot
8. Navigate to the project directory:
    ```bash
	cd megafin-bot
9. Edit the bearer.txt file:
    ```bash
    nano bearer.txt
Paste the bearer token you copied in Step 6 into the bearer.txt file.
10. Save the file by pressing Ctrl + S then Ctrl + X.
11. Change the permission to make the script executable:
    ```bash
    chmod +x megafin.sh
    ```
12. Run the script:
    ```bash
    ./megafin.sh
    ```
