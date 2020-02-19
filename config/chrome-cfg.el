;;; chrome-cfg.el -- configure shinies
;;; Commentary:
;; none
;;; Code:

;; fill column rule: this is what puts that line up there
(use-package fill-column-indicator ; fci isn't ensured - not on melpa
  ;;global fci mode--makes FCI DWIM.
  :config
  (progn
    (define-globalized-minor-mode global-fci-mode fci-mode
      (lambda () (fci-mode 1)))
    (global-fci-mode 1)))

;;If you don't like the gray-on-blue colorscheme, remove this line.
(use-package color-theme-sanityinc-solarized :ensure t)

;;Shiiiny
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  (setq doom-modeline-height 15)
  (setq doom-modeline-bar-width 2)
  ;;hack to ensure we only show icons in graphics mode
  (add-hook 'focus-in-hook
            (lambda () (setq doom-modeline-icon (display-graphic-p)))))

(provide 'chrome-cfg)
;;; chrome-cfg.el ends here

