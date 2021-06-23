cd ./Engine/examples/
opyrator launch-ui gui-accept-offer:accept_offer --port 8080 & 
sleep 2 
opyrator launch-ui gui-sign-contract:sign_contract --port 8081 & 
sleep 2 
opyrator launch-ui gui-cancel-contract:cancel_contract --port 8082 & 
sleep 2 
ps aux | grep "python -m streamlit" | grep -v grep | awk '{print "kill -9 "$2}' > stop-cbe.sh
echo "To stop all running engines execute 'sh ./Engine/examples/stop-cbe.sh'."
