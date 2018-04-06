;; MELPA
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(custom-safe-themes (quote (default default)))
 '(indent-tabs-mode nil)
 '(package-selected-packages
   (quote
    (ac-math abyss-theme markdown-toc markdown-mode auto-complete)))
 '(tab-always-indent (quote complete))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; www.saltycrane.com/blog/2010/05/my-emacs-python-environment
(add-to-list 'load-path
	     "~/.emacs.d/elpa/auto-complete-1.5.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
	     "~/.emacs.d/elpa/auto-complete-1.5.1/dict")
(ac-config-default)
