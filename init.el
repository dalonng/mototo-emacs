
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar current-user
      (getenv
       (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(defvar mototo-dir (file-name-directory load-file-name)
  "The root dir of the Emacs Mototo distribution.")
(defvar mototo-core-dir (expand-file-name "core" mototo-dir)
  "The home of Mototo's core functionality.")

(defvar mototo-modules-dir (expand-file-name  "modules" mototo-dir)
  "This directory houses all of the built-in mototo modules.")

(defvar mototo-personal-dir (expand-file-name "personal" mototo-dir)
  "This directory is for your personal configuration.

Users of Emacs Prelude are encouraged to keep their personal configuration
changes in this directory.  All Emacs Lisp files there are loaded automatically
by Prelude.")

(add-to-list 'load-path mototo-core-dir)
(add-to-list 'load-path mototo-modules-dir)

(message "Loading Mototo's core...")

;; the core stuff
(require 'mototo-packages)
(require 'mototo-ui)

;; config change made through the customize UI will be store here
(setq custom-file (expand-file-name "custom.el" mototo-personal-dir))

;;; init.el ends here
