;;; lsp-cfg.el -- langserver config
;;; Commentary:
;;...yeah.
;;; Code:

(use-package lsp-mode :ensure t
  :init
  (progn
    (setq lsp-prefer-flymake nil)
    (setq lsp-enable-snippet nil)
    (setq lsp-signature-auto-activate t)
    (setq lsp-signature-doc-lines 3)
    (setq lsp-rust-server 'rust-analyzer)
    (setq lsp-headerline-breadcrumb-enable nil))
  :hook ((java-mode . lsp)
         (rust-mode . lsp))
  :commands lsp)

(use-package lsp-ui :ensure t
  :hook ((lsp-mode . lsp-ui-mode))
  :init
  (setq lsp-ui-flycheck-live-reporting nil
        lsp-ui-sideline-enable nil
        lsp-ui-sideline-show-diagnostics nil
        lsp-ui-doc-enable nil)
  :bind (("H-d" . lsp-ui-doc-glance)))


(provide 'lsp-cfg)
;;; lsp-cfg.el ends here
