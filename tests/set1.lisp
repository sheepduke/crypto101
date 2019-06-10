(in-package :cryptopals/tests)

(deftest hex-string-to-base64
  (let ((hex "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"))
    (ok (string-equal (hex-string-to-base64 hex)
                      "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"))))
