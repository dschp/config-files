(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(setq magit-define-global-key-bindings 'recommended)
(setq inhibit-startup-screen t)


(defun my-shrink-v5 ()
  (interactive)
  (shrink-window 5))
(defun my-enlarge-v5 ()
  (interactive)
  (enlarge-window 5))
(defun my-shrink-h5 ()
  (interactive)
  (shrink-window-horizontally 5))
(defun my-enlarge-h5 ()
  (interactive)
  (enlarge-window-horizontally 5))

(defun my-shrink-v10 ()
  (interactive)
  (shrink-window 10))
(defun my-enlarge-v10 ()
  (interactive)
  (enlarge-window 10))
(defun my-shrink-h10 ()
  (interactive)
  (shrink-window-horizontally 10))
(defun my-enlarge-h10 ()
  (interactive)
  (enlarge-window-horizontally 10))

(defun my-previous-line ()
  (interactive)
  (previous-line 8))
(defun my-next-line ()
  (interactive)
  (next-line 8))

(defun revert-this-buffer ()
  (interactive)
  (revert-buffer nil t t)
  (message (concat "Reverted buffer " (buffer-name))))

(defun my-mark-isearch-forward ()
  (interactive)
  (set-mark-command nil)
  (isearch-forward)
  (left-char 1))
(defun my-mark-isearch-backward ()
  (interactive)
  (set-mark-command nil)
  (isearch-backward)
  (right-char 1))

(keymap-global-set "M-<up>"   'my-previous-line)
(keymap-global-set "M-<down>" 'my-next-line)

(keymap-global-set "M-S" 'my-mark-isearch-forward)
(keymap-global-set "M-R" 'my-mark-isearch-backward)

(keymap-global-set "C-," 'backward-delete-char-untabify)
(keymap-global-set "C-." 'backward-kill-sentence)

(keymap-global-set "C-<tab>" 'other-window)
(keymap-global-set "H-o"     'other-window)

(keymap-global-set "H-1" 'delete-other-windows)
(keymap-global-set "H-2" 'split-window-below)
(keymap-global-set "H-3" 'split-window-right)
(keymap-global-set "H-0" 'delete-window)

(keymap-global-set "H-<up>"      'shrink-window)
(keymap-global-set "H-<left>"    'shrink-window-horizontally)
(keymap-global-set "H-<down>"    'enlarge-window)
(keymap-global-set "H-<right>"   'enlarge-window-horizontally)
(keymap-global-set "H-S-<up>"    'my-shrink-v5)
(keymap-global-set "H-S-<left>"  'my-shrink-h5)
(keymap-global-set "H-S-<down>"  'my-enlarge-v5)
(keymap-global-set "H-S-<right>" 'my-enlarge-h5)
(keymap-global-set "C-H-<up>"    'my-shrink-v10)
(keymap-global-set "C-H-<left>"  'my-shrink-h10)
(keymap-global-set "C-H-<down>"  'my-enlarge-v10)
(keymap-global-set "C-H-<right>" 'my-enlarge-h10)

(keymap-global-set "H-b"         'switch-to-buffer)
(keymap-global-set "H-B"         'list-buffers)

(keymap-global-set "H-c"  'compile)
(keymap-global-set "H-C"  'recompile)
(keymap-global-set "H-f"  'find-file)
(keymap-global-set "H-r"  'rename-buffer)
(keymap-global-set "H-k"  'kill-current-buffer)

(keymap-global-set "<f1>" 'shell)
(keymap-global-set "<f2>" 'rgrep)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(color-theme-sanityinc-solarized monokai-theme color-theme-sanityinc-tomorrow solarized-theme modus-themes ample-theme spacemacs-theme doom-themes dracula-theme magit))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans Mono" :foundry "GOOG" :slant normal :weight regular :height 120 :width normal)))))
