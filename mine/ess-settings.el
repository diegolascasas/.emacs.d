
;; Adapted with  minor changes from Felipe Salazar at http://www.emacswiki.org/emacs/EmacsSpeaksStatistics
(use-package ess-site
  :config
  (progn
    (setq ess-use-auto-complete nil)
    (setq ess-use-ido t)
    (setq comint-scroll-to-bottom-on-input t)
    (setq comint-scroll-to-bottom-on-output t)
    (setq comint-move-point-for-output t)
    (setq ess-eval-visibly-p nil)) ; Assincronous run 
  :ensure ess)


;; Customizations

(add-hook 'inferior-ess-mode-hook
          '(lambda()
             (local-set-key [C-up] 'comint-previous-input)
             (local-set-key [C-down] 'comint-next-input)))


(setq ess-S-assign-key [?\C-=])
(ess-toggle-S-assign-key t)


;; source: https://github.com/emacs-ess/ESS/issues/96
;; Pretty arrows and magrittr pipes in R
(defvar pretty-alist
  (cl-pairlis '() '()))
(add-to-list 'pretty-alist '("%>%" . "⇛"))
(add-to-list 'pretty-alist '("<-" . "⇐"))
(defun pretty-things ()
  (mapc
   (lambda (x)
     (let ((word (car x))
           (char (cdr x)))
       (font-lock-add-keywords
        nil
        `((,(concat "\\(^\\|[^a-zA-Z0-9]\\)\\(" word "\\)[a-zA-Z]")
            (0 (progn
                 (decompose-region (match-beginning 2) (match-end 2))
                 nil)))))
       (font-lock-add-keywords
        nil
        `((,(concat "\\(^\\|[^a-zA-Z0-9]\\)\\(" word "\\)[^a-zA-Z]")
            (0 (progn
                 (compose-region (match-beginning 2) (match-end 2)
                  ,char)
                 nil)))))))
   pretty-alist))

(add-hook 'R-mode-hook
      (lambda ()
        (font-lock-add-keywords nil
                 '(("\\(%>%\\)" 1
                    font-lock-builtin-face t)))))

(define-key ess-mode-map [(super .)] "%>%")

;; Reset indentation configurations so it works well with %>%
(add-to-list 'ess-style-alist
             '(my-style
               (ess-indent-level . 4)
               (ess-first-continued-statement-offset . 2) ;; <- Important
               (ess-continued-statement-offset . 0) ;; <- Important
               (ess-brace-offset . -4)
               (ess-expression-offset . 4)
               (ess-else-offset . 0)
               (ess-close-brace-offset . 0)
               (ess-brace-imaginary-offset . 0)
               (ess-continued-brace-offset . 0)
               (ess-arg-function-offset . 4)
	       (ess-arg-function-offset-new-line . '(4))
               ))

(setq ess-default-style 'my-style)
