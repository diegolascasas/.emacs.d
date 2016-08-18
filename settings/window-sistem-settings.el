;; (use-package monokai-theme
;;   :init (load-theme 'monokai))

;; (use-package cyberpunk-theme
;;   :init (load-theme 'cyberpunk t))

(use-package color-theme-sanityinc-tomorrow
  :init (load-theme 'sanityinc-tomorrow-night))

;; (global-linum-mode 1)
(text-scale-increase 1)

(when (system-is-mac)

  (setenv "LANG" "en_US") ;; apple sets mine to en_BR, which is not
                          ;; supported by many applications

  ;; Fix annoying problems with the exec-path in Emacs.app
  (use-package exec-path-from-shell
    :config (exec-path-from-shell-initialize))

  ;; use command for meta (instead of option) in macs
  ;; (setq mac-option-modifier 'super)
  ;; (setq mac-command-modifier 'meta)
  ;; Source code pro is a monospaced font from google fonts
  (set-default-font "Source Code Pro 13")
)
