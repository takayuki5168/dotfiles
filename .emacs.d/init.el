(global-set-key "\C-h" 'delete-backward-char)
(load-theme 'manoj-dark t)
(setq backup-directory-alist '((".*"."~/.ehist")))

(add-to-list 'load-path "~/.emacs.d/.emacs-trr")
(require 'trr)
