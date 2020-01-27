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

;;mandatory packages for use-package features

(use-package diminish :ensure t)
(use-package delight :ensure t)


;;;Nav stuff goes here

;;ace-jump should always be on
(use-package avy :ensure t
  :bind ("C-c C-SPC" . avy-goto-char))

;;winum is really freaking handy
(use-package winum :ensure t
  :config
  (setq winum-auto-setup-mode-line nil)
  (winum-mode)
  (winum-set-keymap-prefix (kbd "M-o")))

;;gotta have git
(use-package magit :ensure t)

;;;And flycheck is here
(use-package flycheck :ensure t
  :diminish
  :config (global-flycheck-mode))


;;;General defaults
;;fill column is 70 by default for some reason
(setq-default fill-column 80)

;;tabs and spaces blah blah blah
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(setq c-default-style
      '((java-mode . "java")
        (other . "k&r")))

;; ooh, ooh, recursive mini!

(setq enable-recursive-minibuffers t)

;;disable extra X stuff.
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;make dired play nice
(when (require 'dired-aux)
  (require 'dired-async))

;;last but not least
(provide 'global-cfg)

;;; global-cfg.el ends here
