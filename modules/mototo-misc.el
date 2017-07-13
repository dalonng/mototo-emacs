(smex-initialize)

 ;; binds some keys
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(electric-pair-mode t)

(ac-config-default)

(provide 'mototo-misc)
