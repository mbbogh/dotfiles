;; at this point in time it contains the complete old configuration
;; move over into a org file
;; the file will later only contain machine specific entries

(setq init-local-file (expand-file-name "init_local.el" user-emacs-directory))
(when (file-exists-p init-local-file)
  (load init-local-file))

(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
