;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defconst *is-a-mac* (eq system-type 'darwin))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-keybinds)
(require 'init-ui)
(require 'init-editing)
(require 'init-exec-path)
(require 'init-company-mode)
(require 'init-miscellaneous)
(require 'init-navigation)

(require 'init-projectile)

(require 'init-rust)
(require 'init-swift)
(require 'init-go)
(require 'init-org)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-mode cargo smex rainbow-delimiters racer projectile minimap ido-ubiquitous golden-ratio flycheck-rust exec-path-from-shell company atom-one-dark-theme)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
