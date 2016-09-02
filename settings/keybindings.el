;; Activate disabled keys
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(global-set-key (kbd "C-s-f") 'toggle-fullscreen)
; For some weird reason C-s-f only means right cmd key!
(global-set-key (kbd "<C-s-268632070>") 'toggle-fullscreen)

(global-set-key (kbd "C-c r") 'recompile)

(global-set-key (kbd "C-c g") 'magit-status)


(global-set-key (kbd "M-j")
            (lambda ()
                  (interactive)
                  (join-line -1)))

(global-set-key (kbd "C-c v") 'switch-text-view)

(global-set-key (kbd "C-c f") 'insert-file-name)

(global-set-key (kbd "C-c l") 'linum-mode)

(global-set-key (kbd "C-x C-b") 'ibuffer)
