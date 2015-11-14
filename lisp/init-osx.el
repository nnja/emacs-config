;;; OSX specific settings
;;; Borrowed heavily from https://github.com/rejeep/emacs

;; Switch the Cmd and Meta keys
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)


;; (global-set-key [C-M-s-f] nil)

;; Make the browser the OS X default
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

;; In dired, move deletions to trash
(setq delete-by-moving-to-trash t)

;; Make mouse wheel / trackpad scrolling less jerky
(setq mouse-wheel-scroll-amount '(0.001))

(defun finder ()
  "Opens file directory in Finder."
  (interactive)
  (let ((file (buffer-file-name)))
    (if file
        (shell-command
         (format "%s %s" (executable-find "open") (file-name-directory file)))
      (error "Buffer is not attached to any file."))))

;; Use GNU ls - install with:
;;    brew install xz
;;    brew install coreutils
;;(setq insert-directory-program "gls")

;; (when (memq window-system '(mac ns))	
;;   (exec-path-from-shell-initialize))

;; ;; osx specific fullscreen
;; (defun toggle-fullscreen ()
;;   "Toggle full screen"
;;   (interactive)
;;   (set-frame-parameter
;;    nil 'fullscreen
;;    (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
