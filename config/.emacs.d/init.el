(global-set-key "\C-h" 'delete-backward-char)   ;; ctrl+h as back-space
(load-theme 'manoj-dark t)   ;; color theme
(setq backup-directory-alist '((".*"."~/.ehist")))   ;; remove backup file

;; trr
(add-to-list 'load-path "~/.emacs.d/.emacs-trr")
(require 'trr)

;; euslime
(add-to-list 'load-path "/home/takayuki/private/setting/euslime/slime")
(add-to-list 'load-path "/home/takayuki/private/setting/euslime/euslime")
(require 'slime-autoloads)
(require 'euslime)
(setq slime-contribs '(slime-fancy slime-banner slime-repl-ansi-color))
(setq inferior-lisp-program "sbcl")

;; rosemacs
(add-to-list 'load-path "/opt/ros/kinetic/share/emacs/site-lisp")
(require 'rosemacs-config)

;; visualize tab and space
(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         ;;                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))
(setq whitespace-display-mappings
      '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
(global-whitespace-mode 1)

;; cancel auto indent function
(electric-indent-mode -1)

;; use 4 spaces instead of tab
(setq-default tab-width 4 indent-tabs-mode nil)

;; show line index
(global-linum-mode t)
