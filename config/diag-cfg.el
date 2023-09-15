;;; configuration for flycheck and eglot, which collectively
;;; provide diagnostics and general nice-to-haves

(use-package eglot :straight t
  :preface
  (defun my/eglot-eldoc ()
    (setq eldoc-documentation-strategy
          'eldoc-documentation-compose-eagerly))
  ;; turn out autoformat
  (defun my/format-on-save ()
    (add-hook 'before-save-hook #'eglot-format-buffer nil t))
  ;; turn off inlays by default, they're too noisy
  (defun my/eglot-disable-inlay ()
    (eglot-inlay-hints-mode 0))
  :hook ((eglot-managed-mode . my/format-on-save)
         (eglot-managed-mode . my/eglot-eldoc)
         (eglot-managed-mode . my/eglot-disable-inlay)
         (c-ts-mode . eglot-ensure)
         (c++-ts-mode . eglot-ensure)
         (rust-ts-mode . eglot-ensure)
         (python-ts-mode . eglot-ensure))
  :bind (:map eglot-mode-map
         ("C-c e b" . eglot-format-buffer)
         ("C-c e r" . eglot-rename)
         ("C-c e c" . eglot-code-actions)
         ("C-c e n" . eglot-inlay-hints-mode)
         ("C-c e i" . imenu))
  :config
  (setq eglot-autoshutdown t))

(use-package flymake :straight t
  :hook ((prog-mode . flymake-mode)))
