#!/bin/bash

main_menu() {
  while true; do
    Options=$(whiptail --title "Admin Helper System" --menu "Choose an option:" 20 60 11 \
      "1" "Add User" \
      "2" "Remove User" \
      "3" "Update User" \
      "4" "Change User Password" \
      "5" "List User Details" \
      "6" "Add Group" \
      "7" "Remove Group" \
      "8" "Disable User" \
      "9" "Enable User" \
      "10" "Lock User Account" \
      "11" "Exit" 3>&1 1>&2 2>&3)

    case $Options in
    1)
      # Add User
      New_User=$(whiptail --title "Add User" --inputbox "Enter new username:" 10 50 3>&1 1>&2 2>&3)
      sudo useradd -m "$New_User" 2>error

      if [ $? -ne 0 ]; then
        whiptail --title "Error" --msgbox "Error: $(cat error)" 15 70
      else
        whiptail --title "Success" --msgbox "User $New_User added successfully." 10 50
      fi
      ;;
    2)
      # Remove User
      Remove_User=$(whiptail --title "Remove User" --inputbox "Enter username to remove:" 10 50 3>&1 1>&2 2>&3)
      sudo userdel -r "$Remove_User" 2>error

      if [ $? -ne 0 ]; then
        whiptail --title "Error" --msgbox "Error: $(cat error)" 15 70
      else
        whiptail --title "Success" --msgbox "User $Remove_User removed successfully." 10 50
      fi
      ;;

    3)

      source submenu.sh
      ;;

    4)
      # Change User Password
      Change_User_Password=$(whiptail --title "Change User Password" --inputbox "Enter username to change password:" 10 50 3>&1 1>&2 2>&3)
      New_Password=$(whiptail --title "Enter New Password" --passwordbox "Enter the new password:" 10 50 3>&1 1>&2 2>&3)
      echo "$New_Password" | sudo passwd --stdin "$Change_User_Password" 2>error

      if [ $? -ne 0 ]; then
        whiptail --title "Error" --msgbox "Error: $(cat error)" 15 70
      else
        whiptail --title "Success" --msgbox "Password for user $Change_User_Password changed successfully." 10 50
      fi
      ;;

    5)
      # List User Details
      List_User_Details=$(whiptail --title "List User Details" --inputbox "Enter username to list details:" 10 50 3>&1 1>&2 2>&3)
      User_Details=$(sudo id "$List_User_Details" 2>&1)
      if [ $? -ne 0 ]; then
        whiptail --title "Error" --msgbox "Error: $User_Details" 15 70
      else
        whiptail --title "User Details" --msgbox "$User_Details" 15 70
      fi
      ;;

    6)
      # Add Group
      Add_Group=$(whiptail --title "Add Group" --inputbox "Enter new group name:" 10 50 3>&1 1>&2 2>&3)
      sudo addgroup "$Add_Group" 2>error

      if [ $? -ne 0 ]; then
        whiptail --title "Error" --msgbox "Error: $(cat error)" 15 70
      else
        whiptail --title "Success" --msgbox "Group $Add_Group added successfully." 10 50
      fi
      ;;

    7)
      # Remove Group
      Remove_Group=$(whiptail --title "Remove Group" --inputbox "Enter group name to remove:" 10 50 3>&1 1>&2 2>&3)
      sudo groupdel "$Remove_Group" 2>error

      if [ $? -ne 0 ]; then
        whiptail --title "Error" --msgbox "Error: $(cat error)" 15 70
      else
        whiptail --title "Success" --msgbox "Group $Remove_Group removed successfully." 10 50
      fi
      ;;

    8)
      # Disable User
      Disable_User=$(whiptail --title "Disable User" --inputbox "Enter username to disable:" 10 50 3>&1 1>&2 2>&3)
      sudo usermod -L "$Disable_User" 2>error

      if [ $? -ne 0 ]; then
        whiptail --title "Error" --msgbox "Error: $(cat error)" 15 70
      else
        whiptail --title "Success" --msgbox "User $Disable_User disabled successfully." 10 50
      fi
      ;;

    9)
      # Enable User
      Enable_User=$(whiptail --title "Enable User" --inputbox "Enter username to enable:" 10 50 3>&1 1>&2 2>&3)
      sudo usermod -U "$Enable_User" 2>error

      if [ $? -ne 0 ]; then
        whiptail --title "Error" --msgbox "Error: $(cat error)" 15 70
      else
        whiptail --title "Success" --msgbox "User $Enable_User enabled successfully." 10 50
      fi
      ;;

    10)
      # Lock User Account
      Lock_User=$(whiptail --title "Lock User Account" --inputbox "Enter username to lock account:" 10 50 3>&1 1>&2 2>&3)
      sudo passwd -l "$Lock_User" 2>error

      if [ $? -ne 0 ]; then
        whiptail --title "Error" --msgbox "Error: $(cat error)" 15 70
      else
        whiptail --title "Success" --msgbox "User $Lock_User account locked successfully." 10 50
      fi
      ;;

    11)
      # Exit
      exit 0
      ;;
    esac
  done
}

# Main loop
main_menu

