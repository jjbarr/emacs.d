;;; ivy-cfg.el -- experimental ivy config
;;; Commentary:
;;; Code:
(use-package swiper :ensure t
  :bind (("C-s" . swiper)
         ("C-r" . swiper-backward)))
(use-package counsel :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("<f1> f" . counsel-describe-function)
         ("<f1> v" . counsel-describe-variable)
         ("<f1> l" . counsel-find-library)
         ("<f2> i" . counsel-info-lookup-symbol)
         ("<f2> u" . counsel-unicode-char)
         ("C-c g" . counsel-git)
         ("C-c j" . counsel-git-grep)
         ("C-c k" . counsel-rg)
         ("C-x l" . counsel-locate)
         :map minibuffer-local-map
         ("C-r" . counsel-minibuffer-history)))
(use-package ivy :ensure t
  :diminish
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  :bind (("C-c C-r" . ivy-resume)
         ("<f6>" . ivy-resume)
         :map minibuffer-local-map
         ("C-'" . ivy-avy)))
(provide 'ivy-cfg)
;;; ivy-cfg.el ends here

