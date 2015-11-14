;;; init-general.el

;;; no mesage in the scratch buffer
(setq initial-scratch-message nil)

;;; Hide the Tool and Scroll Bars, Inhibit the Splash Screen
(setq inhibit-splash-screen t)

(custom-set-variables
  '(scroll-bar-mode nil)
  '(tool-bar-mode nil))
  '(menu-bar-mode)

;;; Put silly foo~ files elsewhere.
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;; Emacs, stop asking me so many questions.
;;; Kill the buffer without being questioned
(global-set-key [(control x) (k)] 'kill-this-buffer)

;;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;;; Turn on line numbers
;;; (global-linum-mode 1)

;; Remove the confirmation when opening a file/directory that doesn't exist
(setq confirm-nonexistent-file-or-buffer nil)

;;; Auto complete all the things
;; (el-get 'sync 'auto-complete)
;; (require 'auto-complete)
;(global-auto-complete-mode t)

;;; Rainbow delimeters mode
(el-get 'sync 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Make matching parenthesis light up
(setq show-paren-style 'parenthesis)
(show-paren-mode t)

;;; force new frames into existing window
(setq ns-pop-up-frames nil)

;;; no bell
(setq ring-bell-function 'ignore)

;;; smooth scrolling
(setq scroll-conservatively 10000 scroll-step 1)

;; And highlight current line
(global-hl-line-mode +1)

;; If two files have the same name, name by enclosing-folder/filename
(toggle-uniquify-buffer-names)

;; Yaml-mode
(el-get 'sync 'yaml-mode)

;; Markdown-mode
(el-get 'sync 'markdown-mode)

;;;---------------------------------------------------------------------
;;; change behavious of builtins

(defadvice kill-line (around kill-region-if-active activate)
  "kill region if active with C-k"
  (if (and (called-interactively-p 'any)
           (region-active-p))
      (kill-region (region-beginning) (region-end))
    ad-do-it))

(defadvice yank (after indent-region activate)
  "To make yank content indent automatically."
  (if (member major-mode '(emacs-lisp-mode
                           scheme-mode
                           lisp-mode
                           lisp-interaction-mode
                           c-mode
                           c++-mode
                           objc-mode
                           latex-mode
                           plain-tex-mode))
      (indent-region (region-beginning) (region-end) nil)))

;;; No stupid dialog, which crashes emacs on Mac
(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
