(require 'cnblogs)

(add-hook 'org-mode-hook (lambda ()
                           (cnblogs-minor-mode)))
;; Usage:
;; M-x: cnblogs-setup-blog
;; c-c c p: post publish
;; c-c c e: edit update
;; c-c c d: delete

(provide 'init-cnblogs)