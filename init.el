
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

(ido-mode 1)


(electric-pair-mode 1)
(setq electric-pair-pairs '(
			    (?\" . ?\")
                            (?\{ . ?\})
			    ))

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(load-theme 'monokai t)


;;orgmode
;; (require 'org-install)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (python . t)
   ))

(setq org-src-fontify-natively t)

(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "R")))  ; don't ask for ditaa
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)



(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; enable syntax highlight
(setq org-src-fontify-natively t)

 ;; autolad octave mode for *.m-files
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))


(setq load-path (cons "/usr/share/emacs/site-lisp/ess" load-path))
(require 'ess-site)


(load "auctex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master "main")
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'Latex-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-auctex t)


(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; cedilla!
(global-set-key (kbd "<dead-acute> c")
		'(lambda () (interactive) (insert ?ç)))


;; God Mode

(global-set-key (kbd "<escape>") 'god-local-mode)
;; (define-key god-local-mode-map (kbd ".") 'repeat)

(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)


(global-set-key (kbd "C-x C-1") 'delete-other-windows)
(global-set-key (kbd "C-x C-2") 'split-window-below)
(global-set-key (kbd "C-x C-3") 'split-window-right)
(global-set-key (kbd "C-x C-0") 'delete-window)

;; deal with accents
(require 'iso-transl)

(setq custom-file "custom.el")
(load custom-file)
