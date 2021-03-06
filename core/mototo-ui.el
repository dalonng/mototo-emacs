;;
;;(load-theme 'material t)
(load-theme 'zenburn t)
(powerline-default-theme)

;; Show line number
(linum-mode 1)

;; Disable back up file
(setq make-back-files nil)

;; disable `#...#` file
(setq auto-save-default nil)

(show-paren-mode 1)

;; Cursor style
(blink-cursor-mode 1)
(setq-default cursor-type 'bar)

(tool-bar-mode -1)

(provide 'mototo-ui)
