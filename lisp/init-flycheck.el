;;; Flycheck

;; $ pip install flake8

;; IMPORTANT: If having issues installing on OSX,
;; brew install texinfo
;; brew link texinfo --force
;; more info: https://github.com/xiaohanyu/oh-my-emacs/issues/142

(el-get 'sync 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(setq python-check-command "flake8")
