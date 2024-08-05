;; -*- lexical-binding: t; -*-
;;; global-cfg -- the stuff that needs to be on at all times.

;;; Commentary:
;
;;; Code:

;;;General defaults
(use-package emacs
  :demand t
  :bind (("C-w" . backward-kill-word)
         ("C-c C-k" . kill-region)
         ("C-o" . occur)
         ("C-c C-/" . comment-or-uncomment-region))
  :init
  ;;fill column is 70 by default for some reason
  (setq-default fill-column 80)

  ;;tabs, spaces, and indentation;
  ;;Fuck hard tabs
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (setq-default c-basic-offset tab-width)
  (defvaralias 'cperl-indent-level 'tab-width)
  (setq-default c-default-style
                '((java-mode . "java")
                  (other . "k&r")))
  
  ;;Better to have it than not
  (setq enable-recursive-minibuffers t)

  ;;disable extra X stuff.
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

  ;; I hate dos line endings
  (prefer-coding-system 'utf-8-unix))

;; eldoc mode should have a line limit. A short one.
(use-package eldoc
  :bind (("C-c d b" . eldoc-doc-buffer))
  :init
  (setq eldoc-echo-area-use-multiline-p 3)
  (setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
  (global-eldoc-mode +1))

;; projects configuration

(use-package project
  :config
  ;;stolen from project-x (which is GPLed so. uh. Guess that makes
  ;; legality here somewhat dubious?)
  (defvar project-local-identifier '(".project" ".projectile" ".jj")
    "A list of filenames use to identify non-VCed projects")
  (cl-defmethod project-root ((project (head local)))
    "Return root directory of current PROJECT."
    (cdr project))
  (defun project-local-try-local (dir)
    "determine if DIR is a non-VC project"
    (if-let ((root (seq-some (lambda (id)
                               (locate-dominating-file dir id))
                             project-local-identifier)))
        (cons 'local root)))
  (setq project-find-functions
        (list #'project-try-vc #'project-local-try-local)))

;; I like flyspell

(use-package flyspell
  :hook (text-mode . flyspell-mode))

;; lots of just... small but really helpful packages

;; I would like to be able to read epubs...
(use-package nov :straight t
  :mode ("\\.epub\\'" . nov-mode)
  :hook ((nov-mode . olivetti-mode)))

;; this is kind of necessary unfortunately
(use-package exec-path-from-shell :straight t
  :config
  (when (daemonp)
    (exec-path-from-shell-initialize)))

;;mandatory packages for use-package features

(use-package diminish :straight t)
(use-package delight :straight t)

;; editorconfig for people who use that
(use-package editorconfig :straight t
  :diminish
  :config (editorconfig-mode 1))

;; better help is always a good thing
(use-package helpful :straight t
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)
         ("C-h x" . helpful-command)))

;;expand region just seems helpful.
(use-package expand-region :straight t
  :bind ("C-=" . er/expand-region))

;; When you need it you need it
(use-package multiple-cursors :straight t
  :bind (("C-c m" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

;;ctrlf is just... better isearch
(use-package ctrlf :straight t
  :demand t
  :config
  (ctrlf-mode +1))

;;visual-regexp is aggressively convenient
(use-package visual-regexp :straight t
  :bind (("C-c r" . vr/replace)
         ("C-c q" . vr/query-replace)
         ("C-c C-;" . vr/mc-mark)))

;;ace-jump should always be on
(use-package avy :straight t
  :bind (("C-:" . avy-goto-char)
         ("M-g g" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)))

;;winum is really freaking handy
(use-package winum :straight t
  :config
  (setq winum-auto-setup-mode-line nil)
  (winum-mode)
  (winum-set-keymap-prefix (kbd "M-o")))

;; dumb jump should be an xref fallback in case ggt/tags/whatever isn't present.

(use-package dumb-jump :straight t
  :init
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate 95))

;; wgrep is nice
(use-package wgrep :straight t)

;; vundo is convenient
(use-package vundo :straight t
  :bind ("C-x u" . vundo))

;; rg. It's. It's rg.
(use-package rg :straight t
  :after (project)
  :demand t
  :bind ("C-x p r" . rg-project))

;;gotta have git
(use-package magit :straight t)

;;unfortunately really really need ssh-agency
(use-package ssh-agency :straight t)

;; tramp-term is super useful if you ever need to work with remote servers.
(use-package tramp-term :straight t
  :commands tramp-term)

;; I need to be able to work with markdown and this doesn't merit its own cfg.

(use-package markdown-mode :straight t
  :mode ("\\.md\\'" . gfm-mode)
  :init (setq markdown-command '("pandoc" "--from=gfm" "--to=html5")))
;;; global-cfg.el ends here
