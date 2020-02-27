;; http://tuhdo.github.io/c-ide.html
(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(require 'setup-helm)
(require 'setup-helm-gtags)
(global-set-key (kbd "M-j") 'helm-gtags-find-tag)
(global-set-key (kbd "M-k") 'helm-gtags-find-pattern)
(global-set-key (kbd "M-l") 'helm-gtags-find-files)
(require 'setup-cedet)

;; my config
;; Configuration code reference line
(setq frame-title-format '("" buffer-file-name "@emacs" ));; display file path @emacs on title buffer

;; Configuration code utf-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;Configure tab settings, spaces instead, 4 characters
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Character highlighting
(require 'highlight-symbol)
(global-set-key (kbd "M--") 'highlight-symbol-at-point)
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)

;;Bracket matching
(autopair-global-mode 0)
(show-paren-mode 0)

;;COLOR_THEME install package atom-one-dark
;;(load-theme 'atom-one-dark t)
(load-theme 'solarized-dark t)

;;display line number
(global-linum-mode 1)

;;Restore last desktop when booting
(desktop-save-mode t) ;;long time initialization,and it will open semantic-mode
(semantic-mode 0)

(setq auto-save-default nil) ;Do not generate ##file
(setq backup-by-copying nil) ;Do not generate ~file

;;display time
(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

(setq c-default-style "linux"
      c-basic-offset 4)

;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.emacs.d/.emacs-backups"))))

(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;; (defun my-comment-or-uncomment-region (beg end &optional arg)
;;   (interactive (if (use-region-p)
;;                    (list (region-beginning) (region-end) nil)
;;                  (list (line-beginning-position)
;;                        (line-beginning-position 2))))
;;   (comment-or-uncomment-region beg end arg)
;; )

;; (global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region)
;; (put 'scroll-left 'disabled nil)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (markdown-mode
;;      markdown-preview-mode
;;      zygospore
;;      yasnippet
;;      ws-butler
;;      volatile-highlights
;;      use-package
;;      undo-tree
;;      solarized-theme
;;      smartparens
;;      iedit
;;      highlight-symbol
;;      highlight-parentheses
;;      helm-swoop
;;      helm-projectile
;;      helm-gtags
;;      ggtags
;;      fill-column-indicator
;;      duplicate-thing
;;      dtrt-indent
;;      company
;;      comment-dwim-2
;;      color-theme-solarized
;;      clean-aindent-mode
;;      autopair
;;      auto-complete
;;      atom-one-dark-theme
;;      anzu))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
 ;; )

;; bak instruction
;; (require 'color-rg);;for search tools
;; (define-key isearch-mode-map (kbd "M-s M-s") 'isearch-toggle-color-rg)
