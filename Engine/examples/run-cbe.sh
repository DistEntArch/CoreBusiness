cd ./Engine/examples/
opyrator launch-ui ui-accept-offer:accept_offer --port 8080 & 
sleep 2 
opyrator launch-api api-person-product-potential-real:person_product_potential_real --port 8081 & 
sleep 2 
opyrator launch-ui ui-cancel-contract:cancel_contract --port 8082 & 
sleep 2 
opyrator launch-ui ui-sign-contract:sign_contract --port 8083 & 
sleep 2 
opyrator launch-ui ui-decline-offer:decline_offer --port 8084 & 
sleep 2 
opyrator launch-api api-risk-product-potential-real:risk_product_potential_real --port 8085 & 
sleep 2 
opyrator launch-ui ui-file-claim:file_claim --port 8086 & 
sleep 2 
opyrator launch-ui ui-pay-claim:pay_claim --port 8087 & 
sleep 2 
ps aux | grep "python -m streamlit" | grep -v grep | awk '{print "kill -9 "$2}' > stop-cbe.sh
ps aux | grep "opyrator launch-api" | grep -v grep | awk '{print "kill -9 "$2}' >> stop-cbe.sh
echo "To stop all running engines execute 'sh ./Engine/examples/stop-cbe.sh'."
