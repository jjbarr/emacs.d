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
              ("C-c h s" . bqn-help-symbol-info-at-point)))
(use-package bqn-keymap-mode :straight bqn-mode
  :after bqn-mode
  :bind (:map bqn-mode-map
              ("C-c h k" . bqn-keymap-mode-show-keyboard)))
(use-package bqn-glyph-mode :straight bqn-mode
  :after bqn-mode
  :bind (:map bqn-mode-map
              ("C-c h g" . bqn-glyph-mode-show-glyphs)))
;; uiua
(use-package uiua-mode
  :straight (uiua-mode
             :type git
             :flavor melpa
             :host github
             :repo "crmsnbleyd/uiua-mode")
  :defer t)

(use-package uiua-ts-mode :straight (uiua-ts-mode
                                     :type git
                                     :flavor melpa
                                     :host github
                                     :repo "crmsnbleyd/uiua-ts-mode")
  :after (treesit eglot uiua-mode)
  :defer t
  :preface
  (defface my/uiua-default '((t (:family "Uiua386")))
    "Face for the programming language Uiua")
  (defun my/uiua-set-font ()
    (buffer-face-set 'my/uiua-default)
    (buffer-face-mode +1))
  :mode "\\.ua\\'"
  :hook ((uiua-ts-mode . my/uiua-set-font)
         (uiua-ts-mode . eglot-ensure)))

