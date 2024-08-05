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
  :hook ((eglot-managed-mode . my/eglot-eldoc)
         (eglot-managed-mode . my/eglot-disable-inlay))
  :bind (:map eglot-mode-map
         ("C-c e b" . eglot-format-buffer)
         ("C-c e r" . eglot-rename)
         ("C-c e c" . eglot-code-actions)
         ("C-c e n" . eglot-inlay-hints-mode)
         ("C-c e i" . imenu))
  :config
  (setq eglot-autoshutdown t)
  (add-to-list 'eglot-server-programs
               '((rust-ts-mode rust-mode)
                 . ("rust-analyzer"
                    :initializationOptions (:check (:command "clippy"))))))

;;(use-package eglot-x :straight (eglot-x :type git :host github
;;                                        :repo "nemethf/eglot-x")
;;  :after (eglot)
;;  :bind (:map eglot-mode-map
;;              ("C-c e x" . eglot-x-find-refs)
;;              ("C-c e R d" . eglot-x-open-external-documentation)
;;              ("C-c e R m" . eglot-x-expand-macro)
;;              ("C-c e R c" . eglot-x-run-flycheck)
;;              ("C-c e R l" . eglot-x-view-recursive-memory-layout))
;;  :config
;;  (eglot-x-setup))

(use-package flymake :straight t
  :hook ((prog-mode . flymake-mode))
  :config (setq flymake-autoresize-margins nil))
