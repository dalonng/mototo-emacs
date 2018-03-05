(require-package 'projectile)
(require-package 'helm-projectile)
(helm-projectile-on)

(global-set-key [?\C-c ?\C-p] 'helm-projectile)

(setq projectile-keymap-prefix (kbd "C-c C-p"))

(provide 'init-projectile)
