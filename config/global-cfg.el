;; -*- lexical-binding: t; -*-
;;; global-cfg -- the stuff that needs to be on at all times.

;;; Commentary:
;
;;; Code:

;;;General defaults
(use-package emacs
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

;; lots of just... small but really helpful packages

;;mandatory packages for use-package features

(use-package diminish :straight t)
(use-package delight :straight t)

;; Everyone should always install editorconfig, including me
(use-package editorconfig :straight t
  :diminish
  :config (editorconfig-mode 1))

;; better help is always a good thing
(use-package helpful :straight t
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)
         ("C-h x" . helpful-command)))

;; better startup profiling would be nice
(use-package esup :straight t
  :commands esup)

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

;; rg. It's. It's rg.
(use-package rg :straight t
  :init
  ;;autoload hacks
  (defun rg-autoload-keymap ()
    (interactive)
    (if (not (require 'rg nil t))
        (user-error (format "Cannot load rg"))
      (let ((key-vec (this-command-keys-vector)))
        (global-set-key key-vec rg-global-map)
        (setq unread-command-events
              (mapcar (lambda (ev) (cons t ev))
                      (listify-key-sequence key-vec))))))
  
  (global-set-key (kbd "C-c s") #'rg-autoload-keymap))

;; Okay, smartparens, let's see if we can make this work this time.
;; This is basically all stolen from Radian

(use-package smartparens :straight t
  :demand t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode +1)
  (show-smartparens-global-mode +1)
  (sp-use-smartparens-bindings)
  (add-to-list 'sp-ignore-modes-list #'org-mode)
  (add-to-list 'sp-ignore-modes-list #'org-agenda-mode)
  (bind-key [remap kill-line] #'sp-kill-hybrid-sexp smartparens-mode-map
            (apply #'derived-mode-p sp-lisp-modes))
  (dolist (key '(:unmatched-expression :no-matching-tag))
    (setf (cdr (assq key sp-message-alist)) nil))
  (when (fboundp 'minibuffer-mode)
    (sp-local-pair #'minibuffer-mode "`" nil :actions nil)
    (sp-local-pair #'minibuffer-mode "'" nil :actions nil)))

;;gotta have git
(use-package magit :straight t)

;; flycheck is too useful to not use
(use-package flycheck :straight t
  :diminish
  :config (global-flycheck-mode))

;; tramp-term is super useful if you ever need to work with remote servers.
(use-package tramp-term :straight t
  :commands tramp-term)

;;; global-cfg.el ends here
