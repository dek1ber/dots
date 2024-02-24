;;; leaders-config.el --- LSP support via eglot          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

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

(provide 'leaders-config)
