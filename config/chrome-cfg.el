
;; fill column rule: this is what puts that line up there
;; fci is dead, long live internal dfci
(global-display-fill-column-indicator-mode 1)

; for fuck's sake...
(use-package all-the-icons :straight t)
(use-package nerd-icons
  :straight (nerd-icons
             :type git :host github :repo "rainstormstudio/nerd-icons.el"))

;;Doom's solarized is a good one.
(use-package doom-themes :straight t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  ;; we shouldn't really need to do this test...
  ;; but we do, or my font size gets reset.
  ;; It's a bug in doom or in emacs themes. Honestly not sure which.
  (if (not (member 'doom-solarized-dark custom-enabled-themes))
      (load-theme 'doom-solarized-dark t))
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;;Shiiiny
(use-package doom-modeline
  :straight t
  :init
  (doom-modeline-mode 1)
  (setq doom-modeline-height 20)
  (setq doom-modeline-bar-width 2)
  (doom-modeline-def-modeline 'main
    '(bar matches buffer-info remote-host buffer-position parrot selection-info)
    '(misc-info minor-modes input-method buffer-encoding major-mode
                process vcs checker "  "))
  
  ;;hack to ensure we only show icons in graphics mode
  (add-hook 'focus-in-hook
            (lambda () (setq doom-modeline-icon (display-graphic-p)))))

;;; chrome-cfg.el ends here
