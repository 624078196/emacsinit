;;; init-elpa.el file

(require 'package)

;; Add org repository (they said we do not need it because we never use it)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

;; Also use Melpa for most packages
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; Define require-package function (Copied from https://github.com/purcell/emacs.d )
;; According it's READ.md, this function will judge one package was installed or not
;; If not, it will find it and require it from ELPA (It will not work for custom package)
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
	(package-install package)
      (progn
	(package-refresh-contents)
	(require-package package min-version t)))))

;; Must force to initialize package firstly, because Emacs will load init-elpa.el after init.el
;; However most packages are loaded at init.el, if we do not initialize ELPA firstly
;; Those packages can not be loaded correctly
(package-initialize)

(provide 'init-elpa)
