;;; init.el --- User Emacs configuration -*- lexical-binding: t; -*-

(require 'package)
(require 'warnings)
(require 'seq)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'warning-suppress-log-types '(files missing-lexbind-cookie))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

(use-package gruber-darker-theme
  :ensure t
  :no-require t
  :config
  (load-theme 'gruber-darker t t)
  (dolist (entry (get 'gruber-darker 'theme-settings))
    (when (eq (car entry) 'theme-face)
      (dolist (spec (nth 3 entry))
        (let ((plist (cadr spec)))
          (while (consp plist)
            (when (null (cadr plist))
              (setcar (cdr plist) 'unspecified))
            (setq plist (cddr plist)))))))
  (enable-theme 'gruber-darker))

(use-package smex
  :ensure t
  :bind (("M-x" . smex)
         ("C-x C-m" . execute-extended-command)))

(setq treesit-enabled-modes t)

(use-package eglot
  :ensure nil
  :hook ((python-base-mode c-mode c++-mode objc-mode
                           c-ts-mode c++-ts-mode
                           rust-mode rust-ts-mode)
         . eglot-ensure)
  :config
  (setq eglot-server-programs
        (append
         '(((c-mode c-ts-mode c++-mode c++-ts-mode objc-mode)
            "clangd"
            "--compile-commands-dir=build"
            "--background-index"
            "--completion-style=detailed"
            "--header-insertion=never"
            "--all-scopes-completion"
            "--cross-file-rename"
            "--enable-config"))
         (seq-remove
          (lambda (entry)
            (seq-some (lambda (mode)
                        (and (symbolp mode)
                             (memq mode '(c-mode c++-mode objc-mode
                                                c-ts-mode c++-ts-mode
                                                python-mode python-ts-mode))))
                      (ensure-list (car entry))))
          eglot-server-programs)))
  (setq eglot-workspace-configuration
        '(:rust-analyzer (:cargo (:allFeatures t)
                                  :check (:command "clippy"))))
  (setq flymake-show-diagnostics-at-end-of-line 'short))

(ido-mode 1)
(ido-everywhere 1)
(global-display-line-numbers-mode 1)

;;; init.el ends here
