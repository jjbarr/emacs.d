;;; site-unix -- settings that break on the non-unices
;;; Commentary:
;;; Code:

(use-package keychain-environment :straight t
  :config (keychain-refresh-environment))

;;; site-unix.el ends here
