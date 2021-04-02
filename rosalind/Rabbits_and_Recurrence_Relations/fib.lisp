(defun fib (number &optional (pairs 1))
  "Fibonacci of a number, using pairs of rabbits."
  (cond ((zerop number) 0)
	((equal number 1) 1)
	(t (+ (* pairs (fib (1- number)))
	      (* pairs (fib (- number 2)))))))

(defun fib (number &optional (pairs 1))
  "Another joke fibonacci function, using pairs of rabbits."
  (cond ((zerop number) 0)
	((equal number 1) 1)
	(t (funcall #'(lambda (x)
			(+ (* pairs (fib (1- x))) (* pairs (fib (- x 2)))))
		    number))))

(defun fib-lst (number &optional (pairs 1))
  "List of fibonacci numbers, using pairs of rabbits."
  (if (equal number -1)
      nil
      (cons (fib number pairs)
	    (fib-lst (1- number) pairs))))

(defun rabbits (number &optional (pairs 1))
  "Summatory of the rabbits."
  (apply #'+ (cdr (fib-lst number pairs))))
