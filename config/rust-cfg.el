;;; rust-cfg.el -- rust config
;;; Commentary:
;;none yet.
;;; Code:
(use-package rustic :ensure t
  :after (lsp-mode lsp-ui)
  :mode ("\\.rs\\'" . rustic-mode))

(provide 'rust-cfg)
;;; rust-cfg.el ends here
