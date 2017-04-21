
;;; init.el file begins from here.
;;; Baisc config of Emacs

(package-initialize)

(setq inhibit-startup-screen t)     ;; Hide welcome message
(setq make-backup-files nil)        ;; Unable making backup file
(setq-default indent-tabs-mode nil) ;; Using spaces instead of tabs when indenting.
(menu-bar-mode 0)                   ;; Unable menu bar
(setq js-indent-level 2)            ;; Set Javascript intent to 2 (default 4)

;;; Specify loading path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;;; Require specified **.el files which we need everytime
(require 'init-elpa)
(require 'neotree)

;;; Use C-h as Backspace
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)

;; Install auto-complete with ELPA, and config it here
(ac-config-default)
(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")

;;; Auto load some **.el files which we maybe not need everytime
;; autoload markdown-mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'". markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'". markdown-mode))

;; autoload scss-mode
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (wakatime-mode ein egg auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

 ;; show me a raw num
(global-linum-mode t)
