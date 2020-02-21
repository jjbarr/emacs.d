;;; init.el --- My init script
;;; Commentary:
;; it's a fucking mess.
;;; Code:

;;get the load path up...
(push "~/.emacs.d/elisp" load-path)
(push "~/.emacs.d/config/" load-path)

;;and now we're in business

;;packaging bootstrap
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
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
(cl-case system-type
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
 '(ansi-color-names-vector
   ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(fci-rule-color "#405A61")
 '(inhibit-startup-screen t)
 '(jdee-db-active-breakpoint-face-colors (cons "#073642" "#268bd2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#073642" "#859900"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#073642" "#56697A"))
 '(js-indent-level 4)
 '(objed-cursor-color "#dc322f")
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.3 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(package-selected-packages
   (quote
    (doom-themes smart-tabs-mode yasnippet-snippets geiser paredit diminish treemacs treemacs-magit treemacs-projectile winum with-editor ace-window avy cargo color-theme-sanityinc-solarized company counsel counsel-projectile flycheck flycheck-rust haskell-mode ivy js2-mode lsp-java lsp-mode lsp-ui projectile rust-mode slime use-package doom-modeline keychain-environment dap-mode org auctex delight)))
 '(pdf-view-midnight-colors (cons "#839496" "#002b36"))
 '(rustic-ansi-faces
   ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(safe-local-variable-values
   (quote
    ((c-file-offsets
      (arglist-cont-nonempty . 4))
     (indent-tabs-mode nil))))
 '(send-mail-function (quote smtpmail-send-it))
 '(vc-annotate-background "#002b36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#859900")
    (cons 40 "#959300")
    (cons 60 "#a58e00")
    (cons 80 "#b58900")
    (cons 100 "#bc7407")
    (cons 120 "#c35f0e")
    (cons 140 "#cb4b16")
    (cons 160 "#cd4439")
    (cons 180 "#d03d5d")
    (cons 200 "#d33682")
    (cons 220 "#d63466")
    (cons 240 "#d9334a")
    (cons 260 "#dc322f")
    (cons 280 "#ba3f41")
    (cons 300 "#994d54")
    (cons 320 "#775b67")
    (cons 340 "#405A61")
    (cons 360 "#405A61")))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here

(put 'downcase-region 'disabled nil)
