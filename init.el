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
;hack around emacs bug
(if (eq system-type 'windows-nt)
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))
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
(require 'chrome-cfg)
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
    (spaceline color-theme-sanityinc-solarized js2-mode intero haskell-mode lsp-java dap-mode lsp-treemacs lsp-ui lsp-mode flycheck-rust cargo rust-mode treemacs-magit treemacs-projectile treemacs slime geiser paredit counsel-projectile projectile yasnippet-snippets counsel swiper flycheck magit winum avy delight diminish use-package)))
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
