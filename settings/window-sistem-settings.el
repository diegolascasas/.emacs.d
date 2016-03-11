(use-package cyberpunk-theme
  :init (load-theme 'cyberpunk t))

(global-linum-mode 1)
(text-scale-increase 1)

(when (system-is-mac)

  ;; I'm calling emacs.app from a shell now, so this might not be needed
  ;; Using this method: http://www.emacswiki.org/emacs/EmacsForMacOS#toc20
  ;; ;; Fix annoying problems with the exec-path in Emacs.app
  (use-package exec-path-from-shell
    :config (exec-path-from-shell-initialize))

  ;; use command for meta (instead of option) in macs
  ;; (setq mac-option-modifier 'super)
  ;; (setq mac-command-modifier 'meta)
  ;; Source code pro is a monospaced font from google fonts
  (set-default-font "Source Code Pro 13")
)
