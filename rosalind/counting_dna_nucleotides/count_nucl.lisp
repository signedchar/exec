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

(defmacro base-equal 

(defun count-base (lst-dna)
  (if (equal nil lst-dna)
      (progn
	nil
	(list (aa) (tt) (gg) (cc)))
      (cond ((equal (car lst-dna) #\A) (aa) (count-base (cdr lst-dna)))
	    ((equal (car lst-dna) #\T) (tt) (count-base (cdr lst-dna)))
	    ((equal (car lst-dna) #\G) (gg) (count-base (cdr lst-dna)))
	    ((equal (car lst-dna) #\C) (cc) (count-base (cdr lst-dna))))))

(defun counter-dna (dna-string)
  (let ((bases (get-base dna-string)))
    (counter-gen aa)
    (counter-gen tt)
    (counter-gen gg)
    (counter-gen cc)
    (let ((count (count-base bases)))
      (format t "~A~%" count))))
