;; -*- lexical-binding: t; -*-
;;; org-cfg.el -- org config
;;; Commentary:
;; I'm gonna fill this out later
;;; Code:

(use-package graphviz-dot-mode :straight t
  :config (setq graphviz-dot-indent-width 4))
(use-package org :straight t
  :config
  
  (setq org-directory
        (if (eq system-type 'windows-nt)
            (substitute-in-file-name "$HOMEPATH/org")
          "~/org/"))
  (setq org-agenda-files (list org-directory))
  (setq org-default-notes-file (concat org-directory "/todo.org"))
  (require 'ox-latex)
  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (setq org-latex-listings 'minted)
  (setq
   org-latex-pdf-process
   '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
     "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
     "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
  (setq org-src-fontify-natively t)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((dot . t)
     (C . t)
     (js . t)
     (lisp . t)
     (python . t)
     (scheme . t)
     (awk . t)))
  :mode ("\\.org\\'" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c b" . org-switchb)))

;;; org-cfg.el ends here
