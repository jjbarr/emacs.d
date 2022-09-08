;;; company-cfg --- sigh... autocomplete
;;; Commentary:
;;; Code:
(use-package company
  :ensure t
  :diminish global-company-mode
  :hook (after-init-hook . global-company-mode))
(provide 'company-cfg)
;;; company-cfg.el ends here
