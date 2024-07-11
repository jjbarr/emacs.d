;; -*- lexical-binding: t; -*-
;;; lang-cfg.el -- config for programming languages (not included in emacs)
;;; Commentary:
;;n/a

;;; lisps

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

;;; rust
(use-package rust-mode :straight t
  :mode (("\\.rs\\'" . rust-mode))
  :bind (:map rust-mode-map
              ())
  :init
  (setq rust-mode-treesitter-derive t))

;;; haskell
(use-package haskell-mode :straight t
  :mode "\\.hs\\'")

;;; js
;; I still haven't found a js mode I like more
(use-package js2-mode :straight t
  :mode "\\.js\\'"
  :interpreter "node")

;;; latex
(use-package tex :straight (auctex)
  :defer t
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-PDF-mode t)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (setq-default TeX-master nil))

;;; bqn

(use-package bqn-mode :straight t
  :defer t
  :mode (("\\.bqn\\'" . bqn-mode))
  :bind (:map bqn-mode-map
              ("C-x C-e" . bqn-comint-eval-dwim)
              ("C-c C-e" . bqn-comint-eval-buffer)
              ("C-c h" . bqn-help-symbol-info-at-point)))
