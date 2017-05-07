(in-package :nineveh.noise)

(defun-g simplex-3d-get-corner-vectors ((p :vec3))
  (let* ((skew-factor (v3! (/ 1.0 3.0)))
         (unskew-factor (v3! (/ 1.0 6.0)))
         (simplex-corner-pos (v3! 0.5))
         (simplex-pyramid-height (v3! 0.7071068)))
    (multf p simplex-pyramid-height)
    (let* ((pi (floor (+ p (v3! (dot p skew-factor)))))
           (x0 (- p (+ pi (v3! (dot pi unskew-factor)))))
           (g (step (s~ x0 :yzx) (s~ x0 :xyz)))
           (l (- (v3! 1.0) g))
           (pi-1 (min (s~ g :xyz) (s~ l :zxy)))
           (pi-2 (max (s~ g :xyz) (s~ l :zxy)))
           (x1 (- x0 (+ pi-1 unskew-factor)))
           (x2 (- x0 (+ pi-2 skew-factor)))
           (x3 (- x0 simplex-corner-pos))
           (v1234-x (v4! (x x0) (x x1) (x x2) (x x3)))
           (v1234-y (v4! (y x0) (y x1) (y x2) (y x3)))
           (v1234-z (v4! (z x0) (z x1) (z x2) (z x3))))
      (values pi pi-1 pi-2 v1234-x v1234-y v1234-z))))

(defun-g simplex-3d-get-surflet-weights ((v1234-x :vec4)
                                         (v1234-y :vec4)
                                         (v1234-z :vec4))
  (let* ((surflet-weights (+ (* v1234-x v1234-x)
                             (+ (* v1234-y v1234-y)
                                (* v1234-z v1234-z)))))
    (setf surflet-weights (max (- (v4! 0.5) surflet-weights) 0.0))
    (* surflet-weights (* surflet-weights surflet-weights))))
