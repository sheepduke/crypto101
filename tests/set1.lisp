(in-package :cryptopals/tests)

(deftest test-hex-string-to-base64
  (let ((hex "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"))
    (ok (string-equal (hex-string-to-base64 hex)
                      "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"))))


(deftest test-fixed-xor
  (let ((buffer1 "1c0111001f010100061a024b53535009181c")
        (buffer2 "686974207468652062756c6c277320657965")
        (result "746865206b696420646f6e277420706c6179"))
    (ok (string-equal (fixed-xor buffer1 buffer2) result))))
