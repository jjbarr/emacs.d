;;; lisp-cfg.el -- config for lisp
;;; Commentary:
;;n/a
;;; 
(defun insert-lambda-character ()
  "Puts a lambda character where your cursor is."
  (interactive)
  (insert "λ"))

(global-set-key "\C-l" 'insert-lambda-character) ;always handy for lisp.

;;paredit stuff
(use-package paredit :ensure t
  :diminish
  :hook ((emacs-lisp-mode . enable-paredit-mode)
         (eval-expression-minibuffer-setup . enable-paredit-mode)
         (ielm-mode . enable-paredit-mode)
         (lisp-mode . enable-paredit-mode)
         (lisp-interaction-mode . enable-paredit-mode)
         (scheme-mode . enable-paredit-mode)))

;;geiser
(use-package geiser :ensure t
  :commands run-geiser)

;;slime stuff
(use-package slime :ensure t
  :config
  (progn
    (setq inferior-lisp-program
          (if (eq system-type 'windows-nt)
              (expand-file-name "~/bin/ccl/wx86cl64.exe")
              "sbcl --dynamic-space-size 2048"))
    (setq slime-contribs '(slime-fancy)))
  :commands slime)


(provide 'lisp-cfg)
;;; lisp-cfg.el ends here
