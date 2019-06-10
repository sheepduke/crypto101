(defsystem cryptopals
  :description "Solution to the Cryptopals."
  :author "YUE Daian"
  :license "MIT"
  :version "0.0.1"
  :depends-on (:iterate)
  :components ((:module "src"
                        :components
                        ((:file "packages")
                         (:file "cryptopals"))))
  :in-order-to ((test-op (test-op "cl-republic/tests"))))

(defsystem cryptopals/tests
  :description "Tests of cryptopals system"
  :author "YUE Daian"
  :license "MIT"
  :version "0.0.1"
  :depends-on (:cryptopals :rove)
  :components ((:module "src"
                        :components
                        ((:file "packages"))))
  :perform (test-op (op c) (symbol-call :rove :run c)))
