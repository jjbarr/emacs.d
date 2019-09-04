;;; chrome-cfg.el -- configure shinies
;;; Commentary:
;; none
;;; Code:

;; fill column rule
(use-package fill-column-indicator ; fci isn't insured - not on melpa
  ;;global fci mode--makes FCI DWIM.
  :if window-system
  :config
  (progn
    (define-globalized-minor-mode global-fci-mode fci-mode
      (lambda ()
        (if (and buffer-file-name
                 (display-graphic-p))
            (fci-mode 1))))
    (global-fci-mode 1)))

;;gotta make sure my theme is here.
(use-package color-theme-sanityinc-solarized :ensure t
  :if window-system)

;;Shiiiny
(use-package spaceline :ensure t
  :if window-system
  :config
  (progn
    (spaceline-emacs-theme)
    (spaceline-helm-mode)))

(provide 'chrome-cfg)
;;; chrome-cfg.el ends here
