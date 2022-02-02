;;; org-cfg.el -- org config
;;; Commentary:
;; I'm gonna fill this out later
;;; Code:

(use-package graphviz-dot-mode :ensure t
  :config (setq graphviz-dot-indent-width 4))
(use-package org :ensure t
  :pin "org"
  :config
  (if (eq system-type 'windows-nt)
      (setq org-directory (substitute-in-file-name "$HOMEPATH/org")))
  (setq org-agenda-files (list org-directory))
  (setq org-default-notes-file (concat org-directory "/todo.org"))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((dot . t)))
  :mode ("\\.org\\'" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c b" . org-switchb)))
(provide 'org-cfg)
;;; org-cfg.el ends here
