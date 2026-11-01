;;; paris-je-theme.el --- An ode to the colors of Paris -*- lexical-binding: t; -*-

;; Copyright (c) 2026 Martin D. <desgeeko@gmail.com>

;; Author: Martin D.
;; Version: 0.1
;; Package-Requires: ((emacs "26.1"))
;; URL: https://github.com/desgeeko/paris-je-theme

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; A personal interpretation of Parisian muted colors:
;; limestone ("pierre de Paris") facade, zinc,
;; slate, copper ("vert-de-gris") and gold rooftops,
;; terracotta chimney pots, and last but nos least
;; the distinctive blue-and-green street signs.
;;
;; Installation :

;;   1. Copy this file inside your themes folder (for example ~/.emacs.d/themes/)
;;   2. Use this path - if not already - in your your config and load the theme: 
;;        (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;        (load-theme 'paris-je t)

;;; Code:

(deftheme paris-je
  "An ode to the colors of Paris.")

(let* (
       (stoned     "#827565")  
       (stone      "#c9bba4")  
       (stonel     "#e6ddcc")  

       (greyd      "#202020")
       (grey       "#5a5a5a")
       (greyl      "#7a7a7a")
       
       (zincd      "#616a70")
       (zinc       "#7d8c96")
       (zincl      "#b5bdc3")
       
       (slate      "#464b52")
       (copper     "#508278")
       (gold       "#daa520")
       
       (terracotta "#a55f41")
       
       (white      "#eeeeee")
       (blue       "#003b5c")
       (sky        "#afc4d6")
       (green      "#1f4a3a")
       (red        "#de201b")

       (bg-main     stonel)
       (bg-alt      stone)
       (bg-hl       stonel)
       (bg-select   white)
       (fg-main     greyd) 
       (fg-dim      greyl) 
       (fg-faint    zincl))

  (custom-theme-set-faces
   'paris-je

   ;; ---- Faces de base ------------------------------------------------
   `(default ((t (:background ,bg-main :foreground ,fg-main))))
   `(cursor ((t (:background ,gold))))
   `(fringe ((t (:background ,stone))))
   `(vertical-border ((t (:foreground ,white))))
   `(border ((t (:foreground ,white))))
   `(region ((t (:background ,bg-select :foreground ,fg-main))))
   `(secondary-selection ((t (:background ,bg-alt))))
   `(highlight ((t (:background ,bg-select))))
   `(hl-line ((t (:background bg-hl))))
   `(shadow ((t (:foreground ,fg-faint))))

   ;; ---- Numéros de ligne ---------------------------------------------
   `(line-number ((t (:foreground ,white :background ,stone))))
   `(line-number-current-line ((t (:foreground ,white :background ,gold :weight bold))))

   ;; ---- Minibuffer / echo ---------------------------------------------
   `(minibuffer-prompt ((t (:foreground ,blue :weight bold))))
   `(echo-area ((t (:background ,bg-main :foreground ,fg-main))))

   ;; ---- Mode-line -------------------------------------------------------
   `(mode-line ((t (:background ,blue :foreground ,white :box (:line-width 4 :color ,green)))))
   `(mode-line-inactive ((t (:background ,bg-alt :foreground ,fg-dim :box (:line-width 4 :color ,bg-alt)))))
   `(mode-line-buffer-id ((t (:weight bold :foreground ,white))))
   `(header-line ((t (:background ,bg-alt :foreground ,fg-main :weight bold))))

   ;; ---- Recherche -------------------------------------------------------
   `(isearch ((t (:background ,red :foreground ,bg-main :weight bold))))
   `(lazy-highlight ((t (:background ,terracotta :foreground ,fg-main))))
   `(isearch-fail ((t (:background ,red :foreground ,bg-main))))

   ;; ---- Parenthèses -------------------------------------------------------
   `(show-paren-match ((t (:background ,copper :foreground ,bg-main :weight bold))))
   `(show-paren-mismatch ((t (:background ,red :foreground ,bg-main :weight bold))))

   ;; ---- Liens / boutons -------------------------------------------------
   `(link ((t (:foreground ,blue :underline t))))
   `(link-visited ((t (:foreground ,zinc :underline t))))
   `(button ((t (:foreground ,blue :underline t))))

   ;; ---- Messages -------------------------------------------------------
   `(success ((t (:foreground ,green :weight bold))))
   `(warning ((t (:foreground ,terracotta :weight bold))))
   `(error ((t (:foreground ,red :weight bold))))

   ;; ---- Font-lock (coloration syntaxique) -------------------------------
   `(font-lock-comment-face ((t (:foreground ,stoned :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,stoned :slant italic))))
   `(font-lock-doc-face ((t (:foreground ,stoned :slant italic))))
   `(font-lock-string-face ((t (:foreground ,zincd))))
   `(font-lock-keyword-face ((t (:foreground ,slate))))
   `(font-lock-builtin-face ((t (:foreground ,zincd))))
   `(font-lock-operator-face ((t (:foreground ,grey))))
   `(font-lock-function-name-face ((t (:foreground ,terracotta))))
   `(font-lock-variable-name-face ((t (:foreground ,greyd))))
   `(font-lock-constant-face ((t (:foreground ,copper))))
   `(font-lock-number-face ((t (:foreground ,terracotta :weight bold))))
   `(font-lock-type-face ((t (:foreground ,terracotta))))
   `(font-lock-warning-face ((t (:foreground ,red :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,red :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,green))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,terracotta :Weight bold))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,terracotta :weight bold))))

   ;; ---- Whitespace-mode -------------------------------------------------
   `(whitespace-space ((t (:foreground ,fg-faint))))
   `(whitespace-tab ((t (:foreground ,fg-faint))))
   `(whitespace-trailing ((t (:background ,red :foreground ,bg-main))))
   `(whitespace-line ((t (:background ,bg-alt))))))

(provide-theme 'paris-je)

;;; paris-je-theme.el ends here
