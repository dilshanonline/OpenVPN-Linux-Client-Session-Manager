#!/bin/bash
# Open VPN Linux Client Session Manager

user_name="username"
vpn_profile="profile-ID"

clear
echo -e "                           "
echo -e "╭━━━╮╱╱╱╱╱╱╱╭╮╱╱╭┳━━━┳━╮╱╭╮"
echo -e "┃╭━╮┃╱╱╱╱╱╱╱┃╰╮╭╯┃╭━╮┃┃╰╮┃┃"
echo -e "┃┃╱┃┣━━┳━━┳━╋╮┃┃╭┫╰━╯┃╭╮╰╯┃"
echo -e "┃┃╱┃┃╭╮┃┃━┫╭╮┫╰╯┃┃╭━━┫┃╰╮┃┃"
echo -e "┃╰━╯┃╰╯┃┃━┫┃┃┣╮╭╯┃┃╱╱┃┃╱┃┃┃"
echo -e "╰━━━┫╭━┻━━┻╯╰╯╰╯╱╰╯╱╱╰╯╱╰━╯"
echo -e "╱╱╱╱┃┃                     "
echo -e "╱╱╱╱╰╯                     "

function printlist {
    echo ''
    echo -e 'Open VPN Linux Client Session Manager:'
    echo -e '\t  1. Connect'
    echo -e '\t  2. Disconnect'
    echo -e '\t  3. Restart'
    echo -e '\t  4. List Config'
    echo -e '\t  5. List Session'
    echo -e '\t  6. Session Stats'
    echo -e '\t  7. Logs'
    echo ''
    read -p 'Enter ID : ' envid
    echo '************************************'
    echo ''
}

function connectopenvpn {
    if [ $envid = '1' ]
        then
        echo -e "\t Username is : $user_name"
        echo ''
        echo '************************************'
        openvpn3 session-start --config $vpn_profile

    elif [ $envid = '2' ]
        then
        openvpn3 session-manage --config $vpn_profile --disconnect

    elif [ $envid = '3' ]
        then
        openvpn3 session-manage --config $vpn_profile --restart

    elif [ $envid = '4' ]
        then
        openvpn3 configs-list

    elif [ $envid = '5' ]
        then
        openvpn3 sessions-list

    elif [ $envid = '6' ]
        then
        openvpn3 session-stats --config $vpn_profile

    elif [ $envid = '7' ]
        then
        openvpn3 session-stats --config $vpn_profile

    else
        echo -e "\tIncorrect Selection"
        echo ''
        echo -e '************************************ '
    fi
}

printlist
connectopenvpn