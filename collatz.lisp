(defun collatz (n)
  (cond
    ((equal n 1) (list 1))
    ((evenp n) (cons n (collatz (/ n 2))))
    ((oddp  n) (cons n (collatz (+ (* n 3) 1))))))

(defun num_chains (start bound)
  (length
   (remove-if (lambda (lst)
                (<= (length lst) bound))
              (mapcar #'collatz
                      (loop for n from 1 below (+ start 1)
                         collect n)))))
