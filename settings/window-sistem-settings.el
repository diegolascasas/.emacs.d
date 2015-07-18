(use-package monokai-theme
  :init (load-theme 'monokai t)
  :ensure t)

(global-linum-mode 1)
(text-scale-increase 1)

(when (system-is-mac)
  ;; use command for meta (instead of option) in macs
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
  ;; Source code pro is a monospaced font from google fonts
  (set-default-font "Source Code Pro 13"))
