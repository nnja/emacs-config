;;; init-color-theme.el

;;; Add custom directory for themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;;; Current favorite - tomorrow night theme.
(el-get 'sync 'color-theme-tomorrow)
(color-theme-tomorrow-night-eighties)

;;; Solarized is a solid backup
;; (el-get 'sync 'color-theme-solarized)
;; (color-theme-solarized-dark)


;;; Nyan cat mode
(el-get 'sync 'nyan-mode)
(nyan-mode t)

;;; Font
;; (set-face-attribute 'default nil :font "Anonymous Pro Minus-15")
;; latest
(set-face-attribute 'default nil :font "Fira Mono-15")
;; (set-face-attribute 'default nil :font "Fira Mono-17")

;; (set-face-attribute 'default nil :font "Menlo-12")
;; (set-face-attribute 'default nil :family "Fira Mono" :height 130)
;; (set-face-attribute 'default nil :height 140 :family "Fira Mono")
;; (set-frame-font "Fira Mono" nil t)

;;; Alternative font options
;;; (set-face-attribute 'default nil :font "Monaco-12")
;;; (set-face-attribute 'default nil :family "Source Code Pro" :height 130)
;;;(set-face-attribute 'default nil :font "Source Code Pro-13")
;;; (set-face-attribute 'default nil :family "Menlo" :height 130)
;; (set-face-attribute 'default nil :family "Anonymous Pro Minus" :height 148)
;; (set-face-attribute 'default nil :font "Anonymous Pro-14")
;;; (set-face-attribute 'default nil :family "Droid Sans Mono" :height 128)

;; if i ever decide to use highlight indent mode again
;;(set-face-background 'highlight-indent-face "#17191B")
