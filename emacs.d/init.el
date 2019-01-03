; prevent Emacs's Easy Customization Interface from writing (custom-set-variables ... into your init file
(setq custom-file "~/.emacs.d/custom.el")

(setq init-local-file (expand-file-name "init_local.el" user-emacs-directory))
(when (file-exists-p init-local-file)
  (load init-local-file))

(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
(put 'scroll-left 'disabled nil)
