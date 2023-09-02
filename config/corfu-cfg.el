(use-package corfu :straight (corfu :type git :host github
                      :repo "emacs-straight/corfu"
                      :files ("*" "extensions/*.el" (:exclude ".git")))
  :after (consult)
  :demand t
  :config
  (setq corfu-auto t
        corfu-quit-no-match 'separator
        corfu-auto-delay 0
        corfu-auto-prefix 3)
  (defun corfu-move-to-minibuffer ()
    (interactive)
    (when completion-in-region--data
      (let ((completion-extra-properties corfu--extra)
            completion-cycle-threshold completion-cycling)
        (apply #'consult-completion-in-region completion-in-region--data))))
  (keymap-set corfu-map "M-m" #'corfu-move-to-minibuffer)
  (add-to-list 'corfu-continue-commands #'corfu-move-to-minibuffer)
  (global-corfu-mode))

(use-package cape :straight t
    :bind (("M-p p" . completion-at-point) ;; capf
           ("M-p t" . complete-tag)        ;; etags
           ("M-p d" . cape-dabbrev)        ;; or dabbrev-completion
           ("M-p h" . cape-history)
           ("M-p f" . cape-file)
           ("M-p k" . cape-keyword)
           ("M-p s" . cape-elisp-symbol)
           ("M-p e" . cape-elisp-block)
           ("M-p a" . cape-abbrev)
           ("M-p l" . cape-line)
           ("M-p w" . cape-dict)
           ("M-p \\" . cape-tex)
           ("M-p _" . cape-tex)
           ("M-p ^" . cape-tex)
           ("M-p &" . cape-sgml)
           ("M-p r" . cape-rfc1345))
    :init
    (add-to-list 'completion-at-point-functions
                 (cape-capf-super #'cape-dict #'cape-dabbrev #'cape-keyword))
    (add-to-list 'completion-at-point-functions #'cape-file))
