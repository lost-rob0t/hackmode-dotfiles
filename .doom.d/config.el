;; [[file:config.org::+BEGIN_SRC emacs-lisp][No heading:1]]
;; -*- lexical-binding: t -*-
;; No heading:1 ends here

;; [[file:config.org::*Theme][Theme:1]]
(setq doom-theme 'doom-outrun-electric)
;; Theme:1 ends here

;; [[file:config.org::*Line numbers][Line numbers:1]]
(setq display-line-numbers-type t)
;; Line numbers:1 ends here

;; [[file:config.org::*Magit][Magit:1]]
(map! :leader
      :desc "Push Current branch to remote branch"
      "g p P" #'magit-push-current-to-pushremote)
;; Magit:1 ends here

;; [[file:config.org::*Magit][Magit:2]]
(map! :leader
      :desc "Pull current branch from remote"
      "g p p" #'magit-pull-from-pushremote)
;; Magit:2 ends here

;; [[file:config.org::*Projectile][Projectile:1]]
(setq projectile-project-search-path
      '(("~/Documents/Projects" . 1)))
;; Projectile:1 ends here

;; [[file:config.org::*Org Mode][Org Mode:1]]
(setq org-directory "~/Documents/Notes/org")
;; Org Mode:1 ends here

;; [[file:config.org::*Org Agenda views][Org Agenda views:1]]
(map! :leader
      :desc "Switch to week view"
      "o a w" #'org-agenda-week-view)

(map! :leader
      :desc "switch to month view"
      "o a m" #'org-agenda-month-view)

(map! :leader
      :desc "switch to month view"
      "o a y" #'org-agenda-year-view)
;; Org Agenda views:1 ends here

;; [[file:config.org::*Babel][Babel:1]]
(map! :leader
          :desc "Tangle a file"
          "b t" #'org-babel-tangle)
;; Babel:1 ends here

;; [[file:config.org::*Babel][Babel:2]]
(map! :leader
      :desc "Babel execute selected source block"
      "c b" #'org-babel-execute-src-block)
;; Babel:2 ends here

;; [[file:config.org::*Babel][Babel:3]]
(map! :leader
      :desc "Babel execute buffer"
      "c B" #'org-babel-execute-buffer)
;; Babel:3 ends here

;; [[file:config.org::*Babel][Babel:4]]
(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t) (org . t) (nim . t) (python . t) (erlang . t) (ein . t)))
;; Babel:4 ends here

;; [[file:config.org::*Org Tempo templates][Org Tempo templates:1]]
(with-eval-after-load 'org
  ;; This is needed as of Org 9.2
  (require 'org-tempo)
  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("nim" . "src nim"))
  (add-to-list 'org-structure-template-alist '("erl" . "src erlang"))
  (add-to-list 'org-structure-template-alist '("ss" . "src scheme"))
  (add-to-list 'org-structure-template-alist '("cl" . "src common-lisp")))
;; Org Tempo templates:1 ends here

;; [[file:config.org::*Org Wiki][Org Wiki:2]]
(setq org-wiki-location-list
      '("~/Documents/Notes/org/org-wiki/" "~/Documents/Notes/org/hacker-wiki/"))
(setq org-wiki-location (car org-wiki-location-list))
;; Org Wiki:2 ends here

;; [[file:config.org::*Org Wiki][Org Wiki:3]]
(setq org-wiki-backup-location "~/.backups/")
;; Org Wiki:3 ends here

;; [[file:config.org::*Org Wiki][Org Wiki:4]]
(setq org-wiki-close-root-switch t)
;; Org Wiki:4 ends here

;; [[file:config.org::*Org Wiki][Org Wiki:5]]
(map! :leader
      (:prefix-map ("n" . "notes")
       (:prefix ("w" . "wiki")
        :desc "New Wiki Page" "n"  #'org-wiki-new
        :desc "Switch Wiki root" "S" #'org-wiki-switch-root
        :desc "Back up wiki" "B" #'org-wiki-backup-make
        :desc "open Wiki root in dired" "o" #'org-wiki-dired
        :desc "open Wiki root  with the system file editor" "O" #'org-wiki-open
        :desc "open wiki panel" "p" #'org-wiki-panel)))
;; Org Wiki:5 ends here

;; [[file:config.org::*Org Wiki][Org Wiki:6]]
;;(map!
;; :after org
;; :map org-mode-map
;; :localleader
;; :nv "w n" #'org-wki-insert-new)
;; Org Wiki:6 ends here

;; [[file:config.org::*Yasnippet][Yasnippet:1]]
(map! :leader
      :desc "Add a neew template to yasnippet"
      "a y s" #'+snippets/new)
;; Yasnippet:1 ends here

;; [[file:config.org::*Yasnippet][Yasnippet:2]]
(map! :leader
      :desc "Edit template"
      "a y e" #'+snippets/find)
;; Yasnippet:2 ends here

;; [[file:config.org::*Deft][Deft:1]]
(setq deft-extenstions '("txt", "org", "md"))
(setq deft-directory "~/Documents/Notes")
;; Deft:1 ends here

;; [[file:config.org::*Deft][Deft:2]]
(setq deft-recursive t)
;; Deft:2 ends here

;; [[file:config.org::*Deft][Deft:3]]
(setq deft-use-filename-as-title t)
;; Deft:3 ends here

;; [[file:config.org::*Notifications][Notifications:1]]
(require 'notifications)
;; Notifications:1 ends here

;; [[file:config.org::*RSS (Elfeed)][RSS (Elfeed):1]]
(require 'elfeed-org)
;; RSS (Elfeed):1 ends here

;; [[file:config.org::*RSS (Elfeed)][RSS (Elfeed):2]]
(elfeed-org)
;; RSS (Elfeed):2 ends here

;; [[file:config.org::*RSS (Elfeed)][RSS (Elfeed):3]]
(setq rmh-elfeed-org-files '("~/Documents/Notes/org/rss.org"))
;; RSS (Elfeed):3 ends here

;; [[file:config.org::*Webpaste][Webpaste:1]]
(require 'webpaste)
;; Webpaste:1 ends here

;; [[file:config.org::*Webpaste][Webpaste:2]]
(setq webpaste-paste-confirmation t)
;; Webpaste:2 ends here

;; [[file:config.org::*Webpaste][Webpaste:3]]
(setq webpaste-provider-priority '("ix.io" "dpaste.org"
                                   "dpaste.com" "clbin.com"
                                   "0x0.st" "bpa.st"
                                   "paste.rs"))
;; Webpaste:3 ends here

;; [[file:config.org::*Webpaste][Webpaste:4]]
(map! :leader
      (:prefix-map ("n" . "notes")
       (:prefix ("p" . "webpaste")
        :desc "paste region to a paste service" "r" #'webpaste-paste-region
        :desc "paste entire buffer to paste service" "b" #'webpaste-paste-buffer)))
;; Webpaste:4 ends here

;; [[file:config.org::*Pcap mode][Pcap mode:1]]
(require 'pcap-mode)
;; Pcap mode:1 ends here

;; [[file:config.org::*Python][Python:1]]
(setq python-ident-offset 4)
;; Python:1 ends here

;; [[file:config.org::*Performance][Performance:1]]
(explain-pause-mode nil)
;; Performance:1 ends here

;; [[file:config.org::*Enviroment][Enviroment:1]]
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;; Enviroment:1 ends here

;; [[file:config.org::*Url proxy][Url proxy:1]]
(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
     ("http" . "*.i2p:4444")))
;; Url proxy:1 ends here
