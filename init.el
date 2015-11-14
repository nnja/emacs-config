;;
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;; (_)___|_| |_| |_|\__,_|\___|___/
;;

(setq user-full-name "Nina Zakharenko")
(setq user-mail-address "NZakharenko@gmail.com")


;; (add-to-list 'load-path "~/.emacs.d" t)
(add-to-list 'load-path "~/.emacs.d/lisp" t)
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d") t)

;; (defadvice display-warning
;;     (around no-warn-.emacs.d-in-load-path (type message &rest unused) activate)
;;   "Ignore the warning about the `.emacs.d' directory being in `load-path'."
;;   (unless (and (eq type 'initialization)
;;                (string-prefix-p "Your `load-path' seems to contain\nyour `.emacs.d' directory"
;;                                 message t))
;;     ad-do-it))

;;; package managers
(load "init-el-get")

(require 'package)
(package-initialize)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;; ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;;; auto install simple extensions
(require 'auto-install)

;;; color theme, fonts, misc stylistic things
(load "init-theme")

;;; custom functions
(load "init-defuns")

;;; initial setup, keybindings
(load "init-general")
(load "init-custom-key-set")

;;; mac os specificstuff
(load "init-osx")

;;; file finding
(load "init-file-finding")

;;; make friendly mini buffer
(load "init-ido")

;;; typing
;;(load "init-flyspell")
(load "init-editing")

;; TODO NZ flycheck isn't working, comment out for now
(load "init-flycheck")

;;; languages
(load "init-scheme")
(load "init-python")
(load "init-octave")

;;; add kenobi for jedi support
;; (load "kenobi")

;; (require 'package)
;; (package-initialize)


;;; git support
;; (load "init-git")

;;; misc
;;; (load "init-battery")

;; (package-initialize)


;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends (quote (company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf (company-dabbrev-code company-gtags company-etags company-keywords) company-oddmuse company-files company-dabbrev)))
 '(custom-safe-themes (quote ("1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "8d6fb24169d94df45422617a1dfabf15ca42a97d594d28b3584dc6db711e0e0b" "3c9d994e18db86ae397d077b6324bfdc445ecc7dc81bb9d528cd9bba08c1dac1" default)))
 '(display-buffer-function (quote popwin:display-buffer))
 '(elpy-modules (quote (elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
 '(flymake-python-pyflakes-extra-arguments (quote ("--max-line-length=120" "--ignore=E128")))
 '(git-gutter:added-sign "+")
 '(git-gutter:deleted-sign "-")
 '(git-gutter:hide-gutter t)
 '(git-gutter:lighter " GG")
 '(git-gutter:modified-sign "=")
 '(grep-find-ignored-directories (quote ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".tox" ".cache" "_site/static/css" "_site/static/js" "_site/static/js/vendor" "html/static/css" "node_modules" "html/static/js/vendor" "html/components/scss/.sass-cache" "migrations" "shipping/scripts" "auto-save-list" "el-get" "elpa" "themes")))
 '(grep-find-ignored-files (quote (".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "*.json" "*.min.js" "*.min.js.map")))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
