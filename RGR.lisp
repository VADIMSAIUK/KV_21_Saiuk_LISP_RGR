(defun calculate-F (i)
  "Calculates F(i) for the system of equations:
   1.F(1) and F(10) are equal to 1.
   2.For i=2...9 : F(i) = (2 * SqrtF((i - 1)) * i)/4
   3.For i=11...20 : F(i) = F(i - 1) * Ln(i) / 8
   4.For undefined i returns 0 "
  (cond
    ((= i 1) 1)
    ((and (>= i 2) (<= i 9))
     (/ (* 2.0 (sqrt (calculate-F (- i 1))) (float i)) 4.0))

    ((= i 10) 1)
    ((and (>= i 11) (<= i 20)) 
     (/ (* (calculate-F (- i 1)) (log (float i))) 8.0))

    (t 0)))

(defun check-calculate-F (name input expected)
  "Execute `calculate-F' on `input', compare result with `expected' 
   and print comparison status."
  (format t "~:[FAILED~;PASSED~]... ~a: expected = ~a, result = ~a.~%"
          (equal (calculate-F input) expected)
          name
          expected
          (calculate-F input)))

(defun test-calculate-F ()
  (check-calculate-F "Test1 F(1)" 1 1)
  (check-calculate-F "Test2 F(9)" 9 15.379051) 
  (check-calculate-F "Test3 F(10)" 10 1) 
  (check-calculate-F "Test4 F(20)" 20 2.0372709e-5) 
  (check-calculate-F "Test5 F(21)" 21 0))
