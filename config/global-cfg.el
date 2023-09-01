;;; global-cfg -- the stuff that needs to be on at all times.

;;; Commentary:
;It's just config.

;;; Code:
;; First and foremost, I should never, ever be using DOS line endings.
;; I know, I know, Git handles this automatically, but I have non-git files.
;; Embarassing but true.
(prefer-coding-system 'utf-8-unix)

;; tell us about yourself, why don't you?

(defvar user-mail-addresses '("jbarrett186@gmail.com"
                              "jjbarrett@umass.edu"))

(setq user-full-name "Joshua Barrett")

;;bindings for global stuff.

;;Global keybinds for emacs features.
(bind-key "\C-w" 'backward-kill-word)
(bind-key "\C-c\C-k" 'kill-region)
(bind-key "\C-o" 'occur)
(bind-key (kbd "C-c C-/") 'comment-or-uncomment-region)

;;;SUPER IMPORTANT ALWAYS-USE PACKAGES

;;mandatory packages for use-package features

(use-package diminish :straight t)
(use-package delight :straight t)

;; Everyone should always install editorconfig, including me

(use-package editorconfig :straight t
  :diminish
  :config (editorconfig-mode 1))


;; When you need it you need it
(use-package multiple-cursors :straight t
  :bind (("C-c m" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))


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

;; iedit is sorta navigational...

(use-package iedit :straight t
  :bind ("C-;" . iedit-mode))

;;; Generally really useful modes

;;gotta have git
(use-package magit :straight t)

;;;And flycheck
(use-package flycheck :straight t
  :diminish
  :config (global-flycheck-mode))


;;;General defaults
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

;; ooh, ooh, recursive mini!

(setq enable-recursive-minibuffers t)

;; vertico-endorsed. Seems to make sense
(defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
(advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

(if (not (version< emacs-version "28"))
    (setq read-extended-command-predicate
          #'command-completion-default-include-p))

;;disable extra X stuff.
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; tramp-term is super useful if you ever need to work with remote servers.
(use-package tramp-term :straight t)

;;; global-cfg.el ends here
