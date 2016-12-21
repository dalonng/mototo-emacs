;;; Code:
(require 'cl)
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/") t) ;; China source

;; set package-user-dir to be relative to Mototo install path
(setq package-user-dir (expand-file-name "elpa" mototo-dir))
(package-initialize)

(defvar mototo-packages
  '(helm
    material-theme
    session))

(defun mototo-packages-installed-p ()
  "Check if all packages in `mototo-packages` are installed."
  (every #'package-installed-p mototo-packages))

(defun mototo-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package mototo-packages)
    (add-to-list 'mototo-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun mototo-require-packages (packages)
  "Ensure PACKAGE are installed. Missing package are installed atutomatically."
  (mapc #'mototo-require-package packages))

(defun mototo-install-packages ()
  "Install all package listed in `mototo-packages`."
  (unless (mototo-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs Mototo is noew refresing its package database...")
    (package-refresh-contents)
    (message "%s" "done.")
    ;; install the missing packages
    (mototo-require-packages mototo-packages)))

;; run package installation
(mototo-install-packages)

(provide 'mototo-packages)
