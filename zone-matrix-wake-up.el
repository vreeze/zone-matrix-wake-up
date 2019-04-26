;;; zone-matrix-wake-up.el --- zone matrix screen saver -*- lexical-binding: t; -*-

;; Copyright (C) 2019 Pieter de Vreeze <mail@de-vreeze.com>

;; Author: Pieter de Vreeze <mail@de-vreeze.com>
;; URL: https://github.com/vreeze/zone-matrix-wakeup
;; Version: 0.0.1
;; Package-Requires:
;; Keywords: zone

;; This file is NOT part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING. If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; package --- Summary
;;; Commentary:
;; This is a zone/screen saver acting out the Matrix wake-up scene.

;;; Code:

(require 'zone)

(defgroup zone-matrix-wake-up nil
  "Zone out with the Matrix wake up scene."
  :group 'zone
  :prefix "zone-matrix-wake-up-")

(defvar zone-matrix-wake-up-msg ["Wake up, Neo..."
                    "The Matrix has you..."
                    "Follow the white rabbit."
                    "Knock, knock, Neo."] "The wake-up messages.")
                                            ;  W   a   k   e       u   p   ,       N   e   o   .   .    .
(defvar zone-matrix-wake-up-msg-char-delay [[100 300 200 300 100 100 300 100 100 200 200 50 200 100 10000]
                                            [400 300 200 400 400 150 300 200 100 100 100 200 100 300 300 100 200 200 200 200 6000]
                                            [100 150 100 75 75 100 125 100 120 100 110 100 80 100 75 100 120 110 100 100 100 100 100 8000]
                                            [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
                                            ] "The delay values for each character in miliseconds.")

(defface zone-matrix-wake-up-face
  '((t (:bold t :foreground "#1ec503")))
  "Matrix green."
  :group 'zone-matrix-wake-up)

;;;###autoload
(defun zone-pgm-matrix-wake-up ()
  "Zone out with the Matrix wake up scene."
  (delete-other-windows)
  (let ((msg-idx 0)
        (msg-nr 0))
    (sit-for 2)
    (while (< msg-nr (length zone-matrix-wake-up-msg))
      (setq msg-idx 0)
      (erase-buffer)
      (while (< msg-idx (length (elt zone-matrix-wake-up-msg msg-nr)))
        (let ((s (string (elt (elt zone-matrix-wake-up-msg msg-nr) msg-idx))))
          (put-text-property 0 1 'face 'zone-matrix-wake-up-face s)
          (insert s))
        (sit-for (/ (elt (elt zone-matrix-wake-up-msg-char-delay msg-nr) msg-idx) 1000.0))
        (setq msg-idx (1+ msg-idx)))
      (setq msg-nr (1+ msg-nr))))
  (sit-for 60))

;;;###autoload
(defun zone-matrix-wake-up ()
  "Zone out with the Matrix wake up scene."
  (interactive)
  (let ((zone-programs [zone-pgm-matrix-wake-up]))
    (zone)))

(provide 'zone-matrix-wake-up)
;;; zone-matrix-wake-up.el ends here
