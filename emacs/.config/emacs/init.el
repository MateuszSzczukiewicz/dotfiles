(setq inhibit-startup-screen t)
(ido-mode 1)
(ido-everywhere 1)
(global-display-line-numbers-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode 1)

(add-to-list 'default-frame-alist
             '(font . "Iosevka Nerd Font Mono-20"))
(add-to-list 'warning-suppress-types '(files missing-lexbind-cookie))


(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq initial-scratch-message nil)

(load custom-file t t)

(use-package gruber-darker-theme
  :ensure t
  :config
  (load-theme 'gruber-darker t))

(use-package smex
  :ensure t
  :bind (("M-x" . smex)
         ("C-x C-m" . execute-extended-command)))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

