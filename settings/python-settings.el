
(use-package virtualenvwrapper
  :commands venv-workon
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell)
  (setq venv-location "~/.virtualenvs"))
