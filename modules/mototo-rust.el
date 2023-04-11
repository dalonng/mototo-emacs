
;; install rust-mode
(mototo-install-package-if-missing 'rust-mode)

;; autolaod rust-mode
(autoload 'rust-mode "rust-mode" nil t)

;; add-to-list
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; config lsp
(add-hook 'rust-mode-hook 'lsp-mode)
(setq lsp-rust-server 'rust-analyzer)
(add-hook 'rust-mode-hook 'lsp-deferred)

;; format on save
(setq rust-format-on-save t)

;; prettifying symbols mode
(add-hook 'rust-mode-hook
	(lambda () (prettify-symbols-mode)))

(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))


(defun indent-buffer ()
  "Indent current buffer according to major mode."
  (interactive)
  (indent-region (point-min) (point-max)))

(setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
(setq racer-rust-src-path "/Users/julien/Code/rust/src") ;; Rust source code PATH

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(add-hook 'rust-mode-hook
	  '(lambda ()
	     (racer-mode)
	     (flycheck-mode)
	     (eldoc-mode)
	     (company-mode) ;; 使用 company 作补全前端
	     (local-set-key (kbd "M-.") #'racer-find-definition)
	     (local-set-key (kbd "TAB") #'company-indent-or-complete-common)))

(provide 'mototo-rust)
