(require 'init-elpa)
(require-package 'atom-one-dark-theme)
(require-package 'golden-ratio)

(require-package 'session)
(require 'session)

(require 'golden-ratio)

(setq inhibit-startup-message t)
(menu-bar-mode t)
(tool-bar-mode 0)
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(set-face-attribute 'default nil :height 140)
(setq-default line-spacing 0.4)

(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t)

(load-theme 'atom-one-dark t)

(blink-cursor-mode 0)
(setq-default cursor-type 'bar)
(set-cursor-color "#cccccc")
(setq ring-bell-function 'ignore)

(golden-ratio-mode 1)

;; desktop
(desktop-save-mode 1)

(add-hook 'after-init-hook 'session-initialize)

(provide 'init-ui)
