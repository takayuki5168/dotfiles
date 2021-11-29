(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(global-set-key "\C-h" 'delete-backward-char)   ;; ctrl+h as back-space
(load-theme 'manoj-dark t)   ;; color theme
(setq backup-directory-alist '((".*"."~/.ehist")))   ;; remove backup file

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

;; clang format
;; (load "/usr/share/emacs/site-lisp/clang-format-10/clang-format.el")

;; (defun clang-format-save-hook-for-this-buffer ()
;;   "Create a buffer local save hook."
;;   (add-hook 'before-save-hook
;;     (lambda ()
;;       (progn
;;         (when (locate-dominating-file "." ".clang-format")
;;           (clang-format-buffer))
;;         ;; Continue to save.
;;         nil))
;;     nil
;;     ;; Buffer local hook.
;;     t))

;; (add-hook 'c-mode-hook (lambda () (clang-format-save-hook-for-this-buffer)))
;; (add-hook 'c++-mode-hook (lambda () (clang-format-save-hook-for-this-buffer)))
