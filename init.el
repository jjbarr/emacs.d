;;; init.el --- My init script
;;; Commentary:
;; it's a fucking mess.
;;; Code:

;;get the load path up...
(push (expand-file-name "config/" user-emacs-directory) load-path)

;;and now we're in business


;;packaging bootstrap
;; we've using straight now because I am TIRED of use-package sucking.
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
                         user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; and bootstrap use-package as well
(straight-use-package 'use-package)

;;reqs
(require 'cl-lib)
;;config stuff
;;EMACS CONFIGURATION
(load "global-cfg")
(load "ivy-cfg")
(load "treemacs-cfg")
(load "yas-cfg")
(load "org-cfg")
(load "projectile-cfg")
(load "company-cfg")
(load "chrome-cfg")
(load "font-cfg")
(cl-case system-type
  ((ms-dos windows-nt) nil)
  (otherwise (load "site-unix")))

;; PER-LANGUAGE CONFIGURATION
(load "lisp-cfg")
(load "rust-cfg")
(load "lsp-cfg")
(load "java-cfg")
(load "haskell-cfg")
(load "js-cfg")
(load "tex-cfg")
(load "py-cfg")

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
