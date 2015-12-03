;; aspell is more portable
(when (executable-find "aspell")
  (setq-default ispell-program-name "aspell"))

;;Auctex

(use-package auctex
  :mode ("\\.tex\\'" . latex-mode)
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :init
  (progn
    (add-hook 'LaTeX-mode-hook #'turn-on-reftex)
    (add-hook 'LaTeX-mode-hook #'flyspell-mode)
    (setq TeX-PDF-mode t
	  TeX-parse-self t
	  TeX-autosave t)))

(use-package preview
  :commands LaTeX-preview-setup
  :init
  (progn
    (setq-default preview-scale 1.4
		  preview-scale-function '(lambda () (* (/ 10.0 (preview-document-pt)) preview-scale))))
  :ensure auctex)

(use-package reftex
  :commands turn-on-reftex
  :init
  (progn
    (setq reftex-plug-into-AUCTeX t))
  :ensure auctex)

(use-package bibtex
  :mode ("\\.bib" . bibtex-mode)
  :init
  (progn
    (setq bibtex-align-at-equal-sign t)))


;; (load "auctex.el" nil t t)
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master 'dwim)
;; (add-hook 'latex-mode-hook 'turn-on-reftex)
;; (add-hook 'Latex-mode-hook 'turn-on-reftex)
;; (setq reftex-plug-into-auctex t)
