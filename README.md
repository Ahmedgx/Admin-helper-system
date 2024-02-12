# Admin Helper System: Manage Users and Groups Efficiently

## Description

This Bash script empowers you to streamline user and group management on your Linux system. It offers a user-friendly interface for various tasks, including:
- Adding, removing, and updating users 
- Changing user passwords 
- Listing user details 
- Adding and removing groups 
- Disabling and enabling users 
- Locking user accounts 

## Features

- Intuitive: Easy-to-use menu-driven interface 
- Secure: Employs sudo for privileged tasks 
- Informative: Provides feedback on operational successes and errors 
- Versatile: Covers user and group management

## Usage

The script presents a menu listing available options. Select the desired action, follow any prompts, and confirm when necessary. The script handles the rest, providing clear feedback.

## Installation

To install and run the Admin Helper System, follow these steps:

**Prerequisites:**

- Linux system with `sudo` access
- `whiptail` package installed (install if not available: `sudo apt install whiptail`)

**Steps:**

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Ahmedgx/Admin-helper-system.git

2. **Make the script executable:**

  - Navigate to the cloned directory and make both scripts executable using `chmod` :

    ```bash
    cd Admin-helper-system
    chmod +x main.sh submenu.sh

3. **Run the main script:**

  - Execute the main script `main.sh` to launch the Admin Helper System:

    ```bash
    ./main.sh

## Contribution
We welcome contributions to enhance this script. Feel free to submit Pull Requests or create GitHub issues for suggestions or bug reports.


# I hope this script simplifies your user and group management tasks. Happy automating! ❤️❤️
