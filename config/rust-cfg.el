;;; rust-cfg.el -- rust config
;;; Commentary:
;;none yet.
;;; Code:
(use-package rust-mode :ensure t
  :mode ("\\.rs\\'" . rust-mode))

(use-package cargo :ensure t
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust :ensure t
  :after (flycheck)
  :hook  (flycheck-mode . flycheck-rust-setup))

(provide 'rust-cfg)
;;; rust-cfg.el ends here
