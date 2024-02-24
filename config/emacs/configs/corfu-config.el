;;; init-corfu.el --- Interactive completion in buffers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(use-package corfu
	:ensure t
	:custom
	(corfu-auto t)
	:bind
	(:map corfu-map
				("TAB" . corfu-next)
				([tab] . corfu-next)
				("S-TAB" . corfu-previous)
				([backtab] . corfu-previous)
				("M-d" . corfu-info-documentation))
	:custom
	(tab-always-indent 'complete)
	(completion-cycle-threshold nil)
	(lsp-completion-provider :none)
	:init
	(global-corfu-mode)
	(corfu-popupinfo-mode)
	)

(use-package kind-icon
	:after corfu
	:custom
	(kind-icon-use-icons t)
	(kind-icon-default-face 'corfu-default)
	(kind-icon-blend-background nil)
	(kind-icon-blend-frac 0.08)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)
	)


(use-package orderless
	:init
	(setq completion-styles '(orderless basic)
				completion-category-defaults nil
				completion-category-overrides '((file (styles partial-completion)))))

(add-hook 'eshell-mode-hook
          (lambda ()
            (setq-local corfu-auto nil)
            (corfu-mode)))

;; (setq tab-always-indent 'complete)
;; (when (use-package orderless)
;;   (with-eval-after-load 'vertico
;;     (require 'orderless)
;;     (setq completion-styles '(orderless basic))))
;; (setq completion-category-defaults nil
;;       completion-category-overrides nil)
;; (setq completion-cycle-threshold 4)

;; (when (use-package corfu)
;;   (setq-default corfu-auto t)
;;   (with-eval-after-load 'eshell
;;     (add-hook 'eshell-mode-hook (lambda () (setq-local corfu-auto nil))))
;;   (setq-default corfu-quit-no-match 'separator)
;;   (add-hook 'after-init-hook 'global-corfu-mode)

;;   (with-eval-after-load 'corfu
;;     (corfu-popupinfo-mode))

;;   ;; Make Corfu also work in terminals, without disturbing usual behaviour in GUI
;;   (when (use-package corfu-terminal)
;;     (with-eval-after-load 'corfu
;;       (corfu-terminal-mode)))
;;   ;; TODO: https://github.com/jdtsmith/kind-icon
;;   )


(provide 'corfu-config)
;;; corfu-config.el ends here
