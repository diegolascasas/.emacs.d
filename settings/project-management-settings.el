(use-package magit
  :config (setq magit-last-seen-setup-instructions "1.4.0")
  :ensure t)

(use-package yasnippet
  :config (yas-global-mode 1)
  :ensure t)

;; Manage projects
(use-package projectile
  :config (projectile-global-mode)
  :ensure t)
