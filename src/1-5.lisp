(in-package cryptopals)

;;;; Implement repeating-key XOR
;;;; 
;;;; Here is the opening stanza of an important work of the English language:
;;;; 
;;;; Burning 'em, if you ain't quick and nimble
;;;; I go crazy when I hear a cymbal
;;;; 
;;;; Encrypt it, under the key "ICE", using repeating-key XOR.
;;;; 
;;;; In repeating-key XOR, you'll sequentially apply each byte of the key; the
;;;; first byte of plaintext will be XOR'd against I, the next C, the next E,
;;;; then I again for the 4th byte, and so on.
;;;; 
;;;; It should come out to:
;;;; 
;;;; 0b3637272a2b2e63622c2e69692a23693a2a3c6324202d623d63343c2a26226324272765272
;;;; a282b2f20430a652e2c652a3124333a653e2b2027630c692b20283165286326302e27282f
;;;; 
;;;; Encrypt a bunch of stuff using your repeating-key XOR function. Encrypt
;;;; your mail. Encrypt your password file. Your .sig file. Get a feel for
;;;; it. I promise, we aren't wasting your time with this.

(defun string-xor-repeating-key (raw-string cipher)
  "Encrypt RAW-STRING with CIPHER byte by byte, repeatedly."
  (octets-to-hex-string
   (iter
     (for input-char :in-string raw-string)
     (for index from 0)
     (for cipher-char = (elt cipher (mod index (length cipher))))
     (collect (logxor (char-code input-char) (char-code cipher-char))))))

(defun octets-to-hex-string (octets)
  "Encode BYTE-ARRAY to a hex string."
  (-<>> octets
        (map 'list #'octet-to-hex)
        (apply #'concatenate 'string)))

(octets-to-hex-string '#(12 45 16 78))

(defun octet-to-hex (octet)
  "Convert given byte OCTET to size-of-2 hex string."
  (concatenate 'string
               (write-to-string (ash octet -4) :base 16)
               (write-to-string (logand octet 15) :base 16)))
