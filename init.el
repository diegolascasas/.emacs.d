;; Disable that emacs default uglyness
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Preparations ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;; - I manage the external packages with 'use-package', which leaves
;;    everything tidy and donwlads the missing packagesfrom the repos.
;; - All my setups are in ./settings/
;; - The defuns are in ./settings/auxiliary-functions.el
;; - Customized (local) settings are in ./custom.el.
(add-to-list 'load-path (expand-file-name "settings" user-emacs-directory))
(load "auxiliary-functions.el")
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Add repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Add use package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Load settings ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;; I normally use a standalone GUI whenever possible and only
;;  run emacs on a shell when acessing remotely, so I keep most
;;  packages out of the shell version
(load "misc-settings")
(load "keybindings.el")
(when window-system
  (load "window-sistem-settings")

  (load "ess-settings")
  (load "tex-settings")
  (load "dired-settings")
  (load "org-settings")
  (load "project-management-settings.el"))

;; I don't do much lisp programing, but allways write my notes in orgmode.
;;  So the scratch buffer serves me better at org-mode.
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message "\
# This buffer is for notes you don't want to save. You can use
# org-mode markup (and all Org's goodness) to organize the notes.
# If you want to create a file, visit that file with C-x C-f,
# then enter the text in that file's own buffer.

")
