(org-babel-do-load-languages
 'org-babel-load-languages '(
			     (sh . t)
			     (python . t)
			     (R . t)
			     (ruby . t)
			     (ditaa . t)
			     (dot . t)
			     (octave . t)
			     (sqlite . t)
			     (perl . t)
			     (C . t)))

;; The following lines are always needed. Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(define-key global-map "\C-\\" 'remember)

;;(setq org-default-notes-file "~/.emacs.d/notes.org")
(setq remember-data-file "~/.emacs.d/notes.org")
(setq org-remember-templates '(("TODO" ?t "* TODO %?\n %x\n %a" "~/doc/org/home.org" "Tasks")
			       ("IDEA" ?i "* IDEA %?\n %i\n %a" "~/doc/org/home.org" "Idea")))


(setq org-agenda-files '("~/.gtd/inbox.org"
			 "~/.gtd/gtd.org"
			 "~/.gtd/tickler.org"))

(setq org-refile-targets '(("~/.gtd/gtd.org" :maxlevel . 3)
                           ("~/.gtd/someday.org" :level . 1)
                           ("~/.gtd/tickler.org" :maxlevel . 2)))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
			       (file+handline "~/.gtd/inbox.org" "Tasks")
			       "* TODO %i%?")
			      ("T" "Tickler" entry
			       (file+handline "~/.gtd/tickler.org" "Tickler")
			       "* %i%? \n %U")))

(setq org-todo-keywords '((sequence "TODO(t!)"
				    "NEXT(n)"
				    "WAITTING(w)"
				    "SOMEDAY(s)"
				    "|"
				    "DONE(d@/!)"
				    "ABORT(a@/!)")))



(provide 'init-org)
