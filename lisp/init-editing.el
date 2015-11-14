;;; init-editing.el

(el-get 'sync 'goto-last-change)
(require 'goto-last-change)
(global-set-key (kbd "C-x C-/") 'goto-last-change)

;; Sass mode
(el-get 'sync 'sass-mode)

;; Save place
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved-places")

;; move (shift) a line of text up or down like you would do in Eclipse
;; pressing `M-up' (or `M-down')
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (let ((col (current-column))
        start
        end)
    (beginning-of-line)
    (setq start (point))
    (end-of-line)
    (forward-char)
    (setq end (point))
    (let ((line-text (delete-and-extract-region start end)))
      (forward-line n)
      (insert line-text)
      ;; restore point to original column in moved line
      (forward-line -1)
      (forward-char col))))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "<M-up>") 'move-line-up)
(global-set-key (kbd "<M-down>") 'move-line-down)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "M-/") 'hippie-expand)

;;; Auto pair parenths and brackets, enabled in all buffers
(el-get 'sync 'autopair)
(autopair-global-mode)
;; enable hs-minor mode
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; Explicitly show the end of a buffer
(set-default 'indicate-empty-lines t)

;;; Editor Config
;; (load "editorconfig")

;;; Indent Modes
;; No Tabs
(setq-default indent-tabs-mode nil)

;;; default html indent to 2 spaces
(setq nxml-child-indent 2)

;;; js mode to two spaces
(setq js-indent-level 2)

;;; css, scss, sass two spaces
(setq css-indent-offset 4)

;;; java mode, 2 for now.
(setq java-indent-level 2)
