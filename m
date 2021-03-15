Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web12.4936.1615787281509115129
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Mar 2021 22:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=yErGCmPt;
 spf=pass (domain: mvista.com, ip: 209.85.210.48, mailfrom: mshah@mvista.com)
Received: by mail-ot1-f48.google.com with SMTP id a17so6506552oto.5
        for <docs@lists.yoctoproject.org>; Sun, 14 Mar 2021 22:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=WriN052svdoCsZHJZd9/3aq8Maa+CxFOcXIRcYz9akY=;
        b=yErGCmPtI1OBc9g/lJvC8ravCaaq+zxpmllaT9ByZ2vVQxFSTau4PFyYy5v+HHDNEX
         ozCh4o63WzgfxNTMIT5sGLRAsAUn/9iQ29SuzGKD5/cyNQpIyDxgPRizwRzEU7C2baYm
         omSRgsafKI3sEp9EuE69Kg2sQvNihleTmlPCoCWkaKHEmqq8snTo73JNhaCodrvVgw3C
         6Exo8papn+XfhscTd/IYIg7U+R6eI1cZn1m22U7TrB15ag93TCVtUY3Q67DlGtg6hnGW
         X22JMAEzszQwFLfBGrdCt+kuP7Ni5+BgMdCgesn7WVWVBxSDSUcxy7eF+ORNOQlTZTGl
         TtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WriN052svdoCsZHJZd9/3aq8Maa+CxFOcXIRcYz9akY=;
        b=Y2/7hbe3V6Q5rf1sh8Rg3C5j3ypMyb/j2YOjCtq7HEWfkXdiRnRfgWvacbSckr3piu
         8t+q+2GBCudwj5+5d8GgquOJn9fAH5G/94x7HfB0fbV4zmte97x1EOoiCDfMx4OzIJNB
         gUC46STzlbxQ4m4Z+weuq3laq+5mEJuADbDuQHj6uVT8+RrvVEgwV2gfApq6Ql22EuwH
         6vJNLbAwACmsuBB5oFglE7CcJhTrLSDzqv94IagT2RZiSMNKuef02hMBQjedaQVNFcpI
         44bLAOWqqxBspTM0ycHMKY+I3I+xpNIdlIrlt9gVNiJwLBOpXsq51En/Uk1QMMd0KFbQ
         whIQ==
X-Gm-Message-State: AOAM530RpDeIJqKmgZ5wRRVOD+PaMTtoZkbFOBrrNMJxi74olDyrh1jX
	H0KVChBPkiyOyaE6bVR58wiHsVdt1xPC0dZfJoc=
X-Google-Smtp-Source: ABdhPJxAVQR2EL+Na/lqojxjEwicGxG+ud0Scbd9MDzmuDPRl5MKkIV5ecr36ftHJzS7T5DtA/YQhg==
X-Received: by 2002:a9d:12a7:: with SMTP id g36mr12648316otg.304.1615787280046;
        Sun, 14 Mar 2021 22:48:00 -0700 (PDT)
Return-Path: <mshah@mvista.com>
Received: from dell-latitude.mvista.com ([103.102.57.108])
        by smtp.gmail.com with ESMTPSA id a73sm6425709oii.26.2021.03.14.22.47.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Mar 2021 22:47:59 -0700 (PDT)
From: "Milan Shah" <mshah@mvista.com>
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org,
	randy.macleod@windriver.com,
	srifenbark@gmail.com,
	bluelightning@bluelightning.org,
	nicolas.dechesne@linaro.org,
	quentin.schulz@streamunlimited.com
Subject: [yocto-docs][PATCH v2] ref-manual: added new section library-functions
Date: Mon, 15 Mar 2021 11:17:50 +0530
Message-Id: <1615787270-17662-1-git-send-email-mshah@mvista.com>
X-Mailer: git-send-email 2.7.4

A number of functions in lib/bb/utils.py are used throughout the meta*/ recipe
and bbclass files. Unfortunately the methods for the class are not documented.

Added a new "library functions" section to the manual in the reference manual
in the yocto-docs repository and document the utils functions to start with.

