;; Startup optimization + better garbage collection
;; Thanks https://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

(setq gc-cons-threshold (* 128 1024 1024))
(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)

;; Get rid of those annoying startup warnings
(setq warning-minimum-level :emergency)

;; Get rid of initial annoying emacs things (tool + menu + scroll bars)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil)

(setq scroll-conservatively 10)
(setq scroll-margin 8)
(global-set-key [escape] 'keyboard-escape-quit)

(setq org-edit-src-content-indentation 2)
(setq-default tab-width 2)

(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongu")))

;; All my vi keybindings and stuff
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-i-jump nil)
  (setq evil-want-C-u-scroll t)
  (setq org-return-follows-links t)
  (evil-mode))

;; Set up relative line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)


;; General terminal-esque keybindings
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(add-to-list 'load-path (expand-file-name "configs" user-emacs-directory))

;; Load in external elisp files
(require 'theme-config)
(require 'corfu-config)
(require 'helm-config)
(require 'magit-config)
(require 'lsp-config)
(require 'leaders-config)
(require 'docker-config)

(use-package popwin
	:ensure t)
(popwin-mode 1)
