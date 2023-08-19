;; Credit: https://systemcrafters.net/publishing-websites-with-org-mode/building-the-site/

;; Load the publishing system
(require 'ox-publish)

;; Load the package manager
(require 'package)

;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialise the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "public-org-blog"
             :recursive t
             :base-directory "./content"
             :publishing-directory "./public"
             :publishing-function 'org-html-publish-to-html
             :author "Scott J. Crouch"
             :email "scott j crouch at jee male"
             :with-author nil           ;; Omit author name
             :with-creator t            ;; Include Emacs and Org versions in footer
             :with-toc t                ;; Include a table of contents
             :section-numbers nil       ;; Omit section numbers
             :time-stamp-file nil       ;; Omit time stamp
             )))

;; Customise the HTML output
(setq org-html-validation-link nil            ;; Omit the "validate" link at the bottom
      org-html-head-include-scripts nil       ;; Use our own scripts in lieu of defaults
      org-html-head-include-default-style nil ;; Use our own CSS in lieu of defaults
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

;; Generate the project output
(org-publish-all t)

(message "Build complete!")
