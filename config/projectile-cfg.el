;;; projectile-cfg.el -- configure projectile
;;; Commentary:
;;none
;;; Code:
(use-package projectile :ensure t
  :demand t
  :diminish projectile-mode
  :config
  (setq projectile-indexing-method 'alien)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-search-path
        (if (eq system-type 'windows-nt)
            (list (substitute-in-file-name "$HOMEPATH/Projects"))
          '("~/projects")))
  (projectile-mode))

(use-package counsel-projectile :ensure t
  :demand t
  :config
  (counsel-projectile-mode))

(provide 'projectile-cfg)
;;; projectile-cfg.el ends here
