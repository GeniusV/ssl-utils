# Generate server key in my_keystore
# Enter keystore password:  123456
# Re-enter new password:    123456
# What is your first and last name?
#   [Unknown]:  GeniusV
# What is the name of your organizational unit?
#   [Unknown]:  GeniusV
# What is the name of your organization?
#   [Unknown]:  GeniusV
# What is the name of your City or Locality?
#   [Unknown]:  Shanghai
# What is the name of your State or Province?
#   [Unknown]:  Shanghai
# What is the two-letter country code for this unit?
#   [Unknown]:  CN
# Is CN=GeniusV, OU=GeniusV, O=GeniusV, L=Shanghai, ST=Shanghai, C=CN correct?
#   [no]:  yes

# Enter key password for <server>
#     (RETURN if same as keystore password): RETURN
keytool -genkey -alias server -keyalg RSA -keystore my_keystore

# Generate key req
# Tested the -ext is not require if using ca to sign.
# keytool -certreq -alias server -file server.csr -validity 3650 -keyalg RSA -keystore my_keystore -ext san=dns:cas.example.org
keytool -certreq -alias server -file server.csr -validity 3650 -keyalg RSA -keystore my_keystore

# Sign with CA
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -extensions req_ext -extfile openssl.conf -out server.crt -days 365 -sha256

# Import CA crt
keytool -import -v -trustcacerts -alias ca -file ca.crt -keystore my_keystore

# Import server crt
keytool -import -v -trustcacerts -alias server -file server.crt -keystore my_keystore





