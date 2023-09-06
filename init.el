;; -*- lexical-binding: t; -*-
;;; init.el --- My init script
;;; Commentary:
;; it's a fucking mess.
;;; Code:

(if (version< emacs-version "19.1")
    (error "Emacs Version Must be 19.1 for this configuration to work"))

;;custom go away!

(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;; temporarily disable the GC for speed reasons (stolen from Doom)
(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold 16777216 ; 16mb
          gc-cons-percentage 0.1)))

;;and now we're in business

;;packaging bootstrap
;; we've using straight now because I am TIRED of use-package sucking.
(defvar straight-check-for-modifications '(check-on-save find-when-checking))
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
(require 'use-package)
;;config stuff
;; put config files on the load path
(push (expand-file-name "config/" user-emacs-directory) load-path)
;;EMACS CONFIGURATION
(load "global-cfg")
(load "treesit-cfg")
(load "diag-cfg")
(load "vertico-cfg")
(load "org-cfg")
(load "treemacs-cfg")
(load "corfu-cfg")
(load "chrome-cfg")
(if (not (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))
    (load "site-unix"))

;; PER-LANGUAGE CONFIGURATION
(load "lisp-cfg")
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


;;magit is annoying sometimes
(setq magit-last-seen-setup-instructions "1.4.0")
;;; init.el ends here
