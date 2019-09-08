;;; haskell-cfg.el -- configuration for working with Haskell
;;; Commentary:
;; none.
;;; Code:
(use-package haskell-mode :ensure t
  :mode "\\.hs\\'"
  :hooks ((haskell-mode . interactive-haskell-mode)))


(provide 'haskell-cfg)
;;; haskell-cfg.el ends here
