;;; lsp-cfg.el -- langserver config
;;; Commentary:
;;...yeah.
;;; Code:

(use-package lsp-mode :ensure t
  :init
  (progn
    (setq lsp-prefer-flymake nil)
    (setq lsp-enable-snippet nil))
  :hook ((rust-mode . lsp)
         (java-mode . lsp))
  :commands lsp)

(use-package lsp-ui :ensure t
  :hook ((lsp-mode . lsp-ui-mode)))
(use-package helm-lsp :ensure t
  :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :ensure t
  :commands lsp-treemacs-errors-list)

(use-package dap-mode :ensure t
  :config
  (progn (dap-mode t)
         (dap-ui-mode t)))
(provide 'lsp-cfg)
;;; lsp-cfg.el ends here
