; ELPA updates failing - fix
; via https://irreal.org/blog/?p=8243 --- didn't work the 1st time I tested it, do I need to update gnutls?
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

; Configure package.el to include MELPA.
; moved this over from config.org to be able to use org from repo, not build in
(require 'package)
(add-to-list 'package-archives '("org"   . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq load-prefer-newer t)
(package-initialize)




; prevent Emacs's Easy Customization Interface from writing (custom-set-variables ... into your init file
;(setq custom-file "~/.emacs.d/custom.el")
;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

; TODO move this to org file
;(setq init-local-file (expand-file-name "init_local.el" user-emacs-directory))
;(when (file-exists-p init-local-file)
;  (load init-local-file))

(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
(put 'scroll-left 'disabled nil)
