#To get subject name of the certificate.
openssl x509 -in certificate.trust.cert -noout -subject

#Serial number of the certificate:
openssl x509 -in certificate.trust.cert -noout -serial

# To reaad the public key in the certificate:
openssl x509 -in certificate.crt -noout -pubkey > publickey.pem
