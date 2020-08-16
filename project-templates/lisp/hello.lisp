;; Ctrl+Enter will evaluate the previous expression

(defun hello ()
  (+ 1 2))

;; try pressing Ctrl+Enter before this line
;; HELLO should pop up in the bottom right

;; You can quickly see what the return value is for
;; an expression by evaluating it. Evaluate the expression
;; on the next line by placing your cursor at the end of the
;; line. You should get an output message of 3
(hello)

;; Sometimes you want to verify that your program is well-formed
;; Lisp won't do this automatically but you can do this by bringing

;; up the Command Palette in VS Code
;; - On Mac: Cmd + Shift + P
;; - On Windows: Ctrl + Shift + P
;;
;; Once the command palette is open, you can start typing:
;;    Lisp: Compile And Load File
;;
;; If you have any errors, they will be highlighted. The "Problems"
;; tab on the bottom will list all errors. Below is an ill-formed line

(+ bar baz)

;; Running and loading an entire file
;;
;; - Option 1 : clisp from the command line
;;   1. invoke clisp from a new bash terminal session below
;;   2. type: (use "hello.lisp")
;;      this will load this file -- hello.lisp -- into the interpreter
;;   3. type whatever sequence of operations you want to run
;;   4. to quit, type (exit)
;;
;; - Option 2 : Start a REPL from VS Code
;;   1. type: Ctrl + Shift + Enter
;;   2. the current file will *automatically* be loaded into the REPL
;;   3. type whatever sequence of operations you want to run
;;   4. to quit, type (exit)

