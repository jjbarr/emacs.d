;;; font-cfg.el -- configure fonts
;;; Commentary:
;; none.
;;; Code:
(apply-if-gui
 (lambda ()
   (set-face-attribute 'default nil :font "Terminus (TTF)" :height 120)))
;;; font-cfg.el ends here

