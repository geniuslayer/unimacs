;;; init-emmet.el --- Summary
;;; Commentary:
;; comments

;;; Code:
(use-package emmet-mode
  :defer 0
  :config
  ;; @see https://github.com/rooney/zencoding for original tutorial
  ;; @see https://github.com/smihica/emmet for new tutorial
  ;; C-j or C-return to expand the line
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook  'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode)
  (add-hook 'nxml-mode-hook 'emmet-mode)
  )

(provide 'init-emmet)
;;; init-emmet.el ends here