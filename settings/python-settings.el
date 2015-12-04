


;; (use-package virtualenvwrapper
;;   :commands venv-workon
;;   :config
;;   (venv-initialize-interactive-shells)
;;   (venv-initialize-eshell)
;;   (setq venv-location "~/.virtualenvs"))


;; Hack to run postactivate and load its environment variables
(require 'cl-lib)
(defun venv-copy-envvars-postactivate ()
  (let ((newvars
	 (cl-remove-if-not
	  (lambda (x) (and
		       (string-match "=" x)
		       (not (member x process-environment))
		       (not (string-match "PATH=" x))))
	  (split-string
	   ;; run postactivate and copy its environment
	   (shell-command-to-string (concat "source" " "
					    (getenv "VIRTUAL_ENV")
					    venv-executables-dir "/"
					    "postactivate"
					    "; "
					    "env"
					    ))
	   "\n"))))
    (if newvars
	(dolist (envvar newvars)
	  (setq process-environment
		(cons envvar process-environment))))))


(use-package virtualenvwrapper
  :config
  (add-hook 'venv-postactivate-hook 'venv-copy-envvars-postactivate))

;; (use-package pyvenv
;;   :init
;;   (exec-path-from-shell-copy-envs
;;    (list
;;     "WORKON_HOME"
;;     "PROJECT_HOME"
;;     "VIRTUALENVWRAPPER_PROJECT_FILENAME"
;;     "VIRTUALENVWRAPPER_WORKON_CD"
;;     "VIRTUALENVWRAPPER_SCRIPT"
;;     "VIRTUALENVWRAPPER_HOOK_DIR"))
;;   :commands pyvenv-workon
;;   )
