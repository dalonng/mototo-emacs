(require-package 'go-mode)

(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'go-mode-hook (lambda ()
			  (add-hook 'before-save-hook 'gofmt-before-save)
			  (setq tab-width 4)
			  (setq indent-tabs-mode 1)))

(provide 'init-go)
