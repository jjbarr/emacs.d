;;; haskell-cfg.el -- configuration for working with Haskell
;;; Commentary:
;; none.
;;; Code:
(use-package haskell-mode :ensure t
  :mode "\\.hs\\'")

(use-package intero :ensure t
  :hook ((haskell-mode . intero-mode)))

(provide 'haskell-cfg)
;;; haskell-cfg.el ends here
