(defpackage #:clog-user
  (:use #:cl #:clog)
  (:export start-tutorial))

(in-package :clog-user)

(defun on-new-window (body)
  (let* ((console (create-panel-box-layout body :left-width 200 :right-width 0))
	 (head    (create-div (top-panel console) :content "Image Viewer"))
	 (lbox    (create-select (left-panel console)))
	 (viewer  (create-img (center-panel console)))
	 (footer  (create-div (bottom-panel console)
			      :content "(c) 2021 David Botton - BSD 3 Lic.")))
    (declare (ignore footer))
    ;; Setup Top
    (setf (background-color (top-panel console)) :teal)
    (setf (display (top-panel console)) :flex)
    (setf (justify-content (top-panel console)) :center)
    (setf (align-items (top-panel console)) :center)
    (setf (color head) :white)
    ;; Setup viewer
    (setf (width viewer) "100%")
    ;; Setup File List
    (setf (background-color (left-panel console)) :grey)
    (setf (positioning lbox) :absolute)
    (setf (size lbox) 2) ;; A size above 1 needed to get listbox
    (set-geometry lbox :left 0 :top 0 :bottom 0 :width 200)
    (add-select-options lbox '("kiarash-mansouri-fzoSNcxqtp8-unsplash.jpg"
			       "windmills.jpg"
			       "yellow-clogs.jpg"
			       "clogicon.png"))
    (set-on-change lbox (lambda (obj)
			  (declare (ignore obj))
			  (setf (url-src viewer) (format nil "/img/~A"
							 (value lbox)))))
    ;; Setup Bottom
    (setf (display (bottom-panel console)) :flex)
    (setf (align-items (bottom-panel console)) :center)
    (run body)))

(defun start-tutorial ()
  (initialize 'on-new-window)
  (open-browser))
