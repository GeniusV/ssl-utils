## SSL Utils

This is a util collection to generate SSL certificates. 

## How to use

It is highly recommended to generate a self-signed CA certificate first so that we only need to trust ca certificate and all other certificate singed by the ca key are automatically trusted.

First, make a `openssl.conf`.
``` bash
cp openssl.conf.template openssl.conf
```

Then config `openssl.conf`, replace `your.domain` and other properties.

Run `generate-ca.sh` to generate ca key and certificate.
``` bash
./generate-ca.sh
```

Now you may need to trust `ca.crt` or import it to your browser.

To generate a certificate used in https, run `generate-crt.sh`. The key should be `server.key` and the certificate should be `server.crt`,

To generate a `JKS` format keystore used in Java world, run `generate-ssl_keytool.sh`. The result is a `my_keystore` file.

You can also use other scripts to convert certificate format.

The generated certificate are tested and works well in chrome 72.0.3626.96.


