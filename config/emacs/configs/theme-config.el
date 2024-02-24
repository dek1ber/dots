;;; theme-config.el --- Interactive completion in buffers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package doom-themes
             :demand
             :config
             (load-theme 'doom-acario-dark t))

(use-package nyan-mode
             :init
             (nyan-mode))

(provide 'theme-config)
;;; theme-config.el ends here
