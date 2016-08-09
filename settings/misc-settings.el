
;;
;; (set-language-environment "English")
(setq locale-coding-system 'utf-8)
(set-language-environment "UTF-8")
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)

(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")

;;;; Setup electric-pair
(electric-pair-mode 1)
(setq electric-pair-pairs '((?\" . ?\")
                            (?\{ . ?\})
			    ))

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)
;; (use-package rainbow-delimiters
;;   :config
;;     (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;;   )


;;;; Autoloads
;; autolad octave mode for *.m-files
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

;;
(use-package markdown-mode
  :mode "\\.md\\'")

;;;; SQL -- truncate lines when using the shell


(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t))
	  '(sql-set-product-feature
	   'mysql :prompt-regexp "^\\(?:mysql\\|mariadb\\).*> "))


;;;; Backup and Autosave files
;; Store in .emacs.d
(make-directory "~/.emacs.d/autosaves/" t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))

(make-directory "~/.emacs.d/backups/" t)

(setq  backup-directory-alist '((".*" . "~/.emacs.d/backups/"))
       version-control t
       delete-old-versions t
       kept-new-versions 4
       kept-old-versions 1)

;; Disable for sudo and su
(setq backup-enable-predicate
      (lambda (name)
	(and (normal-backup-enable-predicate name)
	     (not
	      (let ((method (file-remote-p name 'method)))
		(when (stringp method)
		  (member method '("su" "sudo"))))))))

;; Set re-builder to work with strings
(require 're-builder)
(setq reb-re-syntax 'string)

;; Enable windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Fix linux keyboard issues with accents
(when (system-is-linux)
  (require 'iso-transl)
  (global-set-key (kbd "<dead-acute> c")
 		(lambda () (interactive) (insert ?ç))))



;;;; Activate ido with flx matching
(use-package flx-ido
  :config
  (ido-mode 1)
  ;; (ido-everywhere 1)
  (flx-ido-mode 1)
  (setq ido-enable-flex-matching 1
	ido-use-faces nil))

;;;; Activate guid-keys
;; (From Magnar and Sacha Chua talk: https://www.youtube.com/watch?v=87tjF_mYvpE&t=14m48s)
;; Pops up a guide with possible keybindings given an unfinished sequence
(use-package guide-key
  :config
  (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v"
				       "C-x 8" "C-c p" "C-h"
				       (bibtex-mode "C-c C-e"))
	guide-key/popup-window-position 'bottom
	guide-key/recursive-key-sequence-flag t)
  (guide-key-mode 1))


;;; Activate multiple cursors
;; This is a fantastic package!
(use-package multiple-cursors
  :bind
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-S-c C-<" . mc/mark-all-like-this)
  ("C-S-c C-S-c" . mc/edit-lines))

;; Activate expand-region
;; Bind it close to mc
(use-package expand-region
  :bind
  ("C-?" . er/expand-region))

(use-package processing-mode
  :mode "\\.pde$"
  :config
  (setq processing-location "/usr/bin/processing-java")
  (setq processing-application-dir "/Applications/Processing.app")
  (setq processing-sketchbook-dir "~/Documents/Processing")
  :defer t)


(use-package tramp
  :config
  (add-to-list 'tramp-default-proxies-alist
	       '(nil "\\`root\\'" "/ssh:%h:"))
  (add-to-list 'tramp-default-proxies-alist
	       '((regexp-quote (system-name)) nil nil)))

(use-package ace-jump-mode
  :bind ("C-." . ace-jump-mode))

(use-package auto-complete
  :config
  (global-auto-complete-mode t))

;;;; Remove trailing whitespaces when saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; ;;; SCALA
;; (use-package ensime
;;   :commands ensime ensime-mode)
;; (add-hook 'scala-mode-hook 'ensime-mode)
;; (use-package scala-mode2)

(toggle-window-split)

(global-eldoc-mode -1) ;; headaches when making long computations in
		       ;; python-mode
