;;; init-battery.el

;;; http://stackoverflow.com/questions/5562974/emacs-is-it-running-on-laptop-or-on-desktop
(require 'battery)
(when (and battery-status-function
           (not (string-match-p "N/A"
                                (battery-format "%B"
                                                (funcall battery-status-function)))))
  (display-battery-mode 1))
