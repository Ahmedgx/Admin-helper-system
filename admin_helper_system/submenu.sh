#!/bin/bash

Submenu() {
    while true; do

        Update_User=$(whiptail --title "Update User" --inputbox "Enter username to update:" 10 50 3>&1 1>&2 2>&3)

        if [ -z "$Update_User" ]; then
            return # Return to main menu if the user presses Cancel
        fi

        # Verify if the entered username exists
        if ! id "$Update_User" &>/dev/null; then
            whiptail --title "Error" --msgbox "Error: User $Update_User does not exist." 15 70
            continue
        fi

        SUB_OPTIONS=$(whiptail --title "Update User" --menu "Choose an option to update:" 15 60 5 \
            "1" "Update Username" \
            "2" "Update UID" \
            "3" "Update Subgroup" \
            "4" "Update Main Group" \
            "5" "Cancel" 3>&1 1>&2 2>&3)

        case $SUB_OPTIONS in
        1)
            # Update Username
            New_Username=$(whiptail --title "Update Username" --inputbox "Enter new username:" 10 50 3>&1 1>&2 2>&3)
            sudo usermod -l "$New_Username" "$Update_User" 2>error

            if [ $? -ne 0 ]; then
                whiptail --title "Error" --msgbox "Error: $(cat error)" 15 70
            else
                whiptail --title "Success" --msgbox "User $Update_User updated successfully." 10 50
            fi
            ;;

        2)
            # Update UID
            New_UID=$(whiptail --title "Update UID" --inputbox "Enter new UID:" 10 50 3>&1 1>&2 2>&3)
            sudo usermod -u "$New_UID" "$Update_User" 2>error

            if [ $? -ne 0 ]; then
                whiptail --title "Error" --msgbox "Error: $(cat error)" 15 70
            else
                whiptail --title "Success" --msgbox "User $Update_User UID updated successfully." 10 50
            fi
            ;;

        3)
            # Update Supplementary Group
            New_Supplementary_Group=$(whiptail --title "Update Supplementary Group" --inputbox "Enter new Supplementary Group:" 10 50 3>&1 1>&2 2>&3)
            sudo usermod -aG "$New_Supplementary_Group" "$Update_User" 2>error

            if [ $? -ne 0 ]; then
                whiptail --title "Error" --msgbox "Error: $(cat error)" 15 70
            else
                whiptail --title "Success" --msgbox "User $Update_User Supplementary Group updated successfully." 10 50
            fi
            ;;

        4)
            # Update Main Group
            New_Main_Group=$(whiptail --title "Update Main Group" --inputbox "Enter new main group:" 10 50 3>&1 1>&2 2>&3)
            sudo usermod -g "$New_Main_Group" "$Update_User" 2>error

            if [ $? -ne 0 ]; then
                whiptail --title "Error" --msgbox "Error: $(cat error)" 15 70
            else
                whiptail --title "Success" --msgbox "User $Update_User main group updated successfully." 10 50
            fi
            ;;

        5)
            return
            ;;
        esac
    done
}

Submenu

