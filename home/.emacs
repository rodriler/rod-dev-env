;; DOLORES .emacs initialization file

;; MAC adaptation: make cmd key do control 
(setq mac-command-modifier 'control); 

;;display tab characters as a multiple of 4 chars.
(setq default-tab-width 4)

;;insert spaces not tabs
;;https://www.emacswiki.org/emacs/NoTabs
(setq-default indent-tabs-mode nil)

;;disable file locks
;;https://www.gnu.org/software/emacs/manual/html_node/elisp/File-Locks.html
(setq create-lockfiles nil)

;;auto-save-visited!
;;http://ergoemacs.org/emacs/emacs_auto-save.html
;;http://pragmaticemacs.com/emacs/auto-save-and-backup-every-save/
(setq auto-save-default t)
(setq auto-save-visited-file-name t)
(setq auto-save-interval 20)


;;This will all place all auto-saves and backups in the directory pointed to by temporary-file-directory
;;Make sure it is called early, before opening the first file, eg. the default scratch.txt
;;Default is /var/folders/f3/<hash>
;;You can find the value with "C-h v temporary-file-directory"
(setq temporary-file-directory "~/Dropbox/tmp/emacs/")

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;basic configurations
(display-time)
;;(tool-bar-mode nil)
;;(menu-bar-mode -1)
;;(toggle-scroll-bar -1)
(setq-default line-number-mode t)
(setq-default column-number-mode t)

;;basic colors
(set-foreground-color "gray")
(set-background-color "black")
(set-cursor-color "red")
;;(set-face-italic-p 'region t)

;;(set-frame-font "Monaco 14")
;;(set-frame-font "Inconsolata 14")
;;(set-frame-font "Lucida 14")

;;font size: The value is in 1/10pt, so 100 will give you 10pt, etc.
(set-face-attribute 'default nil :height 150)

;; Visual feedback on selections
(setq-default transient-mark-mode t)

;; Always end a file with a newline
;;(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)


;; JDE SETUP

;; Set the debug option to enable a backtrace when a
;; problem occurs.
(setq debug-on-error t)

;; Update the Emacs load-path to include the path to
;; the JDE and its require packages. This code assumes
;; that you have installed the packages in the emacs/site
;; subdirectory of your home directory.
;;(add-to-list 'load-path (expand-file-name "/usr/local/emacs/site/jde-2.2.8/lisp"))
;; (add-to-list 'load-path (expand-file-name "/usr/local/emacs/site/jde-2.3.3/lisp"))
;; (add-to-list 'load-path (expand-file-name "/usr/local/emacs/site/semantic-1.4"))
;; (add-to-list 'load-path (expand-file-name "/usr/local/emacs/site/speedbar-0.14beta4"))
;; (add-to-list 'load-path (expand-file-name "/usr/local/emacs/site/eieio-0.17"))
;; (add-to-list 'load-path (expand-file-name "/usr/local/emacs/site/elib-1.0"))

;; HTML-MODE CONFIG

(add-hook 'html-mode-hook
        (lambda ()
          ;; Default indentation is usually 2 spaces, changing to 4.
          (set (make-local-variable 'sgml-basic-offset) 4)))

(add-hook 'html-mode-hook
              (lambda ()
                (setq indent-line-function 'indent-relative)))

;; KEEP THIS AT THE END
;get rid of splash screen and open default scratch
(setq inhibit-startup-message t) 

;; NOTICE symlink to start at PEL root both paths below are the same...
;;(find-file "~/scratch.txt")
;;(find-file "~/Dropbox/atrium/scratch.txt")
(find-file "~/pel/corsac/scratch.txt")
