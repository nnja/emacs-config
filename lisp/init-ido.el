;; ** IDO EVERYTHING!!!1!1!one!1
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(global-set-key
 "\M-x"
 (lambda ()
   (interactive)
   (call-interactively
    (intern
     (ido-completing-read
      "M-x "
      (all-completions "" obarray 'commandp))))))

;; Make Ido ignore freaking .DS_Store files
(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Let's try these out
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point t
      ido-max-prospects 10)
