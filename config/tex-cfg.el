;;; tex-cfg.el -- config for TeX
;;; Commentary:
;;; Code:
(use-package tex :straight (auctex)
  :defer t
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-PDF-mode t)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (setq-default TeX-master nil))


;;; tex-cfg ends here
