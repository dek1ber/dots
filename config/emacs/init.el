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

;; All vi-mode keybindings and actions
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-i-jump nil)
  (setq evil-want-C-u-scroll t)
  (setq org-return-follows-links t)
  (evil-mode))
(define-key evil-insert-state-map (kbd "C-c C-c") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-c C-c") 'evil-normal-state)

;; Relative line numbering
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; General terminal-esque keybindings
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-k") 'tab-new)
(global-set-key (kbd "C-j") 'tab-close)
(global-set-key (kbd "C-h") 'tab-previous)
(global-set-key (kbd "C-l") 'tab-next)

(evil-set-leader 'motion (kbd "C-e"))
(evil-define-key 'normal 'global (kbd "<leader>c") 'tab-new)
(evil-define-key 'normal 'global (kbd "<leader>x") 'tab-close)
(evil-define-key 'normal 'global (kbd "<leader>n") 'tab-next)
(evil-define-key 'normal 'global (kbd "<leader>p") 'tab-previous)

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
    "u" '(split-window-right :wk "Split file right")
    "y" '(split-window-below :wk "Split file below")
    "t" '(eshell :wk "Terminalllll [eshell]")
    "g" '(magit-status :wk "[Ma]git status")
    "b i" '(helm-buffers-list :wk "Helm buffer list")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previous buffer")
		"p" '(neotree-project-dir :wk "Toggle neotree project")
    "TAB" '(comment-line :wk "Comment line[s]")))

(add-to-list 'load-path (expand-file-name "configs" user-emacs-directory))

;; Navigation around splits
(setq windmove-wrap-around t)
(use-package windmove
	:ensure nil
	:bind*
	(("C-e h" . windmove-left)
	 ("C-e j" . windmove-down)
	 ("C-e k" . windmove-up)
	 ("C-e l" . windmove-right)
	 ))

;; Docker config
(use-package docker
	:ensure t
	:bind ("C-c d" . docker))

;; LSP Config
(use-package lsp-mode
  :ensure
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  ;; This controls the overlays that display type and other hints inline. Enable
  ;; / disable as you prefer. Well require a `lsp-workspace-restart' to have an
  ;; effect on open projects.
  (lsp-rust-analyzer-server-display-inlay-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-closure-return-type-hints t)
  (lsp-rust-analyzer-display-parameter-hints nil)
  (lsp-rust-analyzer-display-reborrow-hints nil)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
	:config
	(setq rustic-format-on-save t)
	(add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))


(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t))
  (add-hook 'before-save-hook 'lsp-format-buffer nil t))

;; Git config
(use-package magit)

;; Theming
(use-package doom-themes
             :demand
             :config
             (load-theme 'doom-acario-dark t))
;; NeoTree
(use-package nerd-icons)

(use-package neotree)
(setq neo-theme (if (display-graphic-p) 'ascii))

(use-package projectile)
(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))

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
	 '(auto-complete corfu docker doom-themes evil general helm kind-icon
									 lsp-mode magit neotree nerd-icons nyan-mode
									 orderless popwin projectile rustic which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
