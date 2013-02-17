;;; goto-last-change.el --- Move point to (and mark) last change
;; Copyright (C) 2013  SlimTim10

;; Author: SlimTim10 <slimtim10@gmail.com>
;; Created: 17 Feb 2013

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(provide 'goto-last-change)

(defun goto-last-change ()
  (interactive)
  (if (stringp (car-safe (cadr buffer-undo-list))) ; Last change was deletion
      (goto-char (abs (cdr-safe (cadr buffer-undo-list)))) ; Go to the position of the deletion (last change)
    (progn
      (goto-char (abs (car-safe (cadr buffer-undo-list)))) ; Go to the start of the last change
      (set-mark-command nil) ; Activate the mark
      (goto-char (abs (cdr-safe (cadr buffer-undo-list))))))) ; Go to the end of the last change

(defun goto-last-change-no-mark ()
  (interactive)
  (if (stringp (car-safe (cadr buffer-undo-list))) ; Last change was deletion
      (goto-char (abs (cdr-safe (cadr buffer-undo-list)))) ; Go to the position of the deletion (last change)
      (goto-char (abs (cdr-safe (cadr buffer-undo-list)))))) ; Go to the end of the last change

;; (global-set-key (kbd "C-x C-.") 'goto-last-change)
