;;; site-unix -- settings that break on the non-unices
;;; Commentary:
;;; Code:

(require 'gnus-cfg)
(use-package keychain-environment :ensure t
  :config (keychain-refresh-environment))

(provide 'site-unix)
;;; site-unix.el ends here
