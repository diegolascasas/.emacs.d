;; I'll use a symlink to point to the folder (synced through a Cloud service)
(setq org-directory "~/.emacs.d/org/")

(use-package org
  :config
  ;; Make windmove work in org-mode:
  (add-hook 'org-shiftup-final-hook 'windmove-up)
  (add-hook 'org-shiftleft-final-hook 'windmove-left)
  (add-hook 'org-shiftdown-final-hook 'windmove-down)
  (add-hook 'org-shiftright-final-hook 'windmove-right)

  ;; Babel Syntax highlighting
  (setq org-src-fontify-natively t)

  ;; Load R and python for babel
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t)
     (python . t)
     ))

  ;; Disable babel confirmation for R and python
  (setq org-confirm-babel-evaluate '(lambda (lang body)
				      (null
					    (member
					     lang '("R" "python")))
					   )
	)
  )

;; ;;;;;; BABEL ;;;;;;

;; (setq org-src-fontify-natively t)

;; ;; Disable confirmation for R and Python
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((R . t)
;;    (python . t)
;;    ))

;; (defun my-org-confirm-babel-evaluate (lang body)
;;   (not (string= lang "R")))  ; don't ask for ditaa
;; (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)


;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cc" 'org-capture)
;; (global-set-key "\C-cb" 'org-iswitchb)
;; (define-key global-map "\C-cc" 'org-capture)

;;;;;; Organizer ;;;;;;

(defun organizer ()
  (interactive)
  (find-file (concat org-directory "organizer.org"))
  (rename-buffer "*Organizer*"))

(global-set-key "\C-co" 'organizer)

(setq org-default-notes-file (concat org-directory "organizer.org"))



;;;;;; DEFT ;;;;;;
;; Use deft to manage notes.
(use-package deft
  :config
  (setq deft-text-mode 'org-mode)
  (setq deft-extension "org")
  (setq deft-directory "~/.emacs.d/org/")
  (setq deft-use-filename-as-title t)
  :bind ("C-c d" . deft)
  :ensure t)
