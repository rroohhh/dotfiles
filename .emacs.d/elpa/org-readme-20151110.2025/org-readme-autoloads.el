;;; org-readme-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "org-readme" "org-readme.el" (22083 27372 959950
;;;;;;  43000))
;;; Generated autoloads from org-readme.el

(autoload 'org-readme-gen-info "org-readme" "\
With the proper tools, generates an info and dir from the current readme.org

\(fn)" t nil)

(autoload 'org-readme-sync "org-readme" "\
Syncs Readme.org with current buffer.
When COMMENT-ADDED is non-nil, the comment has been added and the syncing should begin.

\(fn &optional COMMENT-ADDED)" t nil)

(autoload 'org-readme-to-commentary "org-readme" "\
Change Readme.org to a Commentary section.

\(fn)" t nil)

(autoload 'org-readme-top-header-to-readme "org-readme" "\
This puts the top header into the Readme.org file as Library Information

\(fn)" t nil)

(autoload 'org-readme-changelog-to-readme "org-readme" "\
This puts the emacs lisp change-log into the Readme.org file.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("org-readme-pkg.el") (22083 27372 976322
;;;;;;  307000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; org-readme-autoloads.el ends here
