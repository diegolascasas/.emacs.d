
;;;;; Preparations ;;;;;

(add-to-list 'load-path "~/.emacs.d/mine")
(load "aux-functions.el")

;; Add repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Add use-package to manage other packages
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


;;;;; Builtin Configs ;;;;;

;; Window Configuration
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

;; Ido
(ido-mode 1)

;; setup electric-pair
(electric-pair-mode 1)
(setq electric-pair-pairs '((?\" . ?\")
                            (?\{ . ?\})
			    ))


;; Activate disabled keys
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Enable windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Store backups and autosave in .emacs.d
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

;; Fix linux keyboard issues with accents
(when (system-is-linux)
  (use-package iso-transl))
;;    :bind
;;     ("<dead-acute> c" . '(lambda () (interactive) (insert ?ç)))))
;;

;; use command for meta (instead of option) in macs
(when (system-is-mac)
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta))

;; (defun system-is-mac ()
;;   (interactive)
;;   (string-equal system-type "darwin"))

;; (defun system-is-linux ()
;;   (interactive)
;;   (string-equal system-type "gnu/linux"))


;; (defun toggle-fullscreen ()
;;   "Toggle full screen"
;;   (interactive)
;;   (set-frame-parameter
;;      nil 'fullscreen
;;      (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))


(when (system-is-linux)
  (require 'iso-transl)
  (global-set-key (kbd "<dead-acute> c")
 		(lambda () (interactive) (insert ?ç))))

;; ;; deal with accents (linux only?)
;; 

;; ;; cedilla!


;; (setq locale-coding-system 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)
;; (setenv "LC_CTYPE" "UTF-8")



;; Packages

;; Add repositories
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Add use-package to manage other packages
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))


(require 'use-package)

(use-package monokai-theme
	      :init
	      (load-theme 'monokai t)
	      :ensure t)

;; autolad octave mode for *.m-files
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))


(use-package magit
  :config (setq magit-last-seen-setup-instructions "1.4.0")
  :ensure t)

(use-package yasnippet
  :config (yas-global-mode 1)
  :ensure t)

;; Specific settings are not loaded when in the shell.
(when window-system 
  (load "ess-settings")
  (load "tex-settings")
  (load "dired-settings")
  (load "org-settings")
  (use-package monokai-theme
    :init (load-theme 'monokai t)
    :ensure t)
  (global-linum-mode 1)
  (text-scale-increase 1))

(when (system-is-mac)
  (set-default-font "Source Code Pro 13"))

;; custom.el is not in the git repo, so we need to create an empty file.... (TO-DO: make this better)
(setq custom-file "custom.el")
(load custom-file)

(load "keybindings.el")
