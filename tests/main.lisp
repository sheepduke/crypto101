(defpackage crypto101/tests/main
  (:use :cl
        :crypto101
        :rove))
(in-package :crypto101/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :crypto101)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
