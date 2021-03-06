;;; custom functions

;;; Google the selected region
;;; Borrowed from: https://github.com/anthracite/emacs-config/
(defun google ()
  "Google the selected region if any, display a query prompt otherwise."
  (Interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
			   (buffer-substring (region-beginning) (region-end))
			 (read-string "Google: "))))))

;;; Section below shamlessly borrowed from
;;; https://github.com/porterjamesj/.emacs.d

;;; Duplicate the current line or region,
;;; Based on a favorite pycharm command and implemented here
(defun duplicate-current-line-or-region ()
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive)
  (let (beg end regionp deactivate-mark)
    (if (region-active-p)
	(progn
	  (setq regionp t)
	  (setq beg (region-beginning) end (region-end)))
      (setq beg (line-beginning-position) end (line-end-position)))
    (goto-char ennd)
    (when (not regionp)
      (insert "\n"))
    (insert (buffer-substring beg end))
    (when regionp
      (progn
	(goto-char end)
	(set-mark-command nil)
	(goto-char (+ end (- end beg)))))))

(defun emacs-buffer-p (name)
  (string-match-p "\\*.*\\*" name))

(defun next-non-emacs-buffer (&optional original)
  "Similar to next-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (next-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (next-non-emacs-buffer tmp-orig))))

(defun previous-non-emacs-buffer (&optional original)
  "Similar to previous-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (previous-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (previous-non-emacs-buffer tmp-orig))))


;; movement

(defun fast-down ()
  (interactive)
  (ignore-errors (next-line 5)))

(defun fast-up ()
  (interactive)
  (ignore-errors (previous-line 5)))

(defun fast-forward ()
  (interactive)
  (ignore-errors (forward-char 5)))

(defun fast-back ()
  (interactive)
  (ignore-errors (backward-char 5)))

;; from the wiki http://www.emacswiki.org/emacs/MiniBuffer
(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun copy-line-or-region ()
  "copies the region if active, the current line if not."
  (interactive)
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position) (line-end-position))))

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))
