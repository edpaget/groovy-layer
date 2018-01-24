;;; packages.el --- groovy layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: edwardpaget <edwardpaget@antigone>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `groovy-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `groovy/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `groovy/pre-init-PACKAGE' and/or
;;   `groovy/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

;;; packages.el --- groovy layer packages File for Spacemacs
;;; Commentary:
;;; Code:

(defconst groovy-packages
  '(groovy-mode
    smart-ops))

(eval-when-compile
  (require 'use-package nil t))

(defun groovy/init-groovy-mode ()
  (use-package groovy-mode
    :defer t
    :mode ("\\.groovy$" . groovy-mode)
    :config
    (progn
      (setq groovy-indent-offset 2)
      (setq groovy-home "/usr/bin/"))))

(defun groovy/post-init-smart-ops ()
  (use-package smart-ops
    :config
    (progn
      (add-hook 'groovy-mode-hook #'smart-ops-mode)

      (define-smart-ops-for-mode 'groovy-mode
        (smart-ops ":" "," :pad-before nil)
        (smart-ops-default-ops))

      (define-smart-ops-for-mode 'inferior-groovy-mode
        (smart-ops ":" "," :pad-before nil)
        (smart-ops-default-ops)))))
