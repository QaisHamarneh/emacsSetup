;; Do not show the startup screen.
(setq inhibit-startup-message t)

;; Disable tool bar, menu bar, scroll bar.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Highlight current line.
(global-hl-line-mode t)

;; Use `command` as `meta` in macOS.
(setq mac-command-modifier 'meta)

;; Do not use `init.el` for `custom-*` code - use `custom-file.el`.
(setq custom-file "~/.emacs.d/custom-file.el")

;; Assuming that the code in custom-file is execute before the code
;; ahead of this line is not a safe assumption. So load this file
;; proactively.
(load-file custom-file)

;; Require and initialize `package`.
(require 'package)
(package-initialize)

;; Add `melpa` to `package-archives`.
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))


;; Additional packages and their configurations

(use-package afternoon-theme)

(use-package company
  :ensure t
  ;; Navigate in completion minibuffer with `C-n` and `C-p`.
  ;; :bind (:map company-active-map
  ;;        ("C-n" . company-select-next)
  ;;        ("C-p" . company-select-previous))
  :config
  ;; Provide instant autocompletion.
  (setq company-idle-delay 0)
  ;; Use company mode everywhere.
  (global-company-mode t))


;; Recent buffers in a new Emacs session
(use-package recentf
  :config
  (setq recentf-auto-cleanup 'never
        recentf-max-saved-items 1000
        recentf-save-file (concat user-emacs-directory ".recentf"))
  (recentf-mode t)
  :diminish nil)

;; ;; Display possible completions at all places
;; (use-package ido-completing-read+
;;   :ensure t
;;   :config
;;   ;; This enables ido in all contexts where it could be useful, not just
;;   ;; for selecting buffer and file names
;;   (ido-mode t)
;;   (ido-everywhere t)
;;   ;; This allows partial matches, e.g. "uzh" will match "Ustad Zakir Hussain"
;;   (setq ido-enable-flex-matching t)
;;   (setq ido-use-filename-at-point nil) 
;;   ;; Includes buffer names of recently opened files, even if they're not open now.
;;   (setq ido-use-virtual-buffers t)
;;   :diminish nil)


;; Git integration for Emacs
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))


;; Enhance M-x to allow easier execution of commands
(use-package smex
  :ensure t
  ;; Using counsel-M-x for now. Remove this permanently if counsel-M-x works better.
  :disabled t
  :config
  (setq smex-save-file (concat user-emacs-directory ".smex-items"))
  (smex-initialize)
  :bind ("M-x" . smex))




(use-package neotree
  :ensure t
  :config
  (setq neo-smart-open t))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1))

(use-package undo-tree
  :ensure t
  :config 
  (global-undo-tree-mode)
  ) 


(use-package flycheck
  :ensure t
  :config
  (progn
    (global-flycheck-mode)))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keyboard shortcuts
 
  
(global-set-key (kbd "s-b") 'neotree-toggle) 

(global-set-key (kbd "<mouse-8>") 'kill-ring-save) 

(global-set-key (kbd "<mouse-9>") 'yank) 

(global-set-key (kbd "s-x") 'kill-ring) 

(global-set-key (kbd "s-c") 'kill-ring-save) 

(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-d") 'yank)


(global-set-key (kbd "s-h") 'replace-match)  
  
  

(global-set-key (kbd "s-a") 'mark-whole-buffer) 
(global-set-key (kbd "C-a") 'mark-whole-buffer) 

(global-set-key (kbd "s-/") 'comment-region) 

(global-set-key (kbd "s-.") 'uncomment-region) 

(global-set-key (kbd "s-q") 'delete-other-windows) 

;; Try if it works with s instead of C
(global-set-key (kbd "C-n") 'linum-mode) 



(add-hook 'prog-mode-hook #'hs-minor-mode) 

(global-set-key (kbd "s-f") 'hs-toggle-hiding) 


  

(global-set-key (kbd "C-z") 'undo-tree-undo) 

(global-set-key (kbd "C-S-z") 'undo-tree-redo) 

 

  

;; (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat ) 

;; (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance ) 

  

;; (define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward) 

;; (define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward) 

  

;; (define-key minibuffer-local-isearch-map (kbd "<left>") 'isearch-reverse-exit-minibuffer) 

;; (define-key minibuffer-local-isearch-map (kbd "<right>") 'isearch-forward-exit-minibuffer) 


  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Additional setup
(add-to-list 'auto-mode-alist '("\\.inc\\'" . tcl-mode)) 
