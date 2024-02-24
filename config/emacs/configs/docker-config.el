;;; docker-config.el --- LSP support via eglot          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package docker
	:ensure t
	:bind ("C-c d" . docker))


(provide 'docker-config)
