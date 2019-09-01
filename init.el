;;; init.el --- My init script
;;; Commentary:
;; it's a fucking mess.
;;; Code:

;;get the load path up...
(push "~/.emacs.d/elisp" load-path)
(push "~/.emacs.d/elisp/emacs-async" load-path)
(push "~/.emacs.d/config/" load-path)

;;and now we're in business

;;packaging stuff
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;;set up use-package
(condition-case nil
    (require 'use-package)
  (file-error
   (package-refresh-contents)
   (package-install 'use-package)
   (require 'use-package)))

;;config stuff

(require 'global-cfg)
(require 'projectile-cfg)
(require 'lisp-cfg)
(require 'treemacs-cfg)
(require 'rust-cfg)
(require 'lsp-cfg)
(require 'java-cfg)
(require 'js-cfg)
(require 'org-cfg)


;;automatically added stuff down here
(setq magit-last-seen-setup-instructions "1.4.0")

(setq paradox-github-token "ad8e2299d5ce84338f7bbe9bdc03b8a4fa8d9518")

;;emacs fucks with this. I give up on keeping it <80.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(inhibit-startup-screen t)
 '(js2-basic-offset 4)
 '(package-selected-packages
   (quote
    (spaceline auto-org-md flycheck winum dap-mode helm-lsp lsp-java lsp-mode lsp-treemacs lsp-ui treemacs treemacs-magit treemacs-projectile use-package color-theme-sanityinc-solarized helm magit geiser slime rust-mode org lua-mode paredit paradox js2-mode coffee-mode)))
 '(paradox-automatically-star t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here

