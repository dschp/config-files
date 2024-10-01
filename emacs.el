(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(setq magit-define-global-key-bindings 'recommended)
(setq inhibit-startup-screen t)


(setq frame-resize-pixelwise t)
(toggle-frame-maximized)


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

(defun my-char-string (char)
  (cond
   ((eq char 32) "SPACE")
   ((eq char 40) "'('")
   ((eq char 41) "')'")
   (t (string char))))

(defun my-switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))

(defun my-mark-to-char (arg char movement)
  (when (and (> char 31) (< char 127))
    (let ((ma mark-active)
	  (cfs case-fold-search))
      (setq case-fold-search nil)
      (unless ma (set-mark-command nil))
      (if (search-forward (char-to-string char) nil t arg)
	  (progn
	    (message "Marked until %s (%d)" (my-char-string char) char)
	    (right-char movement))
	(message "Char %s (%d) not found" (my-char-string char) char)
	(unless ma (deactivate-mark)))
      (setq case-fold-search cfs))))

(defun my-mark-forward-to (arg char)
  (interactive "p\ncMark forward to: ")
  (my-mark-to-char arg char 0))

(defun my-mark-backward-to (arg char)
  (interactive "p\ncMark backward to: ")
  (my-mark-to-char (- arg) char 0))

(defun my-mark-forward-until (arg char)
  (interactive "p\ncMark forward until: ")
  (my-mark-to-char arg char -1))

(defun my-mark-backward-until (arg char)
  (interactive "p\ncMark backward until: ")
  (my-mark-to-char (- arg) char 1))


(keymap-global-set "M-<up>"   'my-previous-line)
(keymap-global-set "M-<down>" 'my-next-line)

(keymap-global-set "s-s" 'my-mark-forward-until)
(keymap-global-set "s-r" 'my-mark-backward-until)
(keymap-global-set "s-S" 'my-mark-forward-to)
(keymap-global-set "s-R" 'my-mark-backward-to)

(keymap-global-set "C-," 'backward-delete-char-untabify)
(keymap-global-set "C-." 'backward-kill-sentence)

(keymap-global-set "s-<tab>" 'my-switch-to-previous-buffer)
(keymap-global-set "s-b"     'buffer-menu)
(keymap-global-set "s-n"     'global-display-line-numbers-mode)

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

(keymap-global-set "H-b"  'switch-to-buffer)
(keymap-global-set "H-B"  'list-buffers)

(keymap-global-set "H-c"  'compile)
(keymap-global-set "H-C"  'recompile)
(keymap-global-set "H-f"  'find-file)
(keymap-global-set "H-r"  'rename-buffer)
(keymap-global-set "H-k"  'kill-current-buffer)

(keymap-global-set "H-a"  'org-agenda)

(keymap-global-set "<f1>" 'shell)
(keymap-global-set "<f2>" 'rgrep)


(column-number-mode 1)
(scroll-bar-mode 0)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

