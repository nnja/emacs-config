;;; Git settings

;;; Magit for git
(el-get 'sync 'magit)

;; Quick shortcut for Magit status
(global-set-key (kbd "C-c g") 'magit-status)


;;; Git Gutter
(el-get 'sync 'git-gutter)

;; If you enable global minor mode
(global-git-gutter-mode t)

;; If you enable git-gutter-mode for some modes
;; (add-hook 'ruby-mode-hook 'git-gutter-mode)

(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; Git gutter lighter

;; Hide gutter if there are no changes
(setq git-gutter:hide-gutter t)

;; Customize Colors
(setq git-gutter:modified-sign " ") ;; two space
;; (setq git-gutter:added-sign "++")    ;; multiple character is OK
;; (setq git-gutter:deleted-sign "--")

;; blue: #81a2be
(set-face-background 'git-gutter:modified "#b294bb") ;; background color
(set-face-foreground 'git-gutter:added "#b5bd68")
(set-face-foreground 'git-gutter:deleted "#cc6666")
