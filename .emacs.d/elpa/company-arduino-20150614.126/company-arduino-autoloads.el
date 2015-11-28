;;; company-arduino-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "company-arduino" "company-arduino.el" (22083
;;;;;;  27423 844516 648000))
;;; Generated autoloads from company-arduino.el

(autoload 'company-arduino-append-include-dirs "company-arduino" "\
Append Arduino's include directoreis to ORIGINAL.
If you set non-nil to ONLY-DIRS, the return value is appended
`company-arduino-includes-dirs'  Otherwise, it appends `irony-arduino-includes-options'.

\(fn ORIGINAL &optional ONLY-DIRS)" nil nil)

(autoload 'company-arduino-sketch-directory-p "company-arduino" "\
Check whether current directory is in sketch directory or not.

\(fn)" nil nil)

(autoload 'company-arduino-turn-on "company-arduino" "\
Enable advice for `irony--adjust-compile-options' to add arduino's specific options.

\(fn)" nil nil)

(autoload 'company-arduino-turn-off "company-arduino" "\
Disable advice for `irony--adjust-compile-options' of company-arduino.el.

\(fn)" nil nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; company-arduino-autoloads.el ends here
