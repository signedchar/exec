(defun dna-str-to-bases (dna &optional (start 0))
  (let ((lng-dna (length dna)))
    (if (equal start lng-dna)
	nil
	(cons (char dna start)
	      (dna-str-to-bases dna (1+ start))))))

(defun dna-to-rna (dna)
  (let ((dna-lst (dna-str-to-bases dna)))
    (concatenate 'string
		 (mapcar #'(lambda (base)
			     (cond ((equal base #\t) #\u)
				   ((equal base #\T) #\U)
				   (t base)))
			 dna-lst))))
