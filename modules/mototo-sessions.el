;; save a list of open files in ~/.emacs.d/.emacs.desktop
(setq desktop-path (list user-emacs-directory)
      desktop-auto-save-timeout 600)
(desktop-save-mode 1)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)

(provide 'mototo-sessions)
