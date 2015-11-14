;; (el-get 'sync 'django-mode)

;;; Requirement for direx popups
(require 'popwin)
(popwin-mode 1)

;;; Directory Direx
(require 'direx)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)

;; (push '(git-gutter:popup-diff :position right :width 25 :dedicated t)
;;       popwin:special-display-config)

(global-set-key (kbd "C-x C-d") 'direx:jump-to-directory-other-window)
(global-set-key (kbd "C-x C-k") 'direx-project:jump-to-project-root-other-window)

;;; Init Jedi Direx
(require 'jedi-direx)
(eval-after-load "python"
  '(define-key python-mode-map "\C-x\C-j" 'jedi-direx:pop-to-buffer))
(add-hook 'jedi-mode-hook 'jedi-direx:setup)

;; Jedi doc buffer should pop up too
(custom-set-variables
 '(display-buffer-function 'popwin:display-buffer))

(setq display-buffer-function 'popwin:display-buffer)
(push '("*git-gutter:diff*" :height 10 :position bottom :noselect 1) popwin:special-display-config)

;; git gutter popup
(push '("*jedi:doc*") popwin:special-display-config) ;; Add jedi document buffer configuration


;; (el-get 'sync 'yasnippet)
;; (yas/reload-all)
;; (add-hook 'prog-mode-hook
;;           '(lambda ()
;;              (yas-minor-mode)))

;; git gutter
;; (add-hook 'prog-mode-hook 'git-gutter-mode)


;;; Initialize Jedi
(require 'jedi)

;; Jedi Hooks
(add-hook 'python-mode-hook 'jedi:setup)
;; (add-hook 'django-mode-hook 'jedi:setup)

;; Jedi Auto Complete
(setq jedi:complete-on-dot t)

;;; Initialize elpy
;;; Requirements: pip install jedi, flake8, importmagic

;; (require 'package)
;; (add-to-list 'package-archives
;;              '("elpy" . "https://jorgenschaefer.github.io/packages/"))


;; Then: M-x package-refresh-contents
;; M-x package-install RET elpy RET

;; (require 'elpy)
(package-initialize)
(elpy-enable)

;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c l") 'yas-expand)
;; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

;;; Enable Python auto pair for triple quotes
(add-hook 'python-mode-hook
#'(lambda ()
    (setq autopair-handle-action-fns
          (list #'autopair-default-handle-action
                #'autopair-python-triple-quote-action))))


;; git gutter stuff, move eventually
(require 'git-gutter)

(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
(global-set-key (kbd "C-x v d") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; first character should be a space, less verbose in minor mode
(custom-set-variables
 '(git-gutter:lighter " GG"))

;; hide gutter if there are no variables
(custom-set-variables
 '(git-gutter:hide-gutter t))

(custom-set-variables
 '(git-gutter:modified-sign " ") ;; two space
 '(git-gutter:added-sign "+")    ;; multiple character is OK
 '(git-gutter:deleted-sign "-"))

(set-face-foreground 'git-gutter:modified "plum")
(set-face-foreground 'git-gutter:added "springgreen")
(set-face-foreground 'git-gutter:deleted "tomato")

;; play with this later
;; (el-get 'sync 'idle-highlight-mode)
