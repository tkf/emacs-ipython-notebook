;;; ein-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ein:output-type-preference ein:slice-image ein:cell-autoexec-prompt
;;;;;;  ein:cell-max-num-outputs ein:cell-traceback-level) "ein-cell"
;;;;;;  "ein-cell.el" (20958 57459 626183 211000))
;;; Generated autoloads from ein-cell.el

(defvar ein:cell-traceback-level 1 "\
Number of traceback stack to show.
Hidden tracebacks are not discarded.  You can always view them
using the command `ein:notebook-view-traceback'.")

(custom-autoload 'ein:cell-traceback-level "ein-cell" t)

(defvar ein:cell-max-num-outputs nil "\
Number of maximum outputs to be shown by default.
To view full output, use `ein:notebook-show-in-shared-output'.")

(custom-autoload 'ein:cell-max-num-outputs "ein-cell" t)

(defvar ein:cell-autoexec-prompt "⚡" "\
String shown in the cell prompt when the auto-execution flag
is on.  See also `ein:connect-aotoexec-lighter'.")

(custom-autoload 'ein:cell-autoexec-prompt "ein-cell" t)

(defvar ein:slice-image nil "\
[EXPERIMENTAL] When non-`nil', use `insert-sliced-image' when
drawing images.  If it is of the form of ``(ROWS COLS)``, it is
passed to the corresponding arguments of `insert-sliced-image'.

.. FIXME: ROWS and COLS must be determined dynamically by measuring
   the size of iamge and Emacs window.

See also: https://github.com/tkf/emacs-ipython-notebook/issues/94")

(custom-autoload 'ein:slice-image "ein-cell" t)

(defvar ein:output-type-preference (if (and (fboundp 'shr-insert-document) (fboundp 'libxml-parse-xml-region)) #'ein:output-type-prefer-pretty-text-over-html '(emacs-lisp svg png jpeg text html latex javascript)) "\
Output types to be used in notebook.
First output-type found in this list will be used.
This variable can be a list or a function returning a list given
DATA plist.
See also `ein:output-type-prefer-pretty-text-over-html'.

**Example**:
If you prefer HTML type over text type, you can set it as::

    (setq ein:output-type-preference
          '(emacs-lisp svg png jpeg html text latex javascript))

Note that ``html`` comes before ``text``.")

(custom-autoload 'ein:output-type-preference "ein-cell" t)

;;;***

;;;### (autoloads (ein:complete-on-dot) "ein-completer" "ein-completer.el"
;;;;;;  (20958 57459 630183 212000))
;;; Generated autoloads from ein-completer.el

(defvar ein:complete-on-dot t "\
Start completion when inserting a dot.  Note that
`ein:use-auto-complete' (or `ein:use-auto-complete-superpack')
must be `t' to enable this option.  This variable has effect on
notebook buffers and connected buffers.")

(custom-autoload 'ein:complete-on-dot "ein-completer" t)

;;;***

;;;### (autoloads (ein:connect-to-default-notebook ein:connect-buffer-to-notebook
;;;;;;  ein:connect-to-notebook-buffer ein:connect-to-notebook ein:connect-to-notebook-command
;;;;;;  ein:connect-default-notebook ein:connect-aotoexec-lighter
;;;;;;  ein:connect-save-before-run ein:connect-reload-command ein:connect-run-command)
;;;;;;  "ein-connect" "ein-connect.el" (20958 57459 630183 212000))
;;; Generated autoloads from ein-connect.el

(defvar ein:connect-run-command "%run" "\
``%run`` magic command used for `ein:connect-run-buffer'.
Types same as `ein:console-security-dir' are valid.")

(custom-autoload 'ein:connect-run-command "ein-connect" t)

(defvar ein:connect-reload-command "%run -n" "\
Setting for `ein:connect-reload-buffer'.
Same as `ein:connect-run-command'.")

(custom-autoload 'ein:connect-reload-command "ein-connect" t)

(defvar ein:connect-save-before-run 'yes "\
Whether the buffer should be saved before `ein:connect-run-buffer'.")

(custom-autoload 'ein:connect-save-before-run "ein-connect" t)

(defvar ein:connect-aotoexec-lighter nil "\
String appended to the lighter of `ein:connect-mode' (`ein:c')
when auto-execution mode is on.  When `nil', use the same string
as `ein:cell-autoexec-prompt'.")

(custom-autoload 'ein:connect-aotoexec-lighter "ein-connect" t)

(defvar ein:connect-default-notebook nil "\
Notebook to be connect when `ein:connect-to-default-notebook' is called.

Example setting to connect to \"My_Notebook\" in the server at
port 8888 when opening any buffer in `python-mode'::

  (setq ein:connect-default-notebook \"8888/My_Notebook\")
  (add-hook 'python-mode-hook 'ein:connect-to-default-notebook)

`ein:connect-default-notebook' can also be a function without any
argument.  This function must return a string (notebook path of
the form \"URL-OR-PORT/NOTEBOOK-NAME\").

As `ein:connect-to-default-notebook' requires notebook list to be
loaded, consider using `ein:notebooklist-load' to load notebook
list if you want to connect to notebook without manually opening
notebook list.")

(custom-autoload 'ein:connect-default-notebook "ein-connect" t)

(autoload 'ein:connect-to-notebook-command "ein-connect" "\
Connect to notebook.  When the prefix argument is given,
you can choose any notebook on your server including the ones
not yet opened.  Otherwise, already chose from already opened
notebooks.

\(fn &optional NOT-YET-OPENED)" t nil)

(autoload 'ein:connect-to-notebook "ein-connect" "\
Connect any buffer to notebook and its kernel.

\(fn NBPATH &optional BUFFER NO-RECONNECTION)" t nil)

(autoload 'ein:connect-to-notebook-buffer "ein-connect" "\
Connect any buffer to opened notebook and its kernel.

\(fn BUFFER-OR-NAME)" t nil)

(autoload 'ein:connect-buffer-to-notebook "ein-connect" "\
Connect BUFFER to NOTEBOOK.

\(fn NOTEBOOK &optional BUFFER NO-RECONNECTION)" nil nil)

(autoload 'ein:connect-to-default-notebook "ein-connect" "\
Connect to the default notebook specified by
`ein:connect-default-notebook'.  Set this to `python-mode-hook'
to automatically connect any python-mode buffer to the
notebook.

\(fn)" nil nil)

;;;***

;;;### (autoloads (ein:console-open ein:console-args ein:console-executable
;;;;;;  ein:console-security-dir) "ein-console" "ein-console.el"
;;;;;;  (20958 57459 630183 212000))
;;; Generated autoloads from ein-console.el

(defvar ein:console-security-dir "" "\
Security directory setting.

Following types are valid:

string
    Use this value as a path to security directory.
    Handy when you have only one IPython server.
alist
    An alist whose element is \"(URL-OR-PORT . DIR)\".
    Key (URL-OR-PORT) can be string (URL), integer (port), or
    `default' (symbol).  The value of `default' is used when
    other key does not much.  Normally you should have this
    entry.
function
    Called with an argument URL-OR-PORT (integer or string).
    You can have complex setting using this.")

(custom-autoload 'ein:console-security-dir "ein-console" t)

(defvar ein:console-executable (executable-find "ipython") "\
IPython executable used for console.

Example: ``\"/user/bin/ipython\"``.
Types same as `ein:console-security-dir' are valid.")

(custom-autoload 'ein:console-executable "ein-console" t)

(defvar ein:console-args '("--profile" "nbserver") "\
Additional argument when using console.

.. warning:: Space-separated string is obsolete now.  Use a list
   of string as value now.

Setting to use IPython profile named \"YOUR-IPYTHON-PROFILE\"::

    (setq ein:console-args '(\"--profile\" \"YOUR-IPYTHON-PROFILE\"))

Together with `ein:console-security-dir', you can open IPython
console connecting to a remote kernel.::

    (setq ein:console-args '(\"--ssh\" \"HOSTNAME\"))
    (setq ein:console-security-dir \"PATH/TO/SECURITY/DIR\")

You can setup `ein:console-args' per server basis using alist form::

    (setq ein:console-args
          '((8888 . '(\"--profile\" \"PROFILE\"))
            (8889 . '(\"--ssh\" \"HOSTNAME\"))
            (default . '(\"--profile\" \"default\"))))

If you want to use more complex setting, you can set a function to it::

    (setq ein:console-args
          (lambda (url-or-port) '(\"--ssh\" \"HOSTNAME\")))

See also: `ein:console-security-dir'.")

(custom-autoload 'ein:console-args "ein-console" t)

(autoload 'ein:console-open "ein-console" "\
Open IPython console.
To use this function, `ein:console-security-dir' and
`ein:console-args' must be set properly.
This function works best with the new python.el_ which is shipped
with Emacs 24.2 or later.  If you don't have it, this function
opens a \"plain\" command line interpreter (comint) buffer where
you cannot use fancy stuff such as TAB completion.
It should be possible to support python-mode.el.  Patches are welcome!

.. _python.el: https://github.com/fgallina/python.el

\(fn)" t nil)

;;;***

;;;### (autoloads (ein:filename-translations ein:default-url-or-port
;;;;;;  ein:url-or-port) "ein-core" "ein-core.el" (20958 57459 634183
;;;;;;  213000))
;;; Generated autoloads from ein-core.el

(defvar ein:url-or-port '(8888) "\
List of default url-or-port values.
This will be used for completion. So put your IPython servers.
You can connect to servers not in this list (but you will need
to type every time).")

(custom-autoload 'ein:url-or-port "ein-core" t)

(defvar ein:default-url-or-port nil "\
Default URL or port.  This should be your main IPython
Notebook server.")

(custom-autoload 'ein:default-url-or-port "ein-core" t)

(defvar ein:filename-translations nil "\
Convert file paths between Emacs and Python process.

This value can take these form:

alist
    Its key specifies URL-OR-PORT and value must be a list of two
    functions: (TO-PYTHON FROM-PYTHON).  Key (URL-OR-PORT) can be
    string (URL), integer (port), or `default' (symbol).  The
    value of `default' is used when other key does not much.
function
    Called with an argument URL-OR-PORT (integer or string).
    This function must return a list of two functions:
    (TO-PYTHON FROM-PYTHON).

Here, the functions TO-PYTHON and FROM-PYTHON are defined as:

TO-PYTHON
    A function which converts a file name (returned by
    `buffer-file-name') to the one Python understands.
FROM-PYTHON
    A function which converts a file path returned by
    Python process to the one Emacs understands.

Use `ein:tramp-create-filename-translator' to easily generate the
pair of TO-PYTHON and FROM-PYTHON.")

(custom-autoload 'ein:filename-translations "ein-core" t)

;;;***

;;;### (autoloads (ein:dev-bug-report-template ein:dev-stop-debug
;;;;;;  ein:dev-start-debug ein:dev-insert-mode-map) "ein-dev" "ein-dev.el"
;;;;;;  (20958 57459 634183 213000))
;;; Generated autoloads from ein-dev.el

(autoload 'ein:dev-insert-mode-map "ein-dev" "\
Insert mode-map into rst document.  For README.rst.

\(fn MAP-STRING)" nil nil)

(autoload 'ein:dev-start-debug "ein-dev" "\
Enable EIN debugging support.
When the prefix argument is given, debugging support for websocket
callback (`websocket-callback-debug-on-error') is enabled.

\(fn &optional WS-CALLBACK)" t nil)

(autoload 'ein:dev-stop-debug "ein-dev" "\
Disable debugging support enabled by `ein:dev-start-debug'.

\(fn)" t nil)

(autoload 'ein:dev-bug-report-template "ein-dev" "\
Open a buffer with bug report template.

\(fn)" t nil)

;;;***

;;;### (autoloads (helm-ein-notebook-buffers anything-ein-notebook-buffers
;;;;;;  helm-ein-kernel-history anything-ein-kernel-history ein:helm-kernel-history-search-auto-pattern)
;;;;;;  "ein-helm" "ein-helm.el" (20958 57459 634183 213000))
;;; Generated autoloads from ein-helm.el

(defvar ein:helm-kernel-history-search-auto-pattern t "\
Automatically construct search pattern when non-`nil'.

1. Single space is converted to \"*\".
2. A backslash followed by a space is converted to a single space.
3. A \"*\" is added at the beginning and end of the pattern.

This variable applies to both `helm-ein-kernel-history' and
`anything-ein-kernel-history'.")

(custom-autoload 'ein:helm-kernel-history-search-auto-pattern "ein-helm" t)

(autoload 'anything-ein-kernel-history "ein-helm" "\
Search kernel execution history then insert the selected one.

\(fn)" t nil)

(autoload 'helm-ein-kernel-history "ein-helm" "\
Search kernel execution history then insert the selected one.

\(fn)" t nil)

(autoload 'anything-ein-notebook-buffers "ein-helm" "\
Choose opened notebook using anything.el interface.

\(fn)" t nil)

(autoload 'helm-ein-notebook-buffers "ein-helm" "\
Choose opened notebook using helm interface.

\(fn)" t nil)

;;;***

;;;### (autoloads (ein:iexec-mode ein:iexec-delay) "ein-iexec" "ein-iexec.el"
;;;;;;  (20958 57459 634183 213000))
;;; Generated autoloads from ein-iexec.el

(defvar ein:iexec-delay 0.3 "\
Delay before executing cell after change in second.")

(custom-autoload 'ein:iexec-delay "ein-iexec" t)

(autoload 'ein:iexec-mode "ein-iexec" "\
Instant cell execution minor mode.
Code cell at point will be automatically executed after any
change in its input area.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (ein:ipynb-mode) "ein-ipynb-mode" "ein-ipynb-mode.el"
;;;;;;  (20958 57459 634183 213000))
;;; Generated autoloads from ein-ipynb-mode.el

(autoload 'ein:ipynb-mode "ein-ipynb-mode" "\
A simple mode for ipynb file.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '(".*\\.ipynb\\'" . ein:ipynb-mode))

;;;***

;;;### (autoloads (ein:jedi-setup ein:jedi-dot-complete ein:jedi-complete)
;;;;;;  "ein-jedi" "ein-jedi.el" (20958 57459 638183 213000))
;;; Generated autoloads from ein-jedi.el

(autoload 'ein:jedi-complete "ein-jedi" "\
Run completion using candidates calculated by EIN and Jedi.

\(fn &key (expand ac-expand-on-auto-complete))" t nil)

(autoload 'ein:jedi-dot-complete "ein-jedi" "\
Insert \".\" and run `ein:jedi-complete'.

\(fn)" t nil)

(autoload 'ein:jedi-setup "ein-jedi" "\
Setup auto-completion using EIN and Jedi.el_ together.

Jedi.el_ is a Python auto-completion library for Emacs.
To use EIN and Jedi together, add the following in your Emacs setup.::

  (add-hook 'ein:connect-mode-hook 'ein:jedi-setup)

.. _Jedi.el: https://github.com/tkf/emacs-jedi

\(fn)" nil nil)

;;;***

;;;### (autoloads (ein:junk-rename ein:junk-new ein:junk-notebook-name-template)
;;;;;;  "ein-junk" "ein-junk.el" (20958 57459 638183 213000))
;;; Generated autoloads from ein-junk.el

(defvar ein:junk-notebook-name-template "junk-%Y-%m-%d-%H%M%S" "\
Junk notebook name template.
This value is used from `ein:notebooklist-new-scratch-notebook'
and `ein:notebook-rename-to-scratch-command'.  This must be a
format string which can be passed to `format-time-string'.")

(custom-autoload 'ein:junk-notebook-name-template "ein-junk" t)

(autoload 'ein:junk-new "ein-junk" "\
Open a notebook to try random thing.
Notebook name is determined based on
`ein:junk-notebook-name-template'.

When prefix argument is given, it asks URL or port to use.

\(fn NAME URL-OR-PORT)" t nil)

(autoload 'ein:junk-rename "ein-junk" "\
Rename the current notebook based on `ein:junk-notebook-name-template'
and save it immediately.

\(fn NAME)" t nil)

;;;***

;;;### (autoloads nil "ein-kernel" "ein-kernel.el" (20958 57459 638183
;;;;;;  213000))
;;; Generated autoloads from ein-kernel.el

(defalias 'ein:kernel-url-or-port 'ein:$kernel-url-or-port)

(defalias 'ein:kernel-id 'ein:$kernel-kernel-id)

;;;***

;;;### (autoloads (ein:notebook-multilang-mode) "ein-multilang" "ein-multilang.el"
;;;;;;  (20958 57459 642183 212000))
;;; Generated autoloads from ein-multilang.el

(autoload 'ein:notebook-multilang-mode "ein-multilang" "\
Notebook mode with multiple language fontification.

\(fn)" t nil)

;;;***

;;;### (autoloads (ein:mumamo-indent-line-function-dummy-code ein:use-mumamo-indent-line-function-workaround
;;;;;;  ein:mumamo-fallback-mode ein:mumamo-headingcell-mode ein:mumamo-rawcell-mode
;;;;;;  ein:mumamo-markdowncell-mode ein:mumamo-htmlcell-mode ein:mumamo-textcell-mode
;;;;;;  ein:mumamo-codecell-mode) "ein-mumamo" "ein-mumamo.el" (20958
;;;;;;  57459 646183 212000))
;;; Generated autoloads from ein-mumamo.el

(defvar ein:mumamo-codecell-mode 'python-mode "\
Major Mode for Code Cell.")

(custom-autoload 'ein:mumamo-codecell-mode "ein-mumamo" t)

(defvar ein:mumamo-textcell-mode 'text-mode "\
Major Mode for Text Cell.")

(custom-autoload 'ein:mumamo-textcell-mode "ein-mumamo" t)

(defvar ein:mumamo-htmlcell-mode 'html-mode "\
Major Mode for HTML Cell.")

(custom-autoload 'ein:mumamo-htmlcell-mode "ein-mumamo" t)

(defvar ein:mumamo-markdowncell-mode 'markdown-mode "\
Major Mode for Markdown Cell.")

(custom-autoload 'ein:mumamo-markdowncell-mode "ein-mumamo" t)

(defvar ein:mumamo-rawcell-mode 'rst-mode "\
Major Mode for Raw Cell.")

(custom-autoload 'ein:mumamo-rawcell-mode "ein-mumamo" t)

(defvar ein:mumamo-headingcell-mode 'text-mode "\
Major Mode for Heading Cell.")

(custom-autoload 'ein:mumamo-headingcell-mode "ein-mumamo" t)

(defvar ein:mumamo-fallback-mode 'text-mode "\
Fallback Major Mode.")

(custom-autoload 'ein:mumamo-fallback-mode "ein-mumamo" t)

(defvar ein:use-mumamo-indent-line-function-workaround t "\
Turn on workaround for `mumamo-indent-line-function'.

In code cell, hitting TAB or C-j at the end of input area causes
error from MuMaMo.  When this variable is non-`nil', EIN patches
`mumamo-indent-line-function' to workaround this problem.  This
workaround is on by default.

Note that python-mode's indentation function has other problems
with MuMaMo.  For example, hitting TAB twice, which decreases the
indentation level by one in normal Python buffer, causes similar
error in code cell.  The current workaround does not fix this
problem.")

(custom-autoload 'ein:use-mumamo-indent-line-function-workaround "ein-mumamo" t)

(defvar ein:mumamo-indent-line-function-dummy-code "\ndef ein_dummy():\n    return" "\
Dummy code block for `mumamo-indent-line-function' workaround.
This code block will be inserted at the end of cell input before
indentation and then removed afterward (so user will not see this
code).

This is ugly but... \"practicality beats purity\"...
I guess somebody should fix python.el and/or MuMaMo, in order to
remove this ugliness.

To make the workaround less aggressive, you can set a newline
\"\\n\" for this variable.  In that case, you will be affected by
`issue 24`_.

.. _issue 24: https://github.com/tkf/emacs-ipython-notebook/issues/24")

(custom-autoload 'ein:mumamo-indent-line-function-dummy-code "ein-mumamo" t)

;;;***

;;;### (autoloads (ein:notebook-kill-buffer-ask ein:notebook-mode-hook
;;;;;;  ein:notebook-modes ein:notebook-set-buffer-file-name ein:anything-kernel-history-search-key
;;;;;;  ein:helm-kernel-history-search-key ein:notebook-querty-timeout-save
;;;;;;  ein:notebook-querty-timeout-open ein:notebook-discard-output-on-save)
;;;;;;  "ein-notebook" "ein-notebook.el" (20958 57459 646183 212000))
;;; Generated autoloads from ein-notebook.el

(defvar ein:notebook-discard-output-on-save 'no "\
Configure if the output part of the cell should be saved or not.

.. warning:: This configuration is obsolete now.
   Use nbconvert (https://github.com/ipython/nbconvert) to
   strip output.

`no' : symbol
    Save output. This is the default.
`yes' : symbol
    Always discard output.
a function
    This function takes two arguments, notebook and cell.  Return
    `t' to discard output and return `nil' to save.  For example,
    if you don't want to save image output but other kind of
    output, use `ein:notebook-cell-has-image-output-p'.
")

(custom-autoload 'ein:notebook-discard-output-on-save "ein-notebook" t)

(defvar ein:notebook-querty-timeout-open (* 60 1000) "\
Query timeout for opening notebook.
If you cannot open large notebook because of timeout error, try
to increase this value.  Setting this value to `nil' means to use
global setting.  For global setting and more information, see
`ein:query-timeout'.")

(custom-autoload 'ein:notebook-querty-timeout-open "ein-notebook" t)

(defvar ein:notebook-querty-timeout-save (* 60 1000) "\
Query timeout for saving notebook.
Similar to `ein:notebook-querty-timeout-open', but for saving
notebook.  For global setting and more information, see
`ein:query-timeout'.")

(custom-autoload 'ein:notebook-querty-timeout-save "ein-notebook" t)

(defvar ein:helm-kernel-history-search-key nil "\
Bind `helm-ein-kernel-history' to this key in notebook mode.

Example::

    (setq ein:helm-kernel-history-search-key \"\\M-r\")

This key will be installed in the `ein:notebook-mode-map'.")

(custom-autoload 'ein:helm-kernel-history-search-key "ein-notebook" t)

(defvar ein:anything-kernel-history-search-key nil "\
Bind `anything-ein-kernel-history' to this key in notebook mode.

Example::

    (setq ein:anything-kernel-history-search-key \"\\M-r\")

This key will be installed in the `ein:notebook-mode-map'.")

(custom-autoload 'ein:anything-kernel-history-search-key "ein-notebook" t)

(defvar ein:notebook-set-buffer-file-name nil "\
[EXPERIMENTAL] Set `buffer-file-name' of notebook buffer.")

(custom-autoload 'ein:notebook-set-buffer-file-name "ein-notebook" t)

(defalias 'ein:notebook-name 'ein:$notebook-notebook-name)

(defvar ein:notebook-modes '(ein:notebook-multilang-mode) "\
Notebook modes to use (in order of preference).

When the notebook is opened, mode in this value is checked one by one
and the first usable mode is used.

Available modes:

* `ein:notebook-multilang-mode'
* `ein:notebook-mumamo-mode'
* `ein:notebook-python-mode'
* `ein:notebook-plain-mode'

Examples:

Use MuMaMo if it is installed.  Otherwise, use plain mode.
This is the old default setting::

  (setq ein:notebook-modes '(ein:notebook-mumamo-mode ein:notebook-plain-mode))

Avoid using MuMaMo even when it is installed::

  (setq ein:notebook-modes '(ein:notebook-plain-mode))

Use simple `python-mode' based notebook mode when MuMaMo is not installed::

  (setq ein:notebook-modes '(ein:notebook-mumamo-mode ein:notebook-python-mode))
")

(custom-autoload 'ein:notebook-modes "ein-notebook" t)

(defvar ein:notebook-mode-hook nil "\
Hook for `ein:notebook-mode'.
This hook is run regardless the actual major mode used.")

(custom-autoload 'ein:notebook-mode-hook "ein-notebook" t)

(defvar ein:notebook-kill-buffer-ask t "\
Whether EIN should ask before killing unsaved notebook buffer.")

(custom-autoload 'ein:notebook-kill-buffer-ask "ein-notebook" t)

;;;***

;;;### (autoloads (ein:notebooklist-load ein:notebooklist-open-notebook-global
;;;;;;  ein:notebooklist-list-notebooks ein:notebooklist-new-notebook-with-name
;;;;;;  ein:notebooklist-new-notebook ein:notebooklist-reload ein:notebooklist-open
;;;;;;  ein:notebooklist-first-open-hook) "ein-notebooklist" "ein-notebooklist.el"
;;;;;;  (20958 57459 650183 213000))
;;; Generated autoloads from ein-notebooklist.el

(defvar ein:notebooklist-first-open-hook nil "\
Hooks to run when the notebook list is opened at first time.

Example to open a notebook named _scratch_ when the notebook list
is opened at first time.::

  (add-hook
   'ein:notebooklist-first-open-hook
   (lambda () (ein:notebooklist-open-notebook-by-name \"_scratch_\")))

")

(custom-autoload 'ein:notebooklist-first-open-hook "ein-notebooklist" t)

(autoload 'ein:notebooklist-open "ein-notebooklist" "\
Open notebook list buffer.

\(fn &optional URL-OR-PORT NO-POPUP)" t nil)

(autoload 'ein:notebooklist-reload "ein-notebooklist" "\
Reload current Notebook list.

\(fn)" t nil)

(autoload 'ein:notebooklist-new-notebook "ein-notebooklist" "\
Ask server to create a new notebook and open it in a new buffer.

\(fn &optional URL-OR-PORT CALLBACK CBARGS)" t nil)

(autoload 'ein:notebooklist-new-notebook-with-name "ein-notebooklist" "\
Open new notebook and rename the notebook.

\(fn NAME &optional URL-OR-PORT)" t nil)

(autoload 'ein:notebooklist-list-notebooks "ein-notebooklist" "\
Return a list of notebook path (NBPATH).  Each element NBPATH
is a string of the format \"URL-OR-PORT/NOTEBOOK-NAME\".

\(fn)" nil nil)

(autoload 'ein:notebooklist-open-notebook-global "ein-notebooklist" "\
Choose notebook from all opened notebook list and open it.
Notebook is specified by a string NBPATH whose format is
\"URL-OR-PORT/NOTEBOOK-NAME\".

When used in lisp, CALLBACK and CBARGS are passed to `ein:notebook-open'.

\(fn NBPATH &optional CALLBACK CBARGS)" t nil)

(autoload 'ein:notebooklist-load "ein-notebooklist" "\
Load notebook list but do not pop-up the notebook list buffer.

For example, if you want to load notebook list when Emacs starts,
add this in the Emacs initialization file::

  (add-to-hook 'after-init-hook 'ein:notebooklist-load)

or even this (if you want fast Emacs start-up)::

  ;; load notebook list if Emacs is idle for 3 sec after start-up
  (run-with-idle-timer 3 nil #'ein:notebooklist-load)

You should setup `ein:url-or-port' or `ein:default-url-or-port'
in order to make this code work.

See also:
`ein:connect-to-default-notebook', `ein:connect-default-notebook'.

\(fn &optional URL-OR-PORT)" nil nil)

;;;***

;;;### (autoloads (ein:org-store-link ein:org-open) "ein-org" "ein-org.el"
;;;;;;  (20958 57459 650183 213000))
;;; Generated autoloads from ein-org.el

(autoload 'ein:org-open "ein-org" "\
Open IPython notebook specified by LINK-PATH.
This function is to be used for FOLLOW function of
`org-add-link-type'.

\(fn LINK-PATH)" nil nil)

(autoload 'ein:org-store-link "ein-org" "\
Call `org-store-link-props' when in notebook buffer.
This function is to be used for `org-store-link-functions'.

Examples::

  ipynb:(:url-or-port 8888 :name \"My_Notebook\")
  ipynb:(:url-or-port \"http://notebook-server\" :name \"My_Notebook\")

Note that spaces will be escaped in org files.

As how IPython development team supports multiple directory in
IPython notebook server is unclear, it is not easy to decide the
format for notebook links.  Current approach is to use
S-expression based (rather verbose) serialization, so that
extending link spec without loosing backward compatibility is
easier.  For the examples of link format in general, see Info
node `(org) External links' and Info node `(org) Search options'

\(fn)" nil nil)

(eval-after-load "org" '(progn (org-add-link-type "ipynb" 'ein:org-open) (add-hook 'org-store-link-functions 'ein:org-store-link)))

;;;***

;;;### (autoloads (ein:shr-env) "ein-output-area" "ein-output-area.el"
;;;;;;  (20958 57459 650183 213000))
;;; Generated autoloads from ein-output-area.el

(defvar ein:shr-env '((shr-table-horizontal-line 45) (shr-table-vertical-line 124) (shr-table-corner 43)) "\
Variables let-bound while calling `shr-insert-document'.

To use default shr setting::

    (setq ein:shr-env nil)

Draw boundaries for table (default)::

    (setq ein:shr-env
          '((shr-table-horizontal-line ?-)
            (shr-table-vertical-line ?|)
            (shr-table-corner ?+)))
")

(custom-autoload 'ein:shr-env "ein-output-area" t)

;;;***

;;;### (autoloads (ein:pseudo-console-mode) "ein-pseudo-console"
;;;;;;  "ein-pseudo-console.el" (20958 57459 650183 213000))
;;; Generated autoloads from ein-pseudo-console.el

(autoload 'ein:pseudo-console-mode "ein-pseudo-console" "\
Pseudo console mode.  Hit RET to execute code.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (ein:propagate-connect) "ein-pytools" "ein-pytools.el"
;;;;;;  (20958 57459 654183 214000))
;;; Generated autoloads from ein-pytools.el

(defvar ein:propagate-connect t "\
Set to `t' to connect to the notebook after jumping to a buffer.")

(custom-autoload 'ein:propagate-connect "ein-pytools" t)

;;;***

;;;### (autoloads (ein:query-timeout) "ein-query" "ein-query.el"
;;;;;;  (20958 57459 654183 214000))
;;; Generated autoloads from ein-query.el

(defvar ein:query-timeout (if (eq request-backend 'url-retrieve) 1000 nil) "\
Default query timeout for HTTP access in millisecond.

Setting this to `nil' means no timeout.
If you have ``curl`` command line program, it is automatically set to
`nil' as ``curl`` is reliable than `url-retrieve' therefore no need for
a workaround (see below).

If you do the same operation before the timeout, old operation
will be canceled (see also `ein:query-singleton-ajax').

.. note:: This value exists because it looks like `url-retrieve'
   occasionally fails to finish (start?) querying.  Timeout is
   used to let user notice that their operation is not finished.
   It also prevent opening a lot of useless process buffers.
   You will see them when closing Emacs if there is no timeout.

   If you know how to fix the problem with `url-retrieve', please
   let me know or send pull request at github!
   (Related bug report in Emacs bug tracker:
   http://debbugs.gnu.org/cgi/bugreport.cgi?bug=11469)")

(custom-autoload 'ein:query-timeout "ein-query" t)

;;;***

;;;### (autoloads (ein:shared-output-eval-string ein:shared-output-show-code-cell-at-point
;;;;;;  ein:shared-output-pop-to-buffer) "ein-shared-output" "ein-shared-output.el"
;;;;;;  (20958 57459 654183 214000))
;;; Generated autoloads from ein-shared-output.el

(autoload 'ein:shared-output-pop-to-buffer "ein-shared-output" "\
Open shared output buffer.

\(fn)" t nil)

(autoload 'ein:shared-output-show-code-cell-at-point "ein-shared-output" "\
Show code cell at point in shared-output buffer.
It is useful when the output of the cell at point is truncated.
See also `ein:cell-max-num-outputs'.

\(fn)" t nil)

(autoload 'ein:shared-output-eval-string "ein-shared-output" "\
Evaluate a piece of code.  Prompt will appear asking the code to run.
This is handy when you want to execute something quickly without
making a cell.  If the code outputs something, it will go to the
shared output buffer.  You can open the buffer by the command
`ein:shared-output-pop-to-buffer'.

.. ARGS is passed to `ein:kernel-execute'.  Unlike `ein:kernel-execute',
   `:silent' is `nil' by default.

\(fn CODE &optional POPUP VERBOSE KERNEL &rest ARGS)" t nil)

;;;***

;;;### (autoloads (ein:smartrep-notebook-mode-alist) "ein-smartrep"
;;;;;;  "ein-smartrep.el" (20958 57459 654183 214000))
;;; Generated autoloads from ein-smartrep.el

(defvar ein:smartrep-notebook-mode-alist '(("C-t" . ein:worksheet-toggle-cell-type) ("C-l" . ein:worksheet-clear-output) ("C-k" . ein:worksheet-kill-cell) ("C-y" . ein:worksheet-yank-cell) ("C-a" . ein:worksheet-insert-cell-above) ("C-b" . ein:worksheet-insert-cell-below) ("C-n" . ein:worksheet-goto-next-input) ("C-p" . ein:worksheet-goto-prev-input) ("C-m" . ein:worksheet-merge-cell) ("<up>" . ein:worksheet-move-cell-up) ("<down>" . ein:worksheet-move-cell-down)) "\
alist passed to `smartrep-define-key'.")

(custom-autoload 'ein:smartrep-notebook-mode-alist "ein-smartrep" t)

;;;***

;;;### (autoloads (ein:load-dev ein:use-smartrep ein:use-auto-complete-superpack
;;;;;;  ein:use-auto-complete) "ein-subpackages" "ein-subpackages.el"
;;;;;;  (20958 57459 654183 214000))
;;; Generated autoloads from ein-subpackages.el

(defvar ein:use-auto-complete nil "\
Set to `t' to use preset auto-complete configuration.
Use `ein:use-auto-complete-superpack' when you need more powerful
auto completion.")

(custom-autoload 'ein:use-auto-complete "ein-subpackages" t)

(defvar ein:use-auto-complete-superpack nil "\
Set to `t' to use preset a little bit hacky auto-complete configuration.
When this option is enabled, cached omni completion is available.")

(custom-autoload 'ein:use-auto-complete-superpack "ein-subpackages" t)

(defvar ein:use-smartrep nil "\
Set to `t' to use preset smartrep configuration.

.. warning:: When used with MuMaMo (see `ein:notebook-modes'),
   keyboard macro which manipulates cell (add, remove, move,
   etc.) may start infinite loop (you need to stop it with
   ``C-g``).  Please be careful using this option if you are a
   heavy keyboard macro user.  Using keyboard macro for other
   commands is fine.

.. (Comment) I guess this infinite loop happens because the three
   modules (kmacro.el, mumamo.el and smartrep.el) touches to
   `unread-command-events' in somehow inconsistent ways.")

(custom-autoload 'ein:use-smartrep "ein-subpackages" t)

(defvar ein:load-dev nil "\
Load development helper.")

(custom-autoload 'ein:load-dev "ein-subpackages" t)

;;;***

;;;### (autoloads (ein:tb-show) "ein-traceback" "ein-traceback.el"
;;;;;;  (20958 57459 654183 214000))
;;; Generated autoloads from ein-traceback.el

(autoload 'ein:tb-show "ein-traceback" "\
Show full traceback in traceback viewer.

\(fn)" t nil)

;;;***

;;;### (autoloads (ein:worksheet-enable-undo) "ein-worksheet" "ein-worksheet.el"
;;;;;;  (20958 57459 658183 214000))
;;; Generated autoloads from ein-worksheet.el

(defvar ein:worksheet-enable-undo 'yes "\
Configure undo in notebook buffers.

`no' : symbol
    Do not use undo in notebook buffers.  It is the safest option.
`yes' : symbol
    Enable undo in notebook buffers.  You can't undo after
    modification of cell (execution, add, remove, etc.).  This
    is default.
`full' : symbol
    Enable full undo in notebook buffers.  It is powerful but
    sometime (typically after the cell specific commands) undo
    mess up notebook buffer.  Use it on your own risk.  When the
    buffer is messed up, you can just redo and continue editing,
    or save it once and reopen it if you want to be careful.

You need to reopen the notebook buffer to reflect the change of
this value.")

(custom-autoload 'ein:worksheet-enable-undo "ein-worksheet" t)

;;;***

;;;### (autoloads nil nil ("debug-ein.el" "ein-ac.el" "ein-events.el"
;;;;;;  "ein-kernelinfo.el" "ein-kill-ring.el" "ein-log.el" "ein-multilang-fontify.el"
;;;;;;  "ein-node.el" "ein-notification.el" "ein-pager.el" "ein-pkg.el"
;;;;;;  "ein-python.el" "ein-scratchsheet.el" "ein-utils.el" "ein-websocket.el"
;;;;;;  "ein.el" "zeroein.el") (20958 57599 417148 715000))

;;;***

(provide 'ein-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ein-loaddefs.el ends here
