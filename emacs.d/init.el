; TODO still not sure what caused my problem and why with this changes it works (different)
; Configure package.el to include MELPA.
; moved this over from config.org to be able to use org from repo, not build in
(require 'package)
;(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("org"   . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq load-prefer-newer t)

(package-initialize)                ;; Initialize & Install Package
(unless package-archive-contents    ;; Refresh the packages descriptions
  (package-refresh-contents))
;(setq package-load-list '(all))     ;; List of packages to load
;(unless (package-installed-p 'org)  ;; Make sure the Org package is
;  (package-install 'org))           ;; installed, install it if not

; prevent Emacs's Easy Customization Interface from writing (custom-set-variables ... into your init file
;(setq custom-file "~/.emacs.d/custom.el")
;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

; TODO move this to org file
;(setq init-local-file (expand-file-name "init_local.el" user-emacs-directory))
;(when (file-exists-p init-local-file)
;  (load init-local-file))

(require 'org)
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

; set defaults I otherwise would be asked at 1st use
(put 'scroll-left 'disabled nil)
(put 'narrow-to-region 'disabled nil)
