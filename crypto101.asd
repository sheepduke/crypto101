(defsystem "cryptopals"
  :version "0.1.0"
  :author "YUE Daian"
  :license "MIT"
  :depends-on (qbase64)
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "cryptopals/tests"))))

(defsystem "cryptopals/tests"
  :author "YUE Daian"
  :license ""
  :depends-on ("cryptopals"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cryptopals"
  :perform (test-op (op c) (symbol-call :rove :run c)))
