(setq neo-theme
      (if (display-graphic-p)
	  'icons
	'arrow))
(global-set-key [f8] 'neotree-toggle)

(defun neo-buffer--insert-fold-symbol (name &optional file-name)
  "Custom voerriding function for the fold symbol. `NAME` decides what fold icon to use, while `FILE-NAME` decides"
  (or (and (equal name 'open) (insert (all-the-icons-icon-for-dir file-name "down")))
      (and (equal name 'close) (insert (all-the-icons-icon-for-dir file-name "right")))
      (and (equal name 'leaf) (insert (format "\t\t\t%s\t" (all-the-icons-icon-for-file file-name))))))

(defun neo-buffer--insert-dir-entry (node depth expanded)
  (let ((node-short-name (neo-path--file-short-name node)))
    (insert-char ?\s (* (- depth 1) 2)) ; indent
    (when (memq 'char neo-vc-integration)
      (insert-char ?\s 2))
    (neo-buffer--insert-fold-symbol
     (if expanded 'open 'close) node)
    (insert-button (concat node-short-name "/")
                   'follow-link t
                   'face neo-dir-link-face
                   'neo-full-path node
                   'keymap neotree-dir-button-keymap)
    (neo-buffer--node-list-set nil node)
    (neo-buffer--newline-and-begin)))

(defun neo-buffer--insert-file-entry (node depth)
  (let ((node-short-name (neo-path--file-short-name node))
        (vc (when neo-vc-integration (neo-vc-for-node node))))
    (insert-char ?\s (* (- depth 1) 2)) ; indent
    (when (memq 'char neo-vc-integration)
      (insert-char (car vc))
      (insert-char ?\s))
    (neo-buffer--insert-fold-symbol 'leaf node-short-name)
    (insert-button node-short-name
                   'follow-link t
                   'face (if (memq 'face neo-vc-integration)
                             (cdr vc)
                           neo-file-link-face)
                   'neo-full-path node
                   'keymap neotree-file-button-keymap)
    (neo-buffer--node-list-set nil node)
    (neo-buffer--newline-and-begin)))

(provide 'mototo-neotree)
