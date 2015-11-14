;; Custom Key Bindings
;; ---------------

;; emacs newlines and indents when enter key
(global-set-key (kbd "C-m") 'newline-and-indent)


;; C-k at beginning of line takes the whole line (no need to c-k twice)
(setq kill-whole-line t)


;; Font size - This is going to be handy for presentations
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)


;; Jump to a definition in the current file. (Protip: this is awesome.)
(global-set-key (kbd "C-x C-i") 'imenu)


;; Custom key bindings
(global-set-key (kbd "M-:") 'comment-or-uncomment-region-or-line)

;; Navigate python methods with s-down and s-up
(global-set-key [s-down] 'python-goto-next-def)
(global-set-key [s-up] 'python-goto-prev-def)

;; Duplicate current line or region
(global-set-key (kbd "C-c C-d") 'duplicate-current-line-or-region)

;; Hide/Show Code Folding
(global-set-key (kbd "C-c h") 'hs-toggle-hiding)
(global-set-key (kbd "C-c f") 'hs-hide-all)
(global-set-key (kbd "C-c a") 'hs-show-all)

;; Repeating C-e and C-a will move the cursor to the next line
(defun move-end-of-line-or-next-line ()
  (interactive)
  (if (and (eolp)
	   (eq last-command 'move-end-of-line-or-next-line))
      (move-end-of-line 2)
    (move-end-of-line nil)))
(global-set-key (kbd "C-e") 'move-end-of-line-or-next-line)

(defun move-start-of-line-or-prev-line ()
  (interactive)
  (if (and (bolp)
	   (eq last-command 'move-start-of-line-or-prev-line))
      (move-beginning-of-line 0)
    (move-beginning-of-line nil)))
(global-set-key (kbd "C-a") 'move-start-of-line-or-prev-line)


;; Javier's mark whole line function - Still can't find a keybinding I like
(defun mark-whole-line ()
  "marks line"
  (interactive)
  (back-to-indentation)
  (call-interactively 'set-mark-command)
  (call-interactively 'move-end-of-line))
;;;  (global-set-key (kbd "C-s-l") 'mark-whole-line)
