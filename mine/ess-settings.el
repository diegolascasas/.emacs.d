
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
