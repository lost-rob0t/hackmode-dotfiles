;; -*- lexical-binding: t -*-

;;; Package management

;; Please don't load outdated byte code (setq load-prefer-newer t)

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
      ;; Package archives
      '(("GNU ELPA" . "http://elpa.gnu.org/packages/") ("MELPA Stable" . "https://stable.melpa.org/packages/") ("MELPA" . "https://melpa.org/packages/"))
      ;; Prefer MELPA Stable over GNU over MELPA. IOW prefer MELPA's stable
      ;; packages over everything and only fall back to GNU or MELPA if ;; necessary.
      package-archive-priorities '(("MELPA Stable" . 10) ("GNU ELPA" . 5) ("MELPA" . 0))) (package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) (package-refresh-contents) (package-install 'use-package))

(eval-when-compile (require 'use-package))

(package! org-ql :recipe (:type git :host github :repo "alphapapa/org-ql"))

(package! org-timed-alerts :recipe (:type git :host github :repo "legalnonsense/org-timed-alerts"))

(package! org-download :recipe (:type git :host github :repo "abo-abo/org-download"))

(package! org-wiki :recipe (:type git :host github :repo "caiorss/org-wiki"))

(package! ox-hugo)

(package! org-present :recipe (:type git :host github :repo "rlister/org-present"))

(package! org-pomodoro)

(package! envrc :recipe (:type git :host github :repo "purcell/envrc"))

(package! flycheck-nim :recipe (:type git :host github :repo "ALSchwalm/flycheck-nim"))

(package! gforth.el :recipe (:type git :host github :repo "smtlaissezfaire/gforth.el"))

(package! nix-emacs :recipe (:type git :host github :repo "travisbhartwell/nix-emacs"))

(package! webpaste :recipe (:type git :host github :repo "etu/webpaste.el"))

(package! burly :recipe (:type git :host github :repo "alphapapa/burly.el"))

(package! podman.el :recipe (:type git :host github :repo "akirak/podman.el"))

(package! pcap-mode.el :recipe (:type git :host github :repo "orgcandman/pcap-mode"))

(package! exec-path-from-shell  :recipe (:type git :host github :repo "purcell/exec-path-from-shell"))

(package! cheat-sh :recipe (:type git :host github :repo "davep/cheat-sh.el"))

(package! activity-watch-mode :recipe (:type git :host github :repo "pauldub/activity-watch-mode"))

(package! discover :recipe (:type git :host github :repo "mickeynp/discover.el"))

(package! plz :recipe (:type git :host github :repo "alphapapa/plz.el"))

(package! ts :recipe (:type git :host github :repo "alphapapa/ts.el"))

(package! dash :recipe (:type git :host github :repo "magnars/dash.el"))

(package! alert :recipe (:type git :host github :repo "jwiegley/alert"))

(package! ement :recipe (:type git :host github :repo "alphapapa/ement.el"))

(package! mastodon :recipe (:type git :host codeberg :repo "martianh/mastodon.el"))

(package! inherit-org :recipe (:host github :repo "chenyanming/inherit-org"))

(package! dirvish :recipe (:host github :repo "alexluigit/dirvish"))

(package! ks-mode :recipe (:type git :host github :repo "jarpy/ks-mode"))
