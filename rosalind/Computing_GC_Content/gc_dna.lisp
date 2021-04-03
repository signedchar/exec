(defun read-fasta-to-lst (filename)
  "Read a file and return a list with the text.
for this source, read a fasta file."
  (with-open-file (in filename)
    (when in
      (loop for line = (read-line in nil)
	    while line
	    collect line))))

(defun one-line (list-of-strings)
  "Concatenate a list of strings in one string."
  (apply #'concatenate 'string list-of-strings))

(defun fasta-info (fasta)
  "first: the comment, second the sequence joined."
  (let ((fasta-lst (read-fasta-to-lst fasta)))
    (list (car fasta-lst) (one-line (cdr fasta-lst)))))

(defun fasta-dna (fasta)
  "Return only the DNA sequence."
  (cadr (fasta-info fasta)))

(defun dna-to-bases (dna &optional (start 0))
  "Transforming DNA string to letters (bases)"
  (let ((lng-dna (length dna)))
    (if (equal start lng-dna)
	nil
	(cons (char dna start)
	      (dna-to-bases dna (1+ start))))))

(defmacro counter-gen (counter-name)
  "Generate a let counter, with a personal name."
  `(let ((num -1))
     (defun ,counter-name ()
       (setf num (+ num 1)))))

(defmacro upcase-lowcase-base (action (upcase-base lowcase-base))
  "No duplicate source for upcase and lowcase DNA bases."
  `(or (equal ,action ,upcase-base) (equal ,action ,lowcase-base)))

(defun count-base (bases-lst)
  "Count the frecuency of Guanine and Cytosine."
  (if (equal nil bases-lst)
      (progn
	nil
	(list (guanine) (cytosine)))
      (cond ((upcase-lowcase-base (car bases-lst) (#\G #\g))
	     (guanine)
	     (count-base (cdr bases-lst)))
	    ((upcase-lowcase-base (car bases-lst) (#\C #\c))
	     (cytosine)
	     (count-base (cdr bases-lst)))
	    (t (count-base (cdr bases-lst))))))

(defun gc-calculus (gc leng-dna-string)
  "GC content calculus."
  (/ (* gc 100.0) leng-dna-string))

(defun counter-gc (dna-string)
  "Return the count of Guanine and Cytosine and the total length of `dna-string'."
  (let ((bases (dna-to-bases dna-string)))
    (counter-gen guanine)
    (counter-gen cytosine)
    (let ((count (count-base bases)))
      (let* ((gc-count (+ (first count) (second count)))
	     (leng-dna-string (length dna-string))
	     (gc (gc-calculus gc-count leng-dna-string)))
	(format t "Guanine and Cytosine count: ~A~% Total dna length: ~A~% GC calculus: ~A~%"
		gc-count leng-dna-string gc)))))
