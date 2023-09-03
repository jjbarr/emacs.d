;; -*- lexical-binding: t; -*-
;;; lsp-cfg.el -- langserver config
;;; Commentary:
;;...yeah.
;;; Code:

(use-package lsp-mode :straight t
  :init
  (setq lsp-prefer-flymake nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-signature-auto-activate t)
  (setq lsp-signature-doc-lines 3)
  (setq lsp-rust-server 'rust-analyzer)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-completion-provider :none)
  (setq lsp-keymap-prefix "C-c C-l")
  (defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(flex)))
  :hook ((java-mode . lsp)
         (rustic-mode . lsp)
         (lsp-completion-mode . my/lsp-mode-setup-completion))
  :commands lsp)

;; (use-package lsp-ui :straight t
;;   :hook ((lsp-mode . lsp-ui-mode))
;;   :init
;;   (setq lsp-ui-sideline-show-hover t
;;         lsp-ui-sideline-delay 2
;;         lsp-ui-sideline-show-code-actions nil
;;         lsp-ui-sideline-show-diagnostics nil
;;         lsp-ui-doc-enable nil)
;;   :bind (("M-d" . lsp-ui-doc-glance)))

(use-package dap-mode
  :straight t
  :bind (("C-c C-b" . dap-breakpoint-toggle))
  :config
  (dap-ui-mode)
  (dap-ui-controls-mode 1)
  (require 'dap-gdb-lldb)
  (dap-gdb-lldb-setup)
  (dap-register-debug-template "Rust::GDB Run configuration"
                               (list :type "gdb"
                                     :request "launch"
                                     :name "GDB::Run"
                                     :gdbpath "rust-gdb"
                                     :target nil
                                     :cwd nil)))

;;; lsp-cfg.el ends here
