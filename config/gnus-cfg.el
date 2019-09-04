;;; gnus-cfg.el -- gnus config
;;; Commentary:
;; none at present
;;; Code:
(use-package gnus
  :after (helm) ;my mailconf uses helm internally for stuff
  :config
  (setq user-mail-address (car user-mail-addresses)) ;;sane defaults
  (defun set-user-mail ()
    "interactively set the user email from the variable user-email-addresses."
    (interactive)
    (helm :sources (helm-build-sync-source "Helm Email"
                       :candidates user-mail-addresses
                       :fuzzy-match t
                       :action '(("Use Address" .
                                  (lambda (e)
                                    (setq user-mail-address e)))))))
  (setq gnus-nntp-server nil
        gnus-select-method '(nnnil "")
        gnus-fetch-old-headers 'some)
  (setq gnus-secondary-select-methods
        '((nnimap "personal"
                  (nnimap-address "imap.gmail.com")
                  (nnimap-server-port "imaps")
                  (nnimap-stream ssl)
                  (nnmail-expiry-target "nnimap+personal:[Gmail]/All Mail")
                  (nnmail-expiry-wait immediate))
          (nnimap "school"
                  (nnimap-address "imap.gmail.com")
                  (nnimap-server-port "imaps")
                  (nnimap-stream ssl)
                  (nnmail-expiry-target "nnimap+school:[Gmail]/All Mail")
                  (nnmail-expiry-wait immediate))))
  (setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]"))
(use-package smtpmail
  :config
  (setq smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-stream-type 'ssl
        smtpmail-smtp-service 465))

(provide 'gnus-cfg)
;;; gnus-cfg ends here
