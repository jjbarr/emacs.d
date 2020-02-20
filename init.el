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

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;;set up use-package
(condition-case nil
    (require 'use-package)
  (file-error
   (package-refresh-contents)
   (package-install 'use-package)
   (require 'use-package)))

;;config stuff
(require 'global-cfg)
(require 'ivy-cfg)
(require 'docs-cfg)
(require 'font-cfg)
(require 'yas-cfg)
(require 'projectile-cfg)
(require 'lisp-cfg)
(require 'treemacs-cfg)
(require 'rust-cfg)
(require 'lsp-cfg)
(require 'java-cfg)
(require 'haskell-cfg)
(require 'js-cfg)
(require 'org-cfg)
(require 'tex-cfg)
(require 'chrome-cfg)
(case system-type
  ((ms-dos windows-nt) nil)
  (otherwise (require 'site-unix)))
(require 'gnus-cfg)

;;automatically added stuff down here
(setq magit-last-seen-setup-instructions "1.4.0")

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
 '(js-indent-level 4)
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.3 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(package-selected-packages
   (quote
    (smart-tabs-mode yasnippet-snippets geiser paredit diminish treemacs treemacs-magit treemacs-projectile winum with-editor ace-window avy cargo color-theme-sanityinc-solarized company counsel counsel-projectile flycheck flycheck-rust haskell-mode ivy js2-mode lsp-java lsp-mode lsp-ui projectile rust-mode slime use-package doom-modeline keychain-environment dap-mode org auctex delight)))
 '(safe-local-variable-values
   (quote
    ((c-file-offsets
      (arglist-cont-nonempty . 4))
     (indent-tabs-mode nil))))
 '(send-mail-function (quote smtpmail-send-it)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here

(put 'downcase-region 'disabled nil)
