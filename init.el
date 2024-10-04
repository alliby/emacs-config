;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(set-frame-font "consolas 15" nil t)

(setq visible-bell 1)
(setq inhibit-startup-message 1)
(setq default-directory "C:\\Users\\mouha")
(setq eglot-ignored-server-capabilities '(:inlayHintProvider))
(setq make-backup-files nil) ;; prevent creating ~ files
(setq dired-listing-switches "-lah") ;; add h for human readable file size

(ido-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

(load-theme 'wombat)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(put 'upcase-region 'disabled nil)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package rust-mode)
(use-package zig-mode
  :config
  (setq zig-format-on-save nil))
(use-package ripgrep)

(load-file "~\\.emacs.d\\odin-mode.el")
