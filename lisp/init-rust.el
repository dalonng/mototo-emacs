(require 'init-elpa)
(require-package 'company)
(require-package 'rust-mode)
(require-package 'cargo)
(require-package 'flycheck)
(require-package 'flycheck-rust)
(require-package 'racer)
(require-package 'rust-playground)
(require-package 'rustfmt)

(require 'company)
(require 'racer)
(require 'rust-mode)
(require 'electric)
(require 'eldoc)
(require 'flycheck)
(require 'flycheck-rust)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook  #'company-mode)
(add-hook 'rust-mode-hook  #'racer-mode)
(add-hook 'rust-mode-hook  'cargo-minor-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(add-hook 'rust-mode-hook
          '(lambda ()
	     ;; Enable racer
	     (racer-activate)

	     ;; Hook in racer with eldoc to provide documentation
	     (racer-turn-on-eldoc)

	     ;; Use flycheck-rust in rust-mode
	     (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

	     ;; Use company-racer in rust mode
	     ;;(set (make-local-variable 'company-backends) '(company-racer))

	     ;; Key binding to jump to method definition
	     (local-set-key (kbd "M-.") #'racer-find-definition)

	     ;; Key binding to auto complete and indent
	     (local-set-key (kbd "TAB") #'racer-complete-or-indent)
	     
	     (setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))
             (local-set-key (kbd "TAB") #'company-indent-or-complete-common)
	     (electric-pair-mode 1)))

(add-hook 'rust-mode-hook #'rustfmt-enable-on-save)

(provide 'init-rust)
