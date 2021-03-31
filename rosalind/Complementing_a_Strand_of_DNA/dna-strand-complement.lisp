(defun dna-str-to-bases (dna &optional (start 0))
  (let ((lng-dna (length dna)))
    (if (equal start lng-dna)
	nil
	(cons (char dna start)
	      (dna-str-to-bases dna (1+ start))))))

(defun dna-complement (dna)
  (let ((dna-lst (dna-str-to-bases dna)))
    (reverse
     (concatenate 'string
		  (mapcar #'(lambda (base)
			      (cond ((equal base #\A) #\T)
				    ((equal base #\T) #\A)
				    ((equal base #\G) #\C)
				    ((equal base #\C) #\G)))
			  dna-lst)))))
