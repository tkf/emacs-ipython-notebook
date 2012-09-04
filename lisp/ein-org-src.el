;;; ein-org-src.el --- Notebook mode using org-src.el

;; Copyright (C) 2012 Takafumi Arakaki

;; Author: Takafumi Arakaki <aka.tkf at gmail.com>

;; This file is NOT part of GNU Emacs.

;; ein-org-src.el is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; ein-org-src.el is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with ein-org-src.el.
;; If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'org-src)

(require 'ein-worksheet)

(defun ein:org-src-fontify (limit)
  (ein:log-ignore-errors
    (ein:org-src-fontify-1 limit)))

(defun ein:org-src-fontify-1 (limit)
  (ein:and-let* ((node (ein:worksheet-get-nearest-cell-ewoc-node (point) limit))
                 (cell (ein:worksheet-next-input-cell node))
                 (start (ein:cell-input-pos-min cell))
                 (end   (ein:cell-input-pos-max cell))
                 (lang (ein:cell-language cell)))
    (org-src-font-lock-fontify-block lang start end)))

(defvar ein:org-src-font-lock-keywords
  '(ein:org-src-fontify)
  "Default `font-lock-keywords' for `ein:notebook-org-src-mode'.")

(defun ein:org-src-set-font-lock-defaults ()
  (set (make-local-variable 'font-lock-defaults)
       '(ein:org-src-font-lock-keywords)))

(provide 'ein-org-src)

;;; ein-org-src.el ends here
