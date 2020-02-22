;;; site-unix -- settings that break on the non-unices
;;; Commentary:
;;; Code:

(require 'gnus-cfg)
(use-package keychain-environment :ensure t
  :config (keychain-refresh-environment))

;;I don't have Evince...
(push '(output-pdf "Okular") TeX-view-program-selection)
(provide 'site-unix)
;;; site-unix.el ends here
