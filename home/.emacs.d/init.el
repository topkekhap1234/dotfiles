;; --- 1. ПАКЕТЫ ---
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org")
                         ("gnu" . "https://elpa.gnu.org")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; --- 2. ШРИФТЫ (JetBrains Mono) ---
;; Основной текст: Medium (средняя жирность)
(set-face-attribute 'default nil :family "JetBrains Mono" :height 130 :weight 'medium)
(set-face-attribute 'fixed-pitch nil :family "JetBrains Mono" :weight 'medium)
(add-to-list 'default-frame-alist '(weight . medium))

;; --- 3. ИНТЕРФЕЙС ---
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode t)
(electric-pair-mode 1)
(setq inhibit-startup-screen t)
(setq-default mode-line-format '(" %*" "%b"))

(use-package gruvbox-theme
  :config (load-theme 'gruvbox-dark-medium t))

;; --- 4. LSP И ЯЗЫКИ (Java, Python и др.) ---
(use-package lsp-mode
  :hook ((python-mode . lsp-deferred)
         (java-mode . lsp-deferred)
         (html-mode . lsp-deferred)
         (css-mode . lsp-deferred)
         (c++-mode . lsp-deferred))
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-keep-workspace-alive nil
        lsp-warn-no-matched-clients nil))

(use-package lsp-java :after lsp)
(use-package lsp-ui :commands lsp-ui-mode)

;; --- 5. КОМПЛИТШЕН (Vertico, Consult, Company) ---
(use-package vertico :init (vertico-mode))
(use-package savehist :init (savehist-mode))
(use-package orderless
  :custom (completion-styles '(orderless basic)))

(use-package consult
  :bind (("C-x b" . consult-buffer)
         ("M-y" . consult-yank-pop)
         ("M-g g" . consult-goto-line)
         ("M-s l" . consult-line)))

(use-package company
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))

(use-package reverse-im
  :config (reverse-im-activate "russian-computer"))

(use-package vterm)

;; --- 6. ГОРЯЧИЕ КЛАВИШИ ---
(keymap-global-set "C-S-a" #'beginning-of-buffer)
(keymap-global-set "C-S-e" #'end-of-buffer)
(keymap-global-set "C-!" #'vterm)
(global-set-key (kbd "M-g") 'goto-line)

;; --- 7. СТИЛИЗАЦИЯ ТЕКСТА (Жирный + Курсив) ---
(custom-set-faces
 '(font-lock-keyword-face ((t (:weight bold :slant italic)))) ; if, return
 '(font-lock-type-face ((t (:weight bold))))                ; String, int
 '(font-lock-comment-face ((t (:weight medium :slant italic)))) ; // комментарии
 '(font-lock-string-face ((t (:weight medium))))            ; "строки"
 '(font-lock-function-name-face ((t (:weight bold))))       ; main()
 '(font-lock-builtin-face ((t (:weight bold))))
 '(font-lock-constant-face ((t (:weight bold))))
 '(font-lock-variable-name-face ((t (:weight medium)))))

;; Бэкапы
(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))
