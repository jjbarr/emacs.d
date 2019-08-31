;;; treemacs-cfg.el -- my treemacs config
;;; Commentary:
;;none
;;; Code:
(require 'use-package)
(use-package treemacs :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
    (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-f" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-projectile :ensure t
  :after treemacs projectile)

(use-package treemacs-magit :ensure t
  :after treemacs magit)

(provide 'treemacs-cfg)
;;; treemacs-cfg.el ends here
