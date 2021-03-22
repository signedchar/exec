(defun divisible (number)
  "Number is divisible for 3 or 5?"
  (if (or (zerop (mod number 3)) (zerop (mod number 5)))
      t
      nil))

(defun range-below (start stop)
  "Build a list between `start' to `stop' - 1."
  (cond ((> start stop) nil)
	((equal start stop) nil)
	(t (cons start (range-below (1+ start) stop)))))

(defun sum53 (start stop)
  "Summatory of the multiples of 3 and 5 between `start' to `stop'."
  (apply #'+ (remove-if-not #'divisible (range-below start stop))))
