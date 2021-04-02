(defun fib (number)
  (if (< number 2)
      number
      (+ (fib (1- number)) (fib (- number 2)))))
