;;; chrome-cfg.el -- configure shinies
;;; Commentary:
;; none
;;; Code:
(require 'use-package)
;; fill column rule: this is what puts that line up there
;; fci is dead, long live internal dfci
(global-display-fill-column-indicator-mode 1)

;;Doom's solarized is a good one.
(use-package doom-themes :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-solarized-dark t)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

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
