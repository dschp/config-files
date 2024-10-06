(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(setq magit-define-global-key-bindings 'recommended)

(setq inhibit-startup-screen t)

(setq frame-resize-pixelwise t)
(scroll-bar-mode 0)
(column-number-mode 1)


(defun my-toggle-line-numbers ()
  (interactive)
  (setq display-line-numbers
	(if (eq nil display-line-numbers) 'relative nil)))

(defun my-change-window-size (func vh size)
  (if (= size 0) (message "Invalid Size: 0")
    (let ((es (if (> size 0) "Enlarge" "Shrink")))
      (message "%s %s by %d" es vh (abs size))
      (funcall func size))))

(defun my-change-window-size-v (size)
  (interactive "NChange window size vertically: ")
  (my-change-window-size 'enlarge-window "vertically" size))

(defun my-change-window-size-h (size)
  (interactive "NChange window size horizontally: ")
  (my-change-window-size 'enlarge-window-horizontally "horizontally" size))

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

(defun my-transpose-line-forward (arg)
  (interactive "p")
  (next-line)
  (transpose-lines arg)
  (previous-line))
(defun my-transpose-line-backward (arg)
  (interactive "p")
  (next-line)
  (transpose-lines (- arg))
  (previous-line))

(defun my-duplicate-dwim (arg)
  (interactive "p")
  (duplicate-dwim arg)
  (next-line))
(defun my-duplicate-line (arg)
  (interactive "p")
  (duplicate-line arg)
  (next-line))


(keymap-global-set "M-z" 'backward-delete-char-untabify)
(keymap-global-set "M-Z" 'delete-char)
(keymap-global-set "M-o" 'my-duplicate-dwim)
(keymap-global-set "M-O" 'my-duplicate-line)

(keymap-global-set "M-p"      'backward-paragraph)
(keymap-global-set "M-n"      'forward-paragraph)
(keymap-global-set "M-<up>"   'my-transpose-line-backward)
(keymap-global-set "M-<down>" 'my-transpose-line-forward)
(keymap-global-set "M-["      'my-transpose-line-backward)
(keymap-global-set "M-]"      'my-transpose-line-forward)
(keymap-global-unset "M-{")
(keymap-global-unset "M-}")

(keymap-global-unset "C-z")

(keymap-global-set "C-z s"    'my-mark-forward-until)
(keymap-global-set "C-z r"    'my-mark-backward-until)
(keymap-global-set "C-z C-s"  'my-mark-forward-to)
(keymap-global-set "C-z C-r"  'my-mark-backward-to)

(keymap-global-set "C-<tab>"   'other-window)
(keymap-global-set "C-z <tab>" 'my-switch-to-previous-buffer)
(keymap-global-set "C-z b"     'buffer-menu)
(keymap-global-set "C-z C-b"   'buffer-menu)
(keymap-global-set "C-z n"     'my-toggle-line-numbers)

(keymap-global-set "C-z 2" 'my-change-window-size-v)
(keymap-global-set "C-z 3" 'my-change-window-size-h)

(keymap-global-set "C-z c"   'compile)
(keymap-global-set "C-z C-c" 'recompile)
(keymap-global-set "C-z R"   'rename-buffer)
(keymap-global-set "C-z k"   'kill-current-buffer)

(keymap-global-set "C-z w"   'whitespace-mode)

(keymap-global-set "C-M-;"   'scroll-other-window-down)
(keymap-global-set "C-M-'"   'scroll-other-window)
(keymap-global-set "C-M-:"   'beginning-of-buffer-other-window)
(keymap-global-set "C-M-\""  'end-of-buffer-other-window)

(keymap-global-set "<f1>" 'shell)
(keymap-global-set "<f2>" 'org-agenda)


(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load-theme 'doom-nord t)

(defun colorize-compilation-buffer ()
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region (point-min) (point-max))))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
