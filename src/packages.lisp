(defpackage cryptopals
  (:use #:cl
        #:iterate)
  (:export #:hex-string-to-base64
           #:fixed-xor))
(in-package :cryptopals)
