(defsystem cryptopals
  :description "Solution to the Cryptopals."
  :author "YUE Daian"
  :license "MIT"
  :version "0.0.1"
  :depends-on (#:iterate #:trivia #:cl-arrows #:flexi-streams #:str)
  :components ((:module "src"
                :components
                ((:file "packages")
                 (:file "1-1")
                 (:file "1-2")
                 (:file "1-3"))))
  :in-order-to ((test-op (test-op "cryptopals/tests"))))

(defsystem cryptopals/tests
  :description "Tests of cryptopals system"
  :author "YUE Daian"
  :license "MIT"
  :version "0.0.1"
  :depends-on (#:cryptopals #:rove)
  :components ((:module "tests"
                :components
                ((:file "packages")
                 (:file "set1"))))
  :perform (test-op (op c) (symbol-call :rove :run c)))
