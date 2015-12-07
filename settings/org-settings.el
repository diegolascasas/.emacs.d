;; I'll use a symlink to point to the folder (synced through a Cloud service)
(setq org-directory "~/.emacs.d/org/")

;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)


;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cc" 'org-capture)
;; (global-set-key "\C-cb" 'org-iswitchb)
(define-key global-map "\C-cc" 'org-capture)

;;;;;; Organizer ;;;;;;

(defun organizer ()
  (interactive)
  (find-file (concat org-directory "organizer.org"))
  (rename-buffer "*Organizer*"))

(global-set-key "\C-co" 'organizer)

(setq org-default-notes-file (concat org-directory "organizer.org"))

;;;;;; BABEL ;;;;;;

(setq org-src-fontify-natively t)

;; Disable confirmation for R and Python
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (python . t)
   ))

(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "R")))  ; don't ask for ditaa
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)




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


;;;;;; REFERENCE MANAGEMENT ;;;;;;
;; Simple reference management in Org-mode.
;; Adapted From: https://tincman.wordpress.com/2011/01/04/research-paper-management-with-emacs-org-mode-and-reftex/
;; Changes from original:
;;; - I see no reason to use org-reftex-search since I can use
;;;   emacs' text search to find the notes. This simplifies workflow.

;; To enable ref. management I must define some variables in the head of the file:
;; 1) put "# \bibliography{/path/to/file.bib}" with the path to the selected bib.
;; 2) If needed, link to it the bibliography file and the papers directory:
;;   #+LINK: papers /path/to/papers-dir/%s
;;   #+LINK: bib    /path/to/file.bib::%s
;; 3) Make sure all refrences in the papers directory comply to the format.
;;    - For now it is <bibkey>.pdf

;; TODO: I'm defining the bib twice, I'd like to do it only once
;; TODO: bibkey for file paths is quite flexible, but is it the best option?
;; TODO: Set the entry level dynamically instead of just prepending a "*"
;; TODO: Determine the bib abrev from \bibliography{} instead of using a default
;; TODO: Enabling global-auto-revert-mode in a mode hook seems buggy

(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name) (file-exists-p (buffer-file-name))
       (progn
	 ;;enable auto-revert-mode to update reftex
	 ;; when bibtex file changes on disk
	 (global-auto-revert-mode t)
	 (reftex-parse-all)
	 ;add a custom reftex cite format to insert links
	 (reftex-set-cite-format (concat "* %t\n"
					 ":PROPERTIES:\n"
					 ":BIB: [[bib:%l]]\n"
					 ":FILE: [[papers:%l.pdf]]\n"
					 ":END:\n"))))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)


;; Default values for the abbrevs
(setq org-link-abbrev-alist
      '(("bib" . "~/Documents/papers/refs.bib::%s")
	("papers" . "~/Documents/papers/%s")))
