;; Open externally from dired
;; Source (edited) : http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html
(defun open-in-external-app ()
  "Open the current file or dired marked files in external app.
Works in Microsoft Windows, Mac OS X, Linux."
  (interactive)
  (let (doIt
	(myFileList (cond
		     ((string-equal major-mode "dired-mode") (dired-get-marked-files))
		     (t (list (buffer-file-name))))))
    (setq doIt (if (<= (length myFileList) 5) t (y-or-n-p "Open more than 5 files?")))

    (when doIt
      (cond 
       ((string-equal system-type "windows-nt")
	(mapc (lambda (fPath)
		(w32-shell-execute "open" (replace-regexp-in-string "/" "\\" fPath t t)) ) myFileList))
       ((string-equal system-type "darwin")
        (mapc (lambda (fPath)
		(let ((process-connection-type nil)) (start-process "" nil "open" fPath)) )  myFileList))       
       ((string-equal system-type "gnu/linux")
        (mapc (lambda (fPath)
		(let ((process-connection-type nil)) (start-process "" nil "xdg-open" fPath))) myFileList)) 
       ))))

;; Bind this to C-c o
(add-hook 'dired-mode-hook
	  (lambda ()
	     (local-set-key (kbd "M-o") 'open-in-external-app)))

;; Uncompress .zip files with Z in dired.
;; More on: http://stackoverflow.com/questions/1431351/how-do-i-uncompress-unzip-within-emacs
(eval-after-load "dired-aux"
   '(add-to-list 'dired-compress-file-suffixes 
                 '("\\.zip\\'" ".zip" "unzip")))


;;; Use imagemagick to add image manipulation capabilities
(use-package eimp
  :commands (eimp-mode)
  :init (add-hook 'image-mode-hook 'eimp-mode)
  :ensure t)

;;; Set dired ls switches
(setq dired-listing-switches "-hAl --no-group --time-style long-iso")
