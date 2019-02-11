# Generate server key
openssl genrsa -out server.key 2048 

# Generate server req
openssl req -new -key server.key -out server.csr -config openssl.conf

# Sign server req with CA key and generate server cert
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -extensions req_ext -extfile openssl.conf -out server.crt -days 3650 -sha256
