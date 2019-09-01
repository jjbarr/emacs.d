;;; projectile-cfg.el -- configure projectile
;;; Commentary:
;;none
;;; Code:
(use-package projectile :ensure t
  :demand t
  :delight '(:eval (concat " " (projectile-project-name)))
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-search-path '("~/projects"))
  (projectile-mode))

(use-package helm-projectile :ensure t
  :demand t
  :after (helm projectile)
  :config (helm-projectile-on))

(provide 'projectile-cfg)
;;; projectile-cfg.el ends here
