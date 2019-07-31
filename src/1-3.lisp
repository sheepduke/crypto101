(in-package cryptopals)

;;;; Single-byte XOR cipher
;;;;
;;;; The hex encoded string:
;;;;
;;;; 1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736
;;;;
;;;; ... has been XOR'd against a single character. Find the key, decrypt the
;;;; message.
;;;;
;;;; You can do this by hand. But don't: write code to do it for you.
;;;; 
;;;; How? Devise some method for "scoring" a piece of English
;;;; plaintext. Character frequency is a good metric. Evaluate each output and
;;;; choose the one with the best score.

(defun char-score (char)
  "Return a number representing the frequency score of given CHAR."
  (match char
    ((or #\a #\A) 8.167)
    ((or #\b #\B) 1.492)
    ((or #\c #\C) 2.782)
    ((or #\d #\D) 4.253)
    ((or #\e #\E) 12.702)
    ((or #\f #\F) 2.228)
    ((or #\g #\G) 2.015)
    ((or #\h #\H) 6.094)
    ((or #\i #\I) 6.966)
    ((or #\j #\J) 0.153)
    ((or #\k #\K) 0.772)
    ((or #\l #\L) 4.025)
    ((or #\m #\M) 2.406)
    ((or #\n #\N) 6.749)
    ((or #\o #\O) 7.507)
    ((or #\p #\P) 1.929)
    ((or #\q #\Q) 0.095)
    ((or #\r #\R) 5.987)
    ((or #\s #\S) 6.327)
    ((or #\t #\T) 9.056)
    ((or #\u #\U) 2.758)
    ((or #\v #\V) 0.978)
    ((or #\w #\W) 2.360)
    ((or #\x #\X) 0.150)
    ((or #\y #\Y) 1.974)
    ((or #\z #\Z) 0.074)
    ((or #\newline #\? #\! #\, #\space #\. #\' #\") 0.001)
    ((guard _ (or (> (char-code char) 127) (< (char-code char) 32))) -100)
    (_ -10)))

(defun string-score (string)
  "Return the frequency score of given STRING."
  (-<> string
    (map 'list #'char-score <>)
    (reduce #'+ <>)))

(defun hex-string-to-byte-array (hex-string)
  "Decode given HEX-STRING and return its bytes."
  (when (oddp (length hex-string))
    (setf hex-string (str:concat "0" hex-string)))
  (iter (for i :from 0 :below (1- (length hex-string)) :by 2)
    (collect (parse-integer (subseq hex-string i (+ i 2)) :radix 16))))

(defun byte-array-xor-byte (byte-array byte)
  "Calculate xor between BYTE-ARRAY and BYTE and return the newly generated
byte array."
  (map 'vector (lambda (b) (logxor b byte)) byte-array))

(defun crack-single-byte-xor-cipher (hex-string)
  "The given message HEX-STRING is a string encrypted using a single character.
Cracks it using possible single characters and return the result with the
highest score."
  (let* ((byte-array (hex-string-to-byte-array hex-string)))
    (-<>> (iter (for i from 0 to 255) (collect i))
      (mapcar (lambda (byte)
                (byte-array-xor-byte byte-array byte)))
      (mapcar #'flex:octets-to-string)
      (mapcar (lambda (it) (list :score (string-score it) :message it)))
      (reduce (lambda (it acc)
                (if (> (getf it :score) (getf acc :score)) it acc)))
      (getf <> :message))))
