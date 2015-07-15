(global-set-key (kbd "C-s-f") 'toggle-fullscreen)
; For some weird reason C-s-f only means right cmd key!
;; (global-set-key (kbd "<C-s-268632070>") 'toggle-fullscreen)

(global-set-key (kbd "C-c r") 'recompile)

(global-set-key (kbd "C-c g") 'magit-status)


(global-set-key (kbd "M-j")
            (lambda ()
                  (interactive)
                  (join-line -1)))
