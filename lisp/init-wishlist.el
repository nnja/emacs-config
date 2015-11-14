;;; A 'Scratch' buffer of emacs nice to haves, or things to check out
;;; Not referenced from my main init.el

;; fix tabs indenting
(setq-default indent-tabs-mode nil)

;; setup whitespace mode
(custom-set-variables
 '(whitespace-line-column 80)
 '(whitespace-style '(face trailing tabs lines-tail)))

;; automatically delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
