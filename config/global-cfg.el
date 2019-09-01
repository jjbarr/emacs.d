;;; global-cfg -- the stuff that needs to be on at all times.

;;; Commentary:
;It's just config.

;;; Code:


(bind-key "\C-w" 'backward-kill-word)
(bind-key "\C-c\C-k" 'kill-region)
(bind-key "\C-o" 'occur)

;;mandatory packages for use-package features

(use-package diminish :ensure t)
(use-package delight :ensure t)

;;I like helm

(use-package helm :ensure t
  :diminish helm-mode
  :config
  (progn
    (require 'helm-config)
    (helm-mode))
  :bind (("M-x" . helm-M-x)))

;;ace-jump should always be on
(use-package avy :ensure t
  :bind ("C-c C-SPC" . avy-goto-char))

;;winum is really freaking handy
(use-package winum :ensure t
  :config (winum-mode))

;;gotta have git
(use-package magit :ensure t)

;;global-enable flycheck
(use-package flycheck :ensure t
  :config (global-flycheck-mode))

;;fill column and fci
(setq-default fill-column 80)

(use-package fill-column-indicator ; fci isn't insured - not on melpa
  ;;global fci mode--makes FCI DWIM.
  :config
  (progn
    (define-globalized-minor-mode global-fci-mode fci-mode
      (lambda ()
        (if (and buffer-file-name
                 (display-graphic-p))
            (fci-mode 1))))
    (global-fci-mode 1)))

;;tabs and spaces blah blah blah
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;;disable extra X stuff.
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;gotta make sure my theme is here.
(use-package color-theme-sanityinc-solarized :ensure t)

;;make dired play nice
(when (require 'dired-aux)
  (require 'dired-async))

;;last but not least
(provide 'global-cfg)

;;; global-cfg.el ends here
