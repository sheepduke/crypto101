(defsystem "cryptopals"
  :version "0.1.0"
  :author "YUE Daian"
  :license "MIT"
  :depends-on (#:iterate
                #:qbase64)
  :components ((:module "src"
                :components
                ((:file "packages")
                 (:file "set1"))))
  :description ""
  :in-order-to ((test-op (test-op "cryptopals/tests"))))

(defsystem "cryptopals/tests"
  :author "YUE Daian"
  :license ""
  :depends-on ("cryptopals"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "packages")
                 (:file "set1"))))
  :description "Test system for cryptopals"
  :perform (test-op (op c) (symbol-call :rove :run c)))
