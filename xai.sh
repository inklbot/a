#!/bin/bash

update_node() {
    read -p "Enter your PV Key: " PVKEY
    rm -f sentry-node-cli-linux  sentry-node-cli-linux.zip
    LATEST_RELEASE=$(curl -s https://api.github.com/repos/xai-foundation/sentry/releases/latest | jq -r '.tag_name')
    echo "The latest XAI Node release is: $LATEST_RELEASE"
    wget https://github.com/xai-foundation/sentry/releases/download/$LATEST_RELEASE/sentry-node-cli-linux.zip
    unzip sentry-node-cli-linux.zip
    ./sentry-node-cli-linux 
    boot-operator 
    $PVKEY
    echo "Done"
}

check_balances() {
    ./sentry-node-cli-linux 
    get-balances 
    0xfE51DB3b2D9Fc9B13972a64757545eB2b964B231
    echo "Done"
}

run_node() {
    while true; do
        read -p "Enter your PV Key: " PVKEY
        ./sentry-node-cli-linux 
        boot-operator 
        $PVKEY
        echo "Node has stopped. Restarting..."
    done
}

while true; do
    echo "1. Update Node"
    echo "2. Check Balances"
    echo "3. Run Node"
    echo "4. Exit"
    read -p "Select an option: " OPTION

    case $OPTION in
        1) update_node ;;
        2) check_balances ;;
        3) run_node ;;
        4) exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
