;;; Python Stuff


;;; Set up direx to work with jedi and display a source tree viewer
(require 'jedi-direx)
(eval-after-load "python"
  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))


(load "init-jedi.el")

(el-get 'sync 'python-mode)
(el-get 'sync 'python-pep8)

;; Auto wrap for python mode
;; (add-hook 'python-mode-hook 'turn-on-auto-fill-mode)
;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (set-fill-column 79)))	

;; (el-get 'sync 'pymacs)
;; (el-get 'sync 'rope)
;; (el-get 'sync 'ropemacs)
;; (el-get 'sync 'ropemode)

;; (pymacs-load "ropemacs" "rope-")

;;;rope-show-doc
;;;(setq jedi:key-show-doc (kbd "C-c D"))

