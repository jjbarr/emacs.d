;;; init.el --- My init script
;;; Commentary:
;; it's a fucking mess.
;;; Code:

;;get the load path up...
(let ((elisp-dir (concat user-emacs-directory "elisp/")))
  (push elisp-dir load-path)
  (let ((default-directory elisp-dir))
    (normal-top-level-add-subdirs-to-load-path)))
(push (concat user-emacs-directory "config/") load-path)

;;and now we're in business

;;packaging bootstrap
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;;set up use-package
(condition-case nil
    (require 'use-package)
  (file-error
   (package-refresh-contents)
   (package-install 'use-package)
   (require 'use-package)))

;;reqs
(require 'cl-lib)
;;config stuff
(require 'global-cfg)
(require 'ivy-cfg)
(require 'docs-cfg)
(require 'font-cfg)
(require 'yas-cfg)
(require 'projectile-cfg)
(require 'lisp-cfg)
(require 'treemacs-cfg)
(require 'rust-cfg)
(require 'lsp-cfg)
(require 'java-cfg)
(require 'haskell-cfg)
(require 'js-cfg)
(require 'org-cfg)
(require 'tex-cfg)
(require 'chrome-cfg)
(require 'promela-cfg)
(require 'py-cfg)
(cl-case system-type
  ((ms-dos windows-nt) nil)
  (otherwise (require 'site-unix)))
(require 'gnus-cfg)

;;odds and ends that I can't be assed to give their own file

(defun fix-asm-mode ()
  "Substantially unfuck `asm-mode`."
  (local-unset-key (vector asm-comment-char))
  ;; asm-mode sets it locally to nil, to "stay closer to the old TAB behaviour".
  (setq tab-always-indent (default-value 'tab-always-indent)))

(add-hook 'asm-mode-hook #'fix-asm-mode)

;;custom go away!

(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;;magit is annoying sometimes
(setq magit-last-seen-setup-instructions "1.4.0")

(provide 'init)
;;; init.el ends here
