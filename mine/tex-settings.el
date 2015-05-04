; Auctex

;; (use-package auctex
;;   :defer t
;;   :init
;;   (load "auctex.el" nil t t)
;;   :config
;;   (progn
;;     (setq-default TeX-master "main")
;;     (setq TeX-PDF-mode t)
;;     (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;;     (setq reftex-plug-into-AUCTeX t)
;;     (setq TeX-parse-self t))
;;   :ensure t)

(load "auctex.el" nil t t)

;; (load "preview-latex.el" nil t t)

(setq-default ispell-program-name "aspell") ;; aspell is the spellchecker of choice


;; source: http://www.jesshamrick.com/2013/03/31/macs-and-emacs/
;; (if (system-is-mac)
;;  (progn
;;   (require 'tex-site)
;;   (require 'font-latex)
;;   (setq TeX-view-program-list
;;    (quote
;;     (("Skim"
;;       (concat "/Applications/Skim.app/"
;;         "Contents/SharedSupport/displayline"
;;         " %n %o %b")))))
;;   (setq TeX-view-program-selection
;;    (quote (((output-dvi style-pstricks) "dvips and gv")
;;       (output-dvi "xdvi")
;;       (output-pdf "Skim")
;;       (output-html "xdg-open")))))

;;   (if (system-is-linux)
;;    (setq TeX-view-program-selection
;;     (quote (((output-dvi style-pstricks) "dvips and gv")
;;        (output-dvi "xdvi")
;;        (output-pdf "evince"
;;        (output-html "xdg-open"))))))
