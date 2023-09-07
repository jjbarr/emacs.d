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
  (setq org-default-notes-file
        (expand-file-name "misc-notes.org" org-directory))
  (setq org-refile-targets org-agenda-files)
  (setq org-src-fontify-natively t)
  (setq org-babel-python-command "python3")
  ;;syntax highlighting/indentation for rust
  (push '("rust" . rust-ts-mode) org-src-lang-modes)
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
  :bind (("C-c o l" . org-store-link)
         ("C-c o a" . org-agenda)
         ("C-c o c" . org-capture)
         ("C-c o b" . org-switchb)))

;; this makes html export for syntax highlighting work
(use-package htmlize :defer t)

;; use org-id. We are not the huns.
(use-package org-id
  :after (org)
  :preface
  (defun my/consult-org-id-find-refs ()
    "Finds references to id of current entry across all org files inside the
current project."
    (interactive)
    (let ((id (org-id-get))
          (pc (project-current)))
      (unless id
        (error "No id for entry at point"))
      (unless pc
        (error "Not inside of a project"))
      (consult-ripgrep (project-root pc) (concat "id:" id))))
  :bind (("C-c o x" . my/consult-org-id-find-refs))
  :config
  (setq org-id-link-to-org-use-id t))

;;; OX configuration
(use-package ox-latex
  :after (org)
  :config
  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (setq org-latex-src-block-backend 'minted)
  (setq
   org-latex-pdf-process
   '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
     "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
     "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
  )

;; org-noter is just very useful.
(use-package org-noter :straight t
  :after (org)
  :bind (("C-c o n" . org-noter)))


;;; org-cfg.el ends here
