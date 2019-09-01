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
            `(,(substitute-in-file-name "$HOMEPATH/Projects"))
            '("~/projects")))
  (projectile-mode))

(use-package helm-projectile :ensure t
  :demand t
  :after (helm projectile)
  :config (helm-projectile-on))

(provide 'projectile-cfg)
;;; projectile-cfg.el ends here
