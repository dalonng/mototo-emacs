;;
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)

(load "color-theme-tangotango")

(setq mototo-org-themes (list
			 'tangotango))

(defun mototo-org-theme-set-default () ; Set the first row
  (interactive)
  (setq theme-current mototo-org-themes)
  (funcall (car theme-current)))

(defun mototo-org-describe-theme () ; Show the current theme
  (interactive)
  (message "%s" (car theme-current)))

; Set the next theme (fixed by Chris Webber - tanks)
(defun mototo-org-theme-cycle ()
  (interactive)
  (setq theme-current (cdr theme-current))
  (if (null theme-current)
      (setq theme-current mototot-org-themes))
  (funcall (car theme-current))
  (message "%S" (car theme-current)))

(setq theme-current mototo-org-themes)
(setq color-theme-is-global nil) ; Initialization
(mototo-org-theme-set-default)
(global-set-key [f4] 'mototo-org-theme-cycle)

(setq org-log-done 'time)

(provide 'mototo-org)
