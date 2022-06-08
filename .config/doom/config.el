;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Alok Shandilya"
      user-mail-address "alok.shandilya10@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrains Mono Nerd Font" :size 20 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 20)
      doom-unicode-font (font-spec :family "JetBrains Mono Nerd Font" :size 20)
      doom-big-font (font-spec :family "JetBrains Mono Nerd Font" :size 26))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(after! doom-themes
  (remove-hook 'doom-load-theme-hook #'doom-themes-neotree-config))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;; doom-themes
;;
;;(setq doom-theme 'doom-tomorrow-night)
;;(setq doom-theme 'doom-solarized-dark-high-contrast)
;;
;; gruvbox material
(setq doom-gruvbox-dark-variant "hard")
;; `gruvbox-material' contrast and palette options
(setq doom-gruvbox-material-background  "hard"  ; medium, hard (defaults to soft)
     doom-gruvbox-material-palette     "material")    ; mix or original (defaults to material)

;; `gruvbox-material-light' contrast and palette options
;;(setq doom-gruvbox-material-light-background  "medium" ; or hard (defaults to soft)
;;      doom-gruvbox-material-light-palette     "mix") ; or original (defaults to material)
(setq doom-theme 'doom-gruvbox-material) ; dark variant
;;(setq doom-theme 'doom-gruvbox-material-light) ; light variant

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; dashboard
(use-package dashboard
  :init
  (dashboard-setup-startup-hook)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "Welcome Alok ! 👋 💻 ")
  ;;(setq dashboard-banner-logo-title "\n\t\t\t\t\t\t\t\t\t\t-> KEYBINDINGS:\
  ;;\n\t\t\t\t\t\t\t\t\t\tFind file               (SPC .)     \
  ;; Open buffer list    (SPC b i)\
  ;; \n\t\t\t\t\t\t\t\t\t\tFind recent files       (SPC f r)   \
  ;; Open the eshell     (SPC e s)\
  ;; \n\t\t\t\t\t\t\t\t\t\tOpen dired file manager (SPC d d)   \
  ;; List of keybindings (SPC h b b)")
  ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
  (setq dashboard-startup-banner "~/.config/doom/doom-emacs-dash.png")  ;; use custom image as banner
  ;;(setq dashboard-startup-banner "~/.config/doom/me-gruv-circle.png")  ;; use custom image as banner
  (setq dashboard-center-content t) ;; set to 't' for centered content
  (setq dashboard-items '((projects . 3)
                          (recents . 5)
                          (agenda . 2)
                          (bookmarks . 2)))
                          ;;(registers . 3)))
  :config
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book"))))
(setq doom-fallback-buffer-name "*dashboard*")
;;(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))


;; global beacon minor-mode
(use-package! beacon)
(after! beacon (beacon-mode 1))
