(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(setq global-mark-ring-max 5000         ; increase mark ring to contains 5000 entries
	  mark-ring-max 5000                ; increase kill ring to contains 5000 entries
	  mode-require-final-newline t      ; add a newline to end of file
	  tab-width 4                       ; default to 4 visible spaces to display a tab
	  )

(add-hook 'sh-mode-hook (lambda ()
						  (setq tab-width 4)))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(global-set-key (kbd "RET") 'newline-and-indent)

(require 'ggtags)
(add-hook 'c-mode-common-hook
		  (lambda ()
			(when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
			  (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

(require 'semantic)
(require 'semantic/bovine/gcc)

(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)

(semantic-mode 1)
(global-ede-mode t)
(ede-enable-generic-projects)

(require 'helm-gtags)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 ;; helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

;; Enable helm-gtags-mode in Dired so you can jump to any tag
;; when navigate project tree with Dired
(add-hook 'dired-mode-hook 'helm-gtags-mode)

;; Enable helm-gtags-mode in Eshell for the same reason as above
(add-hook 'eshell-mode-hook 'helm-gtags-mode)

;; Enable helm-gtags-mode in languages that GNU Global supports
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'java-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; key bindings
(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(require 'helm)
(require 'helm-config)
(require 'helm-grep)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq
 helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
 helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.
 helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
 helm-candidate-number-limit 500 ; limit the number of displayed canidates
 helm-ff-file-name-history-use-recentf t
 helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
 helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non-nil
										; useful in helm-mini that lists buffers

 )

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h o") 'helm-occur)

(global-set-key (kbd "C-c h C-c w") 'helm-wikipedia-suggest)

(global-set-key (kbd "C-c h x") 'helm-register)
;; (global-set-key (kbd "C-x r j") 'jump-to-register)

(define-key 'help-command (kbd "C-f") 'helm-apropos)
(define-key 'help-command (kbd "r") 'helm-info-emacs)
(define-key 'help-command (kbd "C-l") 'helm-locate-library)

;; use helm to list eshell history
(add-hook 'eshell-mode-hook
		  #'(lambda ()
			  (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

;; show minibuffer history with Helm
(define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
(define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)

(define-key global-map [remap find-tag] 'helm-etags-select)

(define-key global-map [remap list-buffers] 'helm-buffers-list)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: helm-swoop                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Locate the helm-swoop folder to your path
(require 'helm-swoop)

;; Change the keybinds to whatever you like :)
(global-set-key (kbd "C-c h o") 'helm-swoop)
(global-set-key (kbd "C-c s") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows t)

;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)

;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color t)

(helm-mode 1)

(require 'yasnippet)
(yas-global-mode 1)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(require 'iedit)
(define-key global-map (kbd "C-c ;") 'iedit-mode)

(require 'flymake)

(require 'gruvbox-theme)

(global-linum-mode t)
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)

(require 'autopair)

(windmove-default-keybindings 'meta)

(autopair-global-mode 1)

(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(defun my-irony-mode-hook ()
  (set 'compile-command "cmake && make")
  )

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-c-headers))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-files))

(require 'company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list
	'company-backends '(company-irony-c-headers)))

(setq
 gdb-many-windows t
 gdb-show-main t
 )

(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(set 'projectile-project-compilation-cmd "cmake && make")

(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'native)

(global-set-key (kbd "<f5>") 'projectile-compile-project)
(global-set-key (kbd "<f6>") 'next-error);

(require 'ws-butler)
(ws-butler-global-mode)

(require 'magit)

(global-set-key (kbd "<f7>") 'magit-status)

(menu-bar-mode -1)
(show-paren-mode 1)

(require 'rust-mode)

(require 'company-racer)

(with-eval-after-load 'company
        (add-to-list 'company-backends 'company-racer))

(setq racer-cmd "/usr/bin/racer")
(setq racer-rust-src-path "/usr/src/rust/src/")
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(add-hook 'rust-mode-hook
		  #'racer-mode)
(add-hook 'racer-mode-hook
		  #'eldoc-mode)
(add-hook 'rust-mode-hook
		  '(lambda ()
			 ;; Enable racer
			 (racer-activate)

			 ;; Hook in racer with eldoc to provide documentation
			 (racer-turn-on-eldoc)

			 ;; Use flycheck-rust in rust-mode
			 (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

			 ;; Use company-racer in rust mode
			 (set (make-local-variable 'company-backends) '(company-racer))

			 ;; Key binding to jump to method definition
			 (local-set-key (kbd "M-.") #'racer-find-definition)

			 ;; Key binding to auto complete and indent
			 (local-set-key (kbd "TAB") #'racer-complete-or-indent))
		  )

(add-to-list 'load-path "/usr/share/emacs/site-lisp/maxima/")
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
(setq imaxima-use-maxima-mode-flag t)
 (add-to-list 'auto-mode-alist '("\\.ma[cx]" . maxima-mode))

(global-set-key (kbd "<C-return>") 'company-complete-common)
