;;;; package.lisp

(uiop:define-package #:nineveh
    (:use #:cl #:cepl #:varjo-lang #:rtg-math :rtg-math.base-maths)
  (:export
   ;;
   ;; GPU
   ;;
   ;;------------------------------
   ;; log
   :log10
   ;;------------------------------
   ;; clamping
   :saturate
   ;;------------------------------
   ;; sampling
   :sample-equirectangular-tex
   :uv->cube-map-directions
   ;;------------------------------
   ;; misc
   :radical-inverse-vdc
   ;;------------------------------
   ;; mipmaps
   :mipmap-level->grey
   :mipmap-level->color

   ;;
   ;; CPU
   ;;
   ;;------------------------------
   ;; hdr
   :load-hdr-cross-image
   :load-hdr-cross-texture
   :load-hdr-2d
   ;;------------------------------
   ;; fbos.lisp
   :make-fbos-for-each-mipmap-of-cube-texture
   ;;------------------------------
   ;; textures
   :cube-faces

   ;;
   ;; Both
   ;;
   ;;------------------------------
   :bind-vec))
