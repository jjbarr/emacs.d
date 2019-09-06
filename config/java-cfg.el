;;; java-cfg.el -- extra stuff for Java code
;;; Commentary:
;; none
;;; Code:
(use-package lsp-java :ensure t :after lsp)
(use-package dap-java :after lsp-java)


;;run checkstyle in Java
(defvar checkstyle-check-config "style.xml"
  "The config file to be used with checkstyle.")

(flycheck-define-command-checker 'java-checkstyle
  "Check java source using checkstyle"
  :command '("checkstyle" (config-file "-c " checkstyle-check-config) source)
  :error-patterns
  '((warning "[WARN]" blank (file-name) ":" line ": " (message) line-end)
    (error "[ERROR]" blank (file-name) ":" line ": " (message) line-end)
    (info "[INFO]" blank (file-name) ":" line ": " (message) line-end))
  :modes 'java-mode)
(flycheck-def-executable-var 'java-checkstyle "checkstyle")
(defun enable-checkstyle ()
  "Enables the checkstyle flycheck checker."
    (interactive)
    (when (eq major-mode 'java-mode)
      (flycheck-add-next-checker 'lsp-ui
                                 '(warning . java-checkstyle))))

(provide 'java-cfg)
;;; java-cfg.el ends here
