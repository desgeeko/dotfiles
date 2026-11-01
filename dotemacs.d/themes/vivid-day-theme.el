;;; vivid-day-theme.el --- Thème clair, vif et contrasté -*- lexical-binding: t; -*-

;; Auteur: Vous
;; Version: 1.0
;; Package-Requires: ((emacs "26.1"))

;;; Commentary:
;; Thème clair basé sur un fond papier chaud et une palette d'accents
;; saturés (rouge, orange, ambre, vert, sarcelle, bleu, violet, magenta)
;; pour un contraste marqué sur la coloration syntaxique.
;;
;; Installation :
;;   1. Copier ce fichier dans un dossier présent dans `custom-theme-load-path'
;;      (par ex. ~/.emacs.d/themes/)
;;   2. Ajouter dans votre config :
;;        (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;        (load-theme 'vivid-day t)

;;; Code:

(deftheme vivid-day
  "Thème clair, vif et contrasté.")

(let* (;; -- Fond / structure --------------------------------------------
       (bg-main     "#fdf9f0")  ; fond principal (papier chaud)
       (bg-alt      "#f3ecdb")  ; fond secondaire (fringe, mode-line inactive)
       (bg-hl       "#f7f0dc")  ; ligne courante
       (bg-select   "#ffe8a3")  ; sélection / region
       (border      "#d9cdb0")

       ;; -- Texte ---------------------------------------------------------
       (fg-main     "#22223b")  ; texte principal (encre foncée)
       (fg-dim      "#6b6f7b")  ; texte atténué (commentaires)
       (fg-faint    "#938b75")  ; numéros de ligne, séparateurs

       ;; -- Accents vifs (assombris pour un contraste WCAG AA >= 4.5:1) ---
       (red         "#de201b")
       (orange      "#b2590a")
       (amber       "#986800")
       (green       "#30821d")
       (teal        "#0e7f73")
       (blue        "#1665d8")
       (purple      "#8a2be2")
       (magenta     "#d6206c")
       (crimson     "#be123c"))

  (custom-theme-set-faces
   'vivid-day

   ;; ---- Faces de base ------------------------------------------------
   `(default ((t (:background ,bg-main :foreground ,fg-main))))
   `(cursor ((t (:background ,red))))
   `(fringe ((t (:background ,bg-alt))))
   `(vertical-border ((t (:foreground ,border))))
   `(border ((t (:foreground ,border))))
   `(region ((t (:background ,bg-select :foreground ,fg-main))))
   `(secondary-selection ((t (:background ,bg-alt))))
   `(highlight ((t (:background ,bg-select))))
   `(hl-line ((t (:background ,bg-hl))))
   `(shadow ((t (:foreground ,fg-faint))))

   ;; ---- Numéros de ligne ---------------------------------------------
   `(line-number ((t (:foreground ,fg-faint :background ,bg-main))))
   `(line-number-current-line ((t (:foreground ,fg-main :background ,bg-hl :weight bold))))

   ;; ---- Minibuffer / echo ---------------------------------------------
   `(minibuffer-prompt ((t (:foreground ,blue :weight bold))))
   `(echo-area ((t (:background ,bg-main :foreground ,fg-main))))

   ;; ---- Mode-line -------------------------------------------------------
   `(mode-line ((t (:background ,fg-main :foreground ,bg-main :box nil))))
   `(mode-line-inactive ((t (:background ,bg-alt :foreground ,fg-dim :box nil))))
   `(mode-line-buffer-id ((t (:weight bold))))
   `(header-line ((t (:background ,bg-alt :foreground ,fg-main :weight bold))))

   ;; ---- Recherche -------------------------------------------------------
   `(isearch ((t (:background ,red :foreground ,bg-main :weight bold))))
   `(lazy-highlight ((t (:background ,amber :foreground ,fg-main))))
   `(isearch-fail ((t (:background ,red :foreground ,bg-main))))

   ;; ---- Parenthèses -------------------------------------------------------
   `(show-paren-match ((t (:background ,teal :foreground ,bg-main :weight bold))))
   `(show-paren-mismatch ((t (:background ,red :foreground ,bg-main :weight bold))))

   ;; ---- Liens / boutons -------------------------------------------------
   `(link ((t (:foreground ,blue :underline t))))
   `(link-visited ((t (:foreground ,purple :underline t))))
   `(button ((t (:foreground ,blue :underline t))))

   ;; ---- Messages -------------------------------------------------------
   `(success ((t (:foreground ,green :weight bold))))
   `(warning ((t (:foreground ,amber :weight bold))))
   `(error ((t (:foreground ,red :weight bold))))

   ;; ---- Font-lock (coloration syntaxique) -------------------------------
   `(font-lock-comment-face ((t (:foreground ,fg-dim :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,fg-dim :slant italic))))
   `(font-lock-doc-face ((t (:foreground ,teal :slant italic))))
   `(font-lock-string-face ((t (:foreground ,teal))))
   `(font-lock-keyword-face ((t (:foreground ,purple :weight bold))))
   `(font-lock-builtin-face ((t (:foreground ,magenta))))
   `(font-lock-function-name-face ((t (:foreground ,blue :weight bold))))
   `(font-lock-variable-name-face ((t (:foreground ,crimson))))
   `(font-lock-constant-face ((t (:foreground ,orange :weight bold))))
   `(font-lock-type-face ((t (:foreground ,crimson :weight bold))))
   `(font-lock-warning-face ((t (:foreground ,red :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,red :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,magenta))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,amber :weight bold))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,orange :weight bold))))

   ;; ---- Whitespace-mode -------------------------------------------------
   `(whitespace-space ((t (:foreground ,fg-faint))))
   `(whitespace-tab ((t (:foreground ,fg-faint))))
   `(whitespace-trailing ((t (:background ,red :foreground ,bg-main))))
   `(whitespace-line ((t (:background ,bg-alt))))

   ;; ---- Org-mode (essentiel) --------------------------------------------
   `(org-level-1 ((t (:foreground ,blue :weight bold :height 1.2))))
   `(org-level-2 ((t (:foreground ,purple :weight bold :height 1.1))))
   `(org-level-3 ((t (:foreground ,teal :weight bold))))
   `(org-level-4 ((t (:foreground ,magenta :weight bold))))
   `(org-todo ((t (:foreground ,red :weight bold))))
   `(org-done ((t (:foreground ,green :weight bold))))
   `(org-link ((t (:foreground ,blue :underline t))))
   `(org-block ((t (:background ,bg-alt :extend t))))
   `(org-code ((t (:foreground ,crimson :background ,bg-alt))))
   `(org-date ((t (:foreground ,teal :underline t))))

   ;; ---- Diff / Magit (essentiel) -----------------------------------------
   `(diff-added ((t (:foreground ,green :background nil))))
   `(diff-removed ((t (:foreground ,red :background nil))))
   `(diff-changed ((t (:foreground ,amber :background nil))))
   `(magit-diff-added ((t (:foreground ,green))))
   `(magit-diff-removed ((t (:foreground ,red))))
   `(magit-branch-local ((t (:foreground ,blue :weight bold))))
   `(magit-branch-remote ((t (:foreground ,teal :weight bold))))
   `(magit-section-heading ((t (:foreground ,purple :weight bold))))

   ;; ---- Company / complétion --------------------------------------------
   `(company-tooltip ((t (:background ,bg-alt :foreground ,fg-main))))
   `(company-tooltip-selection ((t (:background ,bg-select))))
   `(company-tooltip-common ((t (:foreground ,blue :weight bold))))
   `(company-scrollbar-bg ((t (:background ,bg-alt))))
   `(company-scrollbar-fg ((t (:background ,fg-faint))))

   ;; ---- Ivy / Vertico -----------------------------------------------------
   `(ivy-current-match ((t (:background ,bg-select :weight bold))))
   `(ivy-minibuffer-match-face-1 ((t (:foreground ,blue))))
   `(vertico-current ((t (:background ,bg-select :weight bold))))
   ))

(provide-theme 'vivid-day)

;;; vivid-day-theme.el ends here
