;; -*- lexical-binding: t; -*-
;;; lisp-cfg.el -- config for lisp
;;; Commentary:
;;n/a


;;geiser
(use-package geiser :straight t
  :commands run-geiser)

;;slime stuff
(use-package slime :straight t
  :config
  (progn
    (setq inferior-lisp-program
          (if (eq system-type 'windows-nt)
              (expand-file-name "~/bin/ccl/wx86cl64.exe")
              "sbcl --dynamic-space-size 2048"))
    (setq slime-contribs '(slime-fancy)))
  :commands slime)

;;; lisp-cfg.el ends here
