(use-package magit
  :config (setq magit-last-seen-setup-instructions "1.4.0"))

(use-package yasnippet
  :config
  (yas-global-mode 1)
  ;; preserve tab-completion in ansi-term
  (add-hook 'term-mode-hook (lambda()
        (setq yas-dont-activate t)))
  )
;; Manage projects
(use-package projectile
  :config (projectile-global-mode))
