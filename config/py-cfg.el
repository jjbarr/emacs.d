;;; py-cfg --- python-related configuration
;;; Commentary:
;;; Code:
(use-package python-black
  :ensure t
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode)
  :config
  (setq python-black-extra-args '("--line-length" "80")))
(use-package python-isort
  :ensure t
  :after python
  :hook (python-mode . python-isort-on-save-mode))
(provide 'py-cfg)
;;; py-cfg.el ends here

