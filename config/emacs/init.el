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
(global-set-key (kbd "C-k") 'tab-new)
(global-set-key (kbd "C-j") 'tab-close)
(global-set-key (kbd "C-h") 'tab-previous)
(global-set-key (kbd "C-l") 'tab-next)

;; Leader Keys
(use-package general
  :config
  (general-evil-setup)
  (general-create-definer start/leader-keys
			  :states '(normal insert visual emacs)
			  :keymaps 'override
			  :prefix "SPC"
			  :global-prefix "C-SPC")

  (start/leader-keys
    "." '(find-file :wk "Find file")
    "i" '((lambda () (interactive) (find-file "~/.config/emacs/init.el")) :wk "Find file")
    "o" '(split-window-right :wk "Split file right")
    "k" '(split-window-below :wk "Split file below")
    "t" '(eshell :wk "Terminalllll [eshell]")
    "g" '(magit-status :wk "[Ma]git status")
    "b i" '(helm-buffers-list :wk "Helm buffer list")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previous buffer")
    "TAB" '(comment-line :wk "Comment line[s]")))

(add-to-list 'load-path (expand-file-name "configs" user-emacs-directory))

;; Docker config
(use-package docker
	:ensure t
	:bind ("C-c d" . docker))

;; Git config
(use-package magit)

;; Theming
(use-package doom-themes
             :demand
             :config
             (load-theme 'doom-acario-dark t))

;; Load in external elisp files
(require 'corfu-config)
(require 'helm-config)
(require 'lsp-config)

(use-package popwin
	:ensure t)
(popwin-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 '(lsp-mode which-key auto-complete popwin orderless nyan-mode magit kind-icon helm general evil doom-themes docker corfu)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
