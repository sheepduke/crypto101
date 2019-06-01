(defsystem "crypto101"
  :version "0.1.0"
  :author "YUE Daian"
  :license "MIT"
  :depends-on (qbase64)
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "crypto101/tests"))))

(defsystem "crypto101/tests"
  :author "YUE Daian"
  :license ""
  :depends-on ("crypto101"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for crypto101"
  :perform (test-op (op c) (symbol-call :rove :run c)))
