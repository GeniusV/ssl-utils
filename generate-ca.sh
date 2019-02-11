# Generate CA private key 
# Password: 123456
openssl genrsa -des3 -out ca.key 4096

# Generate CSR 
# Country Name (2 letter code) []:CN
# State or Province Name (full name) []:Shanghai
# Locality Name (eg, city) []:Shanghai
# Organization Name (eg, company) []:GeniusV
# Organizational Unit Name (eg, section) []:Admin
# Common Name (eg, fully qualified host name) []:GeniusV Root CA
# Email Address []:ca@geniusver.com
# A challenge password []:123456
openssl req -x509 -new -nodes -key ca.key -sha256 -days 36500 -out ca.crt




