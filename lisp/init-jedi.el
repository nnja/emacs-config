;;; init-jedi.el

(el-get 'sync '(deferred
                 jedi))

(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)
;;; (add-hook 'inferior-python-mode-hook 'jedi:setup)

(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional
