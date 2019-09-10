;;; lsp-cfg.el -- langserver config
;;; Commentary:
;;...yeah.
;;; Code:

(use-package lsp-mode :ensure t
  :init
  (progn
    (setq lsp-prefer-flymake nil)
    (setq lsp-enable-snippet nil))
  :config (require 'lsp-clients)
  :hook ((java-mode . lsp)
         (rust-mode . lsp)) ;;rustic deals with LSP on its own.
  :commands lsp)

(use-package lsp-ui :ensure t
  :hook ((lsp-mode . lsp-ui-mode))
  :init
  (setq lsp-ui-flycheck-live-reporting nil
        lsp-ui-sideline-enable nil
        lsp-ui-sideline-show-diagnostics nil
        lsp-ui-doc-use-webkit nil)
  )
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
