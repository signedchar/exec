(defun get-base (dna &optional (start 0))
  (let ((lng-dna (length dna)))
    (if (equal start lng-dna)
	nil
	(cons (char dna start)
	      (get-base dna (1+ start))))))

(defmacro counter-gen (counter-name)
  `(let ((num -1))
     (defun ,counter-name ()
       (setf num (+ num 1)))))

(defmacro up-low-case (action (upcase-dna lowcase-dna))
  `(or (equal ,action ,upcase-dna) (equal ,action ,lowcase-dna)))

(defun count-base (lst-dna)
  (if (equal nil lst-dna)
      (progn
	nil
	(list (aa) (tt) (gg) (cc)))
      (cond ((up-low-case (car lst-dna) (#\A #\a)) (aa) (count-base (cdr lst-dna)))
	    ((up-low-case (car lst-dna) (#\T #\t)) (tt) (count-base (cdr lst-dna)))
	    ((up-low-case (car lst-dna) (#\G #\g)) (gg) (count-base (cdr lst-dna)))
	    ((up-low-case (car lst-dna) (#\C #\c)) (cc) (count-base (cdr lst-dna))))))

(defun counter-dna (dna-string)
  (let ((bases (get-base dna-string)))
    (counter-gen aa)
    (counter-gen tt)
    (counter-gen gg)
    (counter-gen cc)
    (let ((count (count-base bases)))
      (format t "Adenine: ~A Thymine: ~A Guanine: ~A Cytosine: ~A~%"
	      (first count) (second count) (third count) (fourth count)))))