See Yocto Bug [#9612] for the details.

Signed-off-by: Milan Shah <mshah@mvista.com>
---
 documentation/ref-manual/index.rst             |   1 +
 documentation/ref-manual/library-functions.rst | 467 +++++++++++++++++++++++++
 2 files changed, 468 insertions(+)
 create mode 100644 documentation/ref-manual/library-functions.rst

diff --git a/documentation/ref-manual/index.rst b/documentation/ref-manual/index.rst
index deb0383..e351142 100644
--- a/documentation/ref-manual/index.rst
+++ b/documentation/ref-manual/index.rst
@@ -17,6 +17,7 @@ Yocto Project Reference Manual
    structure
    classes
    tasks
+   library-functions
    devtool-reference
    kickstart
    qa-checks
diff --git a/documentation/ref-manual/library-functions.rst b/documentation/ref-manual/library-functions.rst
new file mode 100644
index 0000000..55c8339
--- /dev/null
+++ b/documentation/ref-manual/library-functions.rst
@@ -0,0 +1,467 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+*****************
+Library Functions
+*****************
+
+utils functions
+===============
+
+The Bitbake Utility Functions ``utils.py`` provides some useful python
+functions that are typically used in ``meta/classes/utils.bbclass``.
+
+See :ref:`ref-manual/migration-1.6:Python Definition substitutions` for the 
+reference of some python definitions.
+
+``approved_variables``
+----------------------
+
+Determine and return the list of whitelisted variables which are approved to
+remain in the environment.
+
+``better_compile``
+------------------
+
+A better compile method. This method will print the offending lines.
+
+``better_exec``
+---------------
+
+Similiar to ``better_compile``, ``better_exec`` will print the lines that are
+responsible for the error.
+
+``break_hardlinks``
+-------------------
+
+Ensures ``src`` is the only hardlink to this file.  Other hardlinks, if any,
+are not affected (other than in their st_nlink value, of course).
+
+Returns `true` on success and `false` on failure.
+
+``build_environment``
+---------------------
+
+Build an environment from all exported variables.
+
+``clean_environment``
+---------------------
+
+Clean up any spurious environment variables. This will remove any variables
+the user has not chosen to preserve.
+
+``contains``
+------------
+
+Check if a variable contains all the values specified.
+
+::
+
+    Arguments:
+
+        `variable` -- the variable name. This will be fetched and expanded
+        (using d.getVar(variable)) and then split into a set.
+
+        `checkvalues` -- if this is a string it is split on whitespace into a
+        set, otherwise coerced directly into a set.
+
+        `truevalue` -- the value to return if checkvalues is a subset of variable.
+
+        `falsevalue` -- the value to return if variable is empty or if checkvalues
+        is not a subset of variable.
+
+        `d` -- the data store.
+
+See the occurrence in :term:`TUNE_ASARGS`, :term:`TUNE_LDARGS`,
+:ref:`image_types.bbclass <ref-classes-image_types>`, and
+:ref:`migration-1.8-bluez` sections.
+
+``contains_any``
+----------------
+
+Check if a variable contains any values specified.
+
+::
+
+    Arguments:
+
+        `variable` -- the variable name. This will be fetched and expanded
+        (using d.getVar(variable)) and then split into a set.
+
+        `checkvalues` -- if this is a string it is split on whitespace into a
+        set, otherwise coerced directly into a set.
+
+        `truevalue` -- the value to return if checkvalues is a subset of variable.
+
+        `falsevalue` -- the value to return if variable is empty or if checkvalues
+        is not a subset of variable.
+
+        `d` -- the data store.
+
+See the occurrence in :ref:`image_types.bbclass <ref-classes-image_types>`
+section.
+
+``copyfile``
+------------
+
+Copies a file from src to dest, preserving all permissions and attributes;
+mtime will be preserved even when moving across filesystems.
+
+Returns `true` on success and `false` on failure.
+
+``edit_bblayers_conf``
+----------------------
+
+Edit ``bblayers.conf``, adding and/or removing layers
+
+::
+
+    Parameters:
+    
+        `bblayers_conf` -- path to bblayers.conf file to edit
+
+        `add` -- layer path (or list of layer paths) to add; None or empty list
+        to add nothing
+
+        `remove` -- layer path (or list of layer paths) to remove; None or
+        empty list to remove nothing
+
+        `edit_cb` -- optional callback function that will be called after
+        processing adds/removes once per existing entry.
+
+    Returns a tuple:
+    
+        `notadded` -- list of layers specified to be added but were not
+        (because they were already in the list)
+
+        `notremoved` -- list of layers that were specified to be removed but
+        were not (because they were not in the list)
+
+``edit_metadata``
+-----------------
+
+Edit lines from a recipe or config file and modify one or more specified
+variable values set in the file using a specified callback function.
+Lines are expected to have trailing newlines.
+
+::
+
+    Parameters:
+    
+        `meta_lines` -- lines from the file; can be a list or an iterable
+        (e.g. file pointer)
+
+        `variables` -- a list of variable names to look for.
+        Functions may also be specified, but must be specified with '()'
+        at the end of the name. Note that the function does not have any intrinsic
+        understanding of _append, _prepend, _remove, or overrides,
+        so these are considered as part of the name. These values go into
+        a regular expression, so regular expression syntax is allowed.
+
+        `varfunc` -- callback function called for every variable matching
+        one of the entries in the variables parameter.
+
+            The function should take four arguments:
+            
+                `varname` -- name of variable matched
+
+                `origvalue` -- current value in file
+
+                `op` -- the operator (e.g. '+-')
+
+                `newlines` --  list of lines up to this point.
+                You can use this to prepend lines before this variable setting
+                if you wish.
+
+            and should return a four-element tuple:
+
+                `newvalue` -- new value to substitute in, or None to drop the
+                variable setting entirely. (If the removal results in two
+                consecutive blank lines, one of the blank lines will also
+                dropped).
+
+                `newop` -- the operator to use - if you specify None here,
+                the original operation will be used.
+
+                `indent` -- number of spaces to indent multi-line entries,
+                or -1 to indent up to the level of the assignment and opening
+                quote, or a string to use as the indent.
+
+                `minbreak` -- True to allow the first element of a multi-line
+                value to continue on the same line as the assignment,
+                False to indent before the first element.
+            
+        To clarify, if you wish not to change the value, then you would return
+        like this: return origvalue, None, 0, True
+        match_overrides: True to match items with _overrides on the end,
+        False otherwise
+
+    Returns a tuple:
+    
+        `updated`:
+            True if changes were made, False otherwise.
+        `newlines`:
+            Lines after processing
+
+``edit_metadata_file``
+----------------------
+
+Edit a recipe or config file and modify one or more specified variable values
+set in the file using a specified callback function. The file is only written
+to if the value(s) actually change.
+This is basically the file version of ``edit_metadata``, see that function's
+description for parameter/usage information.
+
+Returns `True` if the file was written to, `False` otherwise.
+
+``empty_environment``
+---------------------
+
+Remove all variables from the environment.
+
+``exec_flat_python_func``
+-------------------------
+
+Execute a flat python function (defined with def funcname(args):...)
+
+``explode_deps``
+----------------
+
+Take an RDEPENDS style string of format:
+::
+
+    "DEPEND1 (optional version) DEPEND2 (optional version) ..."
+
+and return a list of dependencies. Version information is ignored.
+
+``explode_dep_versions``
+------------------------
+
+Take an RDEPENDS style string of format:
+::
+
+    "DEPEND1 (optional version) DEPEND2 (optional version) ..."
+
+skip null value and items appeared in dependancy string multiple times and
+return a dictionary of dependencies and versions.
+
+``explode_dep_versions2``
+-------------------------
+
+Take an RDEPENDS style string of format:
+::
+
+    "DEPEND1 (optional version) DEPEND2 (optional version) ..."
+
+and return a dictionary of dependencies and versions.
+
+``export_proxies``
+------------------
+
+export common proxies variables from datastore to environment.
+
+``fileslocked``
+---------------
+
+Context manager for locking and unlocking file locks.
+
+``filter``
+----------
+
+Return all words in the variable that are present in the checkvalues.
+
+::
+
+    Arguments:
+    
+        `variable` -- the variable name. This will be fetched and expanded
+        (using d.getVar(variable)) and then split into a set.
+
+        `checkvalues` -- if this is a string it is split on whitespace into a
+        set, otherwise coerced directly into a set.
+
+        `d` -- the data store.
+
+``filter_environment``
+----------------------
+
+Create a pristine environment for Bitbake. This will remove variables that are
+not known and may influence the build in a negative way.
+
+``get_file_layer``
+------------------
+
+Determine the collection (as defined by a layer's ``layer.conf`` file)
+containing the specified file.
+
+``get_referenced_vars``
+-----------------------
+
+Return names of vars referenced in `start_expr` (recursively),
+in quasi-BFS order (variables within the same level are ordered arbitrarily)
+
+``is_semver``
+-------------
+
+Is the version string following the semver semantic?
+
+    https://semver.org/spec/v2.0.0.html
+
+``join_deps``
+-------------
+
+Take the result from ``explode_dep_versions`` and generate a dependency string.
+
+``lockfile``
+------------
+
+Use the specified file as a lock file, return when the lock has been acquired.
+Returns a variable to pass to ``unlockfile``.
+
+::
+
+    Parameters:
+    
+        `retry`: `True` to re-try locking if it fails, `False` otherwise
+
+        `block`: `True` to block until the lock succeeds, `False` otherwise
+    
+The `retry` and `block` parameters are kind of equivalent unless you consider
+the possibility of sending a signal to the process to breakout - at which point
+you want block-True rather than retry-True.
+
+``md5_file``
+------------
+
+Return the hex string representation of the MD5 checksum of filename.
+
+``mkdirhier``
+-------------
+
+Create a directory like 'mkdir -p', but does not complain if directory already
+exists like os.makedirs
+
+``movefile``
+------------
+
+Moves a file from ``src`` to `dest`, preserving all permissions and attributes;
+``mtime`` will be preserved even when moving across filesystems.
+
+Returns `true` on success and `false` on failure. Move is atomic.
+
+``preserved_envvars``
+---------------------
+
+Variables which are taken from the environment and placed in the metadata.
+
+``preserved_envvars_exported``
+------------------------------
+
+Variables which are taken from the environment and placed in and exported from
+the metadata.
+
+``prunedir``
+------------
+
+Delete everything reachable from the directory named in `'topdir'`.
+
+``prune_suffix``
+----------------
+
+See if var ends with any of the suffixes listed and remove it if found .
+
+``remove``
+----------
+
+Equivalent to rm -f ``xx`` or rm -rf ``xx``.
+
+``sha1_file``
+-------------
+
+Return the hex string representation of the SHA1 checksum of the filename.
+
+``sha256_file``
+---------------
+
+Return the hex string representation of the 256-bit SHA checksum of filename.
+
+``sha384_file``
+---------------
+
+Return the hex string representation of the SHA384 checksum of the filename.
+
+``sha512_file``
+---------------
+
+Return the hex string representation of the SHA512 checksum of the filename.
+
+``signal_on_parent_exit``
+-------------------------
+
+Trigger signame to be sent when the parent process dies.
+
+``split_version``
+-----------------
+
+Split a version string into its constituent parts
+(:term:`PE`, :term:`PV`, :term:`PR`).
+
+``to_boolean``
+--------------
+
+Check input string and return boolean value True/False/None depending upon the
+checks.
+
+``umask``
+---------
+
+Context manager to set the umask to a specific mask, and restore it afterwards.
+
+``unlockfile``
+--------------
+
+Unlock a file locked using ``lockfile``.
+
+``vercmp_string``
+-----------------
+
+Split version strings and compare them.
+
+``vercmp_string_op``
+--------------------
+
+Compare two versions and check if the specified comparison operator matches
+the result of the comparison. This function is fairly liberal about what
+operators it will accept since there are a variety of styles depending on
+the context.
+
+``VersionStringException``
+--------------------------
+
+Exception raised when an invalid version specification is found.
+
+``which``
+---------
+
+Locate `item` in the list of paths `path` (colon separated string like $PATH).
+If `direction` is non-zero then the list is reversed.
+If `history` is True then the list of candidates also returned as result,
+history.
+If `executable` is True then the candidate has to be an executable file,
+otherwise the candidate simply has to exist.
+
+``_check_unsafe_delete_path``
+-----------------------------
+
+Basic safeguard against recursively deleting something we should not.
+If it returns True, the caller should raise an exception with
+an appropriate message.
+
+.. note::
+
+    This is NOT meant to be a security mechanism -
+    just a guard against silly mistakes with potentially disastrous results.
+
+``_print_trace``
+----------------
+
+Print the Environment of a Text Body.
-- 
2.7.4

