;; lsp-config.el --- LSP support via eglot (and a couple of other utilities as well)          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package eglot
	:hook (prog-mode . eglot-ensure)
	(setq eglot-stay-out-of '(flymake)))

(use-package eldoc
	:init
	(global-eldoc-mode))

(use-package flymake
	:hook (prog-mode . flymake-mode))

(provide 'lsp-config)
;;; lsp-config.el ends here
