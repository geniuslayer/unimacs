;;; init-guide-key.el --- Summary
;;; Commentary:
;; Hint key bindings, useful for beginners.

;;; Code:
(use-package guide-key
  :init
  (guide-key-mode t)
  (setq guide-key/guide-key-sequence t)
  (setq guide-key/idle-delay 1.0)
  :diminish guide-key-mode)

(provide 'init-guide-key)
;;; init-guide-key.el ends here