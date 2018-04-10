(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(load (concat user-emacs-directory "init-el-get.el"))

(global-set-key "\C-h" 'delete-backward-char)
(load-theme 'manoj-dark t)
(setq backup-directory-alist '((".*"."~/.ehist")))
