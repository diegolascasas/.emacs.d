
;; Adapted with  minor changes from Felipe Salazar at http://www.emacswiki.org/emacs/EmacsSpeaksStatistics
(use-package ess-site
  :mode
  ("\\.[Rr]\\'" . R-mode)
  ("\\.[Rr]nw\\'" . tex-mode) ;; check if this is right
  :config
  (setq ess-use-auto-complete nil)
  (setq ess-use-ido t)
  (setq comint-scroll-to-bottom-on-input t)
  ;; (setq comint-scroll-to-bottom-on-output t)
  (setq comint-move-point-for-output t)
  (setq ess-eval-visibly-p nil)  ; Assincronous run
  (setq ess-swv-processor 'knitr) ;; setup literal programming
  (setq ess-swv-plug-into-AUCTeX-p t)


  ;; Use C-= for assignments and C-+ for piping

  (setq ess-smart-S-assign-key (kbd "C-="))
  (ess-toggle-S-assign nil)     ;; ...
  (ess-toggle-S-assign nil)     ;; Ugly!
  (ess-toggle-S-assign-key nil) ;;

  (define-key ess-mode-map (kbd "C-+") "%>%")

  (add-hook 'R-mode-hook
	    (lambda ()
        (font-lock-add-keywords nil
				'(("\\(%>%\\)" 1
				   font-lock-builtin-face t)))))

  (add-hook 'inferior-ess-mode-hook
          '(lambda()
             (local-set-key [C-up] 'comint-previous-input)
             (local-set-key [C-down] 'comint-next-input)))

  :ensure ess
  :defer t)



;; Customizations



;; ;; source: https://github.com/emacs-ess/ESS/issues/96
;; ;; Pretty arrows and magrittr pipes in R
;; (defvar pretty-alist
;;   (cl-pairlis '() '()))
;; (add-to-list 'pretty-alist '("%>%" . "⇛"))
;; (add-to-list 'pretty-alist '("<-" . "⇐"))
;; (defun pretty-things ()
;;   (mapc
;;    (lambda (x)
;;      (let ((word (car x))
;;            (char (cdr x)))
;;        (font-lock-add-keywords
;;         nil
;;         `((,(concat "\\(^\\|[^a-zA-Z0-9]\\)\\(" word "\\)[a-zA-Z]")
;; 	   (0 (progn
;;                  (decompose-region (match-beginning 2) (match-end 2))
;;                  nil)))))
;;        (font-lock-add-keywords
;;         nil
;;         `((,(concat "\\(^\\|[^a-zA-Z0-9]\\)\\(" word "\\)[^a-zA-Z]")
;; 	   (0 (progn
;;                  (compose-region (match-beginning 2) (match-end 2)
;; 				 ,char)
;;                  nil)))))))
;;    pretty-alist))
