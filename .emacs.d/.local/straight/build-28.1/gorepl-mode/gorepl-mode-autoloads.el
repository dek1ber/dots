;;; gorepl-mode-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "gorepl-mode" "gorepl-mode.el" (0 0 0 0))
;;; Generated autoloads from gorepl-mode.el

(autoload 'gorepl-mode "gorepl-mode" "\
A minor mode for run a go repl on top of gore

This is a minor mode.  If called interactively, toggle the
`Gorepl mode' mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `gorepl-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "gorepl-mode" '("gorepl-"))

;;;***

(provide 'gorepl-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; gorepl-mode-autoloads.el ends here
