(require :uiop)
(load "brackets.lisp")

(defun main ()
  (if (> (length (uiop:command-line-arguments)) 1)
    (brackets (elt (uiop:command-line-arguments) 0) (elt (uiop:command-line-arguments) 1))
    (brackets (elt (uiop:command-line-arguments) 0))
  )
)
