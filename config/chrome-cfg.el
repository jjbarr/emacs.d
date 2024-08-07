;; -*- lexical-binding: t; -*-

(use-package emacs
  :init
  ;; fill column rule: this is what puts that line up there
  ;; old fci is dead, long live internal dfci
  (global-display-fill-column-indicator-mode 1)

  ;; We have to do this for certain actions that need to be run after the UI
  ;; loads. Why isn't this built in? x.x
  (defun apply-if-gui (&rest action)
    "Do specified ACTION if we're in a gui regardless of daemon or not."
    (if (daemonp)
        (add-hook 'after-make-frame-functions
                  (lambda (frame)
                    (select-frame frame)
                    (if (display-graphic-p frame)
                        (apply action))))
      (if (display-graphic-p)
          (apply action))))
  ;; my preferred font
  (apply-if-gui
   (lambda ()
     (if (and standard-display-table
              (char-table-range standard-display-table #x201d))
         ;; if we're entering a graphical context for the first time after
         ;; launch, standard-display-table is full of entries that only exist to
         ;; keep the linux console or a similar terminal from freaking out. This
         ;; is not useful in a graphical environment or with modern unicode
         ;; terminal emulators. So we need to trash it.
         (setq standard-display-table nil))
     ;; flymake-indicator-type is set incorrectly for graphical environments
     ;; if we're coming in daemonized by default, which is irritating.
     (setq flymake-indicator-type 'fringes)
     
     (set-face-attribute 'default nil :font "Terminus" :height 120)
     (set-face-attribute 'fixed-pitch nil :font "Source Code Pro"
                         :height 100)
     (set-face-attribute 'variable-pitch-text nil :height 1.0)
     ;; lmm is almost comically busted inside emacs
     (add-to-list 'face-ignored-fonts "Latin Modern Math")
     
     ;; ...and we need to do this because bqn386 doesn't do the right thing.
     ;; for some reason. It was this or keep blacklisting math fonts until Emacs
     ;; worked.
     (set-fontset-font "fontset-default" '(#x1d53d . #x1d53e) "BQN386 Unicode")
     (set-fontset-font "fontset-default" '(#x1d54a . #x1d54a) "BQN386 Unicode")
     (set-fontset-font "fontset-default" '(#x1d54e . #x1d54f) "BQN386 Unicode")
     (set-fontset-font "fontset-default" '(#x1d557 . #x1d558) "BQN386 Unicode")
     (set-fontset-font "fontset-default" '(#x1d563 . #x1d564) "BQN386 Unicode")
     (set-fontset-font "fontset-default" '(#x1d568 . #x1d569) "BQN386 Unicode")
     )))

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
  :after (nerd-icons)
  :init
  (doom-modeline-mode 1)
  (setq doom-modeline-height 20)
  (setq doom-modeline-bar-width 2)
  ;;hack to ensure we only show icons in graphics mode
  (add-hook 'focus-in-hook
            (lambda () (setq doom-modeline-icon (display-graphic-p)))))

;; olivetti mode is nice for some things.
(use-package olivetti :straight (olivetti
                                 :type git :flavor melpa :host github
                                 :repo "rnkn/olivetti")
  :commands olivetti-mode
  :config
  (setq olivetti-style 'fancy)
  (set-face-attribute 'olivetti-fringe nil
                    :inherit 'ansi-color-bright-black))

;;; chrome-cfg.el ends here
