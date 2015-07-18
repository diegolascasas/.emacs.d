;; I'll use a symlink to point to the folder (synced through a Cloud service)
(setq org-directory "~/.emacs.d/org/")
(setq org-default-notes-file "organizer.org")

;; Babel configs
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (python . t)
   ))

(setq org-src-fontify-natively t)

(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "R")))  ; don't ask for ditaa
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)


;; enable syntax highlight
(setq org-src-fontify-natively t)


;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)


;; Use deft to manage notes.
(use-package deft
  :config
  (setq deft-text-mode 'org-mode)
  (setq deft-extension "org")
  (setq deft-directory "~/.emacs.d/org/")
  (setq deft-use-filename-as-title t)
  :bind ("C-c d" . deft)
  :ensure t)


(defun organizer ()
  (interactive)
  (find-file (concat org-directory "organizer.org"))
  (rename-buffer "*Organizer*"))
(global-set-key "\C-co" 'organizer)


;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cc" 'org-capture)
;; (global-set-key "\C-cb" 'org-iswitchb)


;; (setq org-todo-keywords '((sequence "TODO" "NEXT" "STARTED" "|" "DONE")))

;; (setq org-todo-keyword-faces
;;            '(("NEXT" . org-warning) ("STARTED" . "yellow")))


;; Track time
(setq org-clock-idle-time nil)
(setq org-log-done 'time)
(defadvice org-clock-in (after wicked activate)
  "Mark STARTED when clocked in"
  (save-excursion
    (catch 'exit
      (org-back-to-heading t)
      (if (looking-at org-outline-regexp) (goto-char (1- (match-end 0))))
      (if (looking-at (concat " +" org-todo-regexp "\\( +\\|[ \t]*$\\)"))
	  (org-todo "STARTED")))))
