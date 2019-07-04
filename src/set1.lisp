(in-package :cryptopals)

(defun hex-string-to-base64 (hex-string)
  "Convert a hex string HEX-STRING to base64 encoded string."
  (map 'string
       (lambda (number)
         (cond
           ((<= 0 number 25) (code-char (+ (char-code #\A) number)))
           ((<= 26 number 51) (code-char (+ (char-code #\a) (- number 26))))
           ((<= 52 number 61) (code-char (+ (char-code #\0) (- number 52))))
           ((= number 62) #\+)
           ((= number 63) #\/)))
       (iter
         (with result = (make-array 0 :adjustable t :fill-pointer t))
         (for index :from 0 :to (- (length hex-string) 3) :by 3)
         (for first-hex = (parse-integer hex-string
                                         :start index
                                         :end (1+ index)
                                         :radix 16))
         (for second-hex = (parse-integer hex-string
                                          :start (1+ index)
                                          :end (+ index 2)
                                          :radix 16))
         (for third-hex = (parse-integer hex-string
                                         :start (+ index 2)
                                         :end (+ index 3)
                                         :radix 16))
         ;; xxxx xxxx xxxx => xxxxxx xxxxxx
         (vector-push-extend (logior (ash first-hex 2) (ash second-hex -2))
                             result)
         (vector-push-extend (logior (ash (logand second-hex 3) 4) third-hex)
                             result)
         (finally (return result)))))

(defun fixed-xor (s1 s2)
  "Takes two equal-length buffers and produces their XOR combination in string."
  (write-to-string (logxor (parse-integer s1 :radix 16)
                           (parse-integer s2 :radix 16))
                   :base 16))
