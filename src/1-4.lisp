(in-package cryptopals)

;;;; Detect single-character XOR
;;;;
;;;; One of the 60-character strings in this file has been encrypted by single-character XOR.
;;;;
;;;; Find it.
;;;;
;;;; (Your code from #3 should help.)

(defun detect-single-char-xor (input-file)
  "Detects the single string that are XOR against a single character in
INPUT-FILE.

Each line of INPUT-FILE is treated as a single hex string."
  (reduce (lambda (x acc)
            (if (> (string-score x) (string-score acc)) x acc))
          (iter (for line :in-file input-file :using #'read-line)
            (collect (crack-single-byte-xor-cipher line)))))
