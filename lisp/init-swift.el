(require-package 'swift-mode)
(require-package 'flycheck-swift)

(eval-after-load 'flycheck '(flycheck-swift-setup))

(provide 'init-swift)
