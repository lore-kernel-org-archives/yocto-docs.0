Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.7536.1615552616990055351
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 04:36:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=SeOAAc4r;
 spf=pass (domain: mvista.com, ip: 209.85.215.171, mailfrom: mshah@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id g4so15779823pgj.0
        for <docs@lists.yoctoproject.org>; Fri, 12 Mar 2021 04:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=2888KGlB7glq1khJpgZ0fYiO0ueo2ZaxjzS4RbfPADQ=;
        b=SeOAAc4rr2LoCZs19UgdFf57wh5R2B7OhNv1zeN/I/ohp/eDicS4lP7R/8b25jng61
         LwlX1iPb1YjqSBBd8DyGT1rWPfFYc4Ha/bBd8U/qbeRiK2VfD6wdHfmOe7l0Ptj1qWhJ
         QGXJ+wb3PTKKvo8bf6bPQUMR47/8u+AeTMrFJpZeV1NfXTGrQQdSixHT0kgTx6F2qD5y
         roQB0Msoan+/l8licVZScWTxMTSPiTV+UhlctTftJSILopnQQwd811gW3T5nsQrAiaIE
         2EZXN/qEG2xukVtIb1a77LRE4Po99xMA1BCD5Y4RfDAbuhHYey4OZcwiGxFDLJaZ4y11
         6ekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2888KGlB7glq1khJpgZ0fYiO0ueo2ZaxjzS4RbfPADQ=;
        b=jcOKRs5TBcKA/0nWOYgBOiW9QanRyfxyd1iOirvGWN3REjSDjhEaZx36NlTRb8oJHv
         kueLhfaMg7TsJ5R+2ORUqytB5uMn3Z3UwcEBfKw5/pVa3dP3hT9X0gRPvSXQMImyZMDb
         Y122M4fE5D2KAIych7jVT0wy0+EFa5oo3FmDXK3WlrYL8F74W4xnaPq+HY+7ndB3UMAU
         EkWjDUOJDMjlrUcRguHww2FtC4GoYbVjWaJdgDs/UpJ0PR8f7b1mGG03EgDx+zoN2urG
         E3nj+pKTljWWo2ss3SKxm+LMTdQU2cq0G3QTO6/71h88YO209npsNIuzzxVDmfHxwvF9
         yjuQ==
X-Gm-Message-State: AOAM53057yjBwHM5bbSCUob8+Nyq1qnJVTTKgRbOYq87HAcKpGlEqTeu
	MghKiHGzx4zf37g9lFAd69QlqDfvXm50Oj30
X-Google-Smtp-Source: ABdhPJzy8QSb+rgapuDeTvsHyK+jjguMByWoyGWVY8fLIAXRHvc8d27CYVFmVNXIO0E5RbV+Aytr1Q==
X-Received: by 2002:a63:1f1e:: with SMTP id f30mr11892170pgf.141.1615552615281;
        Fri, 12 Mar 2021 04:36:55 -0800 (PST)
Return-Path: <mshah@mvista.com>
Received: from dell-latitude.mvista.com ([223.189.66.207])
        by smtp.gmail.com with ESMTPSA id b23sm5114856pfo.164.2021.03.12.04.36.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Mar 2021 04:36:54 -0800 (PST)
From: "Milan Shah" <mshah@mvista.com>
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org,
	randy.macleod@windriver.com,
	srifenbark@gmail.com,
	bluelightning@bluelightning.org
Subject: [yocto-docs][PATCH] ref-manual: added new section library-functions
Date: Fri, 12 Mar 2021 18:06:43 +0530
Message-Id: <1615552603-31220-1-git-send-email-mshah@mvista.com>
X-Mailer: git-send-email 2.7.4

A number of functions in lib/bb/utils.py are used throughout the meta*/ recipe
and bbclass files. Unfortunately the methods for the class are not documented.

Added a new "library functions" section to the manual in the reference manual
in the yocto-docs repository and document the utils functions to start with.

See [YOCTO #9612] for the details.

Signed-off-by: Milan Shah <mshah@mvista.com>
---
 documentation/ref-manual/index.rst             |   1 +
 documentation/ref-manual/library-functions.rst | 471 +++++++++++++++++++++++++
 2 files changed, 472 insertions(+)
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
index 0000000..b222441
--- /dev/null
+++ b/documentation/ref-manual/library-functions.rst
@@ -0,0 +1,471 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+*****************
+Library Functions
+*****************
+
+utils functions
+===============
+
+The Bitbake Utility Functions ``utils.py`` provides some useful python functions that are typically used in ``meta/classes/utils.bbclass``.
+
+See :ref:`ref-manual/migration-1.6:Python Definition substitutions` for the reference of some python definitions.
+
+.. _ref-library-functions-approved_variables:
+
+``approved_variables``
+------------------------
+
+Determine and return the list of whitelisted variables which are approved to remain in the environment.
+
+.. _ref-library-functions-better_compile:
+
+``better_compile``
+--------------------
+
+A better compile method. This method will print the offending lines.
+
+.. _ref-library-functions-better_exec:
+
+``better_exec``
+-----------------
+
+Similiar to ``better_compile``, ``better_exec`` will print the lines that are responsible for the error.
+
+.. _ref-library-functions-break_hardlinks:
+
+``break_hardlinks``
+---------------------
+
+Ensures src is the only hardlink to this file.  Other hardlinks, if any, are not affected (other than in their st_nlink value, of course).
+
+Returns `true` on success and `false` on failure.
+
+.. _ref-library-functions-build_environment:
+
+``build_environment``
+-----------------------
+
+Build an environment from all exported variables.
+
+.. _ref-library-functions-clean_environment:
+
+``clean_environment``
+-----------------------
+
+Clean up any spurious environment variables. This will remove any variables the user hasn't chosen to preserve.
+
+.. _ref-library-functions-contains:
+
+``contains``
+--------------
+
+Check if a variable contains all the values specified.
+
+Arguments:
+
+    `variable` -- the variable name. This will be fetched and expanded (using d.getVar(variable)) and then split into a set().
+
+    `checkvalues` -- if this is a string it is split on whitespace into a set(), otherwise coerced directly into a set().
+
+    `truevalue` -- the value to return if checkvalues is a subset of variable.
+    `falsevalue` -- the value to return if variable is empty or if checkvalues is not a subset of variable.
+
+    `d` -- the data store.
+
+
+
+See the occurrence in :term:`TUNE_ASARGS` , :term:`TUNE_LDARGS` , :ref:`image_types.bbclass <ref-classes-image_types>` , and :ref:`migration-1.8-bluez` sections.
+
+.. _ref-library-functions-contains_any:
+
+``contains_any``
+------------------
+
+Check if a variable contains any values specified.
+
+Arguments:
+
+    `variable` -- the variable name. This will be fetched and expanded (using d.getVar(variable)) and then split into a set().
+
+    `checkvalues` -- if this is a string it is split on whitespace into a set(), otherwise coerced directly into a set().
+
+    `truevalue` -- the value to return if checkvalues is a subset of variable.
+
+    `falsevalue` -- the value to return if variable is empty or if checkvalues is not a subset of variable.
+
+    `d` -- the data store.
+
+See the occurrence in :ref:`image_types.bbclass <ref-classes-image_types>` section.
+
+.. _ref-library-functions-copyfile:
+
+``copyfile``
+--------------
+
+Copies a file from src to dest, preserving all permissions and attributes; mtime will be preserved even when moving across filesystems.
+
+Returns `true` on success and `false` on failure.
+
+.. _ref-library-functions-edit_bblayers_conf:
+
+``edit_bblayers_conf``
+------------------------
+
+Edit ``bblayers.conf``, adding and/or removing layers
+
+Parameters:
+    `bblayers_conf` -- path to bblayers.conf file to edit
+
+    `add` -- layer path (or list of layer paths) to add; None or empty list to add nothing
+
+    `remove` -- layer path (or list of layer paths) to remove; None or empty list to remove nothing
+
+    `edit_cb` -- optional callback function that will be called after processing adds/removes once per existing entry.
+
+Returns a tuple:
+    `notadded` -- list of layers specified to be added but weren't (because they were already in the list)
+
+    `notremoved` -- list of layers that were specified to be removed but weren't (because they weren't in the list)
+
+.. _ref-library-functions-edit_metadata:
+
+``edit_metadata``
+-------------------
+
+Edit lines from a recipe or config file and modify one or more specified variable values set in the file using a specified callback function. Lines are expected to have trailing newlines.
+
+Parameters:
+    `meta_lines` -- lines from the file; can be a list or an iterable (e.g. file pointer)
+
+    `variables` -- a list of variable names to look for. Functions may also be specified, but must be specified with '()' at the end of the name. Note that the function doesn't have any intrinsic understanding of _append, _prepend, _remove, or overrides, so these are considered as part of the name. These values go into a regular expression, so regular expression syntax is allowed.
+
+    `varfunc` -- callback function called for every variable matching one of the entries in the variables parameter.
+
+        The function should take four arguments:
+            
+                `varname` -- name of variable matched
+
+	        `origvalue` -- current value in file
+
+	        `op` -- the operator (e.g. '+-')
+
+	        `newlines` --  list of lines up to this point. You can use this to prepend lines before this variable setting if you wish.
+
+	    and should return a four-element tuple:
+
+	        `newvalue` -- new value to substitute in, or None to drop the variable setting entirely. (If the removal results in two consecutive blank lines, one of the blank lines will also be dropped).
+
+	        `newop` -- the operator to use - if you specify None here, the original operation will be used.
+
+	        `indent` -- number of spaces to indent multi-line entries, or -1 to indent up to the level of the assignment and opening quote, or a string to use as the indent.
+
+	        `minbreak` -- True to allow the first element of a multi-line value to continue on the same line as the assignment, False to indent before the first element.
+            
+        To clarify, if you wish not to change the value, then you would return like this: return origvalue, None, 0, True
+        match_overrides: True to match items with _overrides on the end, False otherwise
+
+Returns a tuple:
+    `updated`:
+        True if changes were made, False otherwise.
+    `newlines`:
+        Lines after processing
+
+.. _ref-library-functions-edit_metadata_file:
+
+``edit_metadata_file``
+------------------------
+
+Edit a recipe or config file and modify one or more specified variable values set in the file using a specified callback function. The file is only written to if the value(s) actually change. This is basically the file version of ``edit_metadata()``, see that function's description for parameter/usage information.
+
+Returns `True` if the file was written to, `False` otherwise.
+
+.. _ref-library-functions-empty_environment:
+
+``empty_environment``
+-----------------------
+
+Remove all variables from the environment.
+
+.. _ref-library-functions-exec_flat_python_func:
+
+``exec_flat_python_func``
+---------------------------
+
+Execute a flat python function (defined with def funcname(args):...)
+
+.. _ref-library-functions-explode_deps:
+
+``explode_deps``
+------------------
+
+Take an RDEPENDS style string of format:
+"DEPEND1 (optional version) DEPEND2 (optional version) ..."
+and return a list of dependencies. Version information is ignored.
+
+.. _ref-library-functions-explode_dep_versions:
+
+``explode_dep_versions``
+---------------------------
+
+Take an RDEPENDS style string of format:
+"DEPEND1 (optional version) DEPEND2 (optional version) ..."
+skip null value and items appeared in dependancy string multiple times and return a dictionary of dependencies and versions.
+
+.. _ref-library-functions-explode_dep_versions2:
+
+``explode_dep_versions2``
+---------------------------
+
+Take an RDEPENDS style string of format:
+"DEPEND1 (optional version) DEPEND2 (optional version) ..."
+and return a dictionary of dependencies and versions.
+
+.. _ref-library-functions-export_proxies:
+
+``export_proxies``
+--------------------
+
+export common proxies variables from datastore to environment.
+
+.. _ref-library-functions-fileslocked:
+
+``fileslocked``
+-----------------
+
+Context manager for locking and unlocking file locks.
+
+.. _ref-library-functions-filter:
+
+``filter``
+------------
+
+Return all words in the variable that are present in the checkvalues.
+
+Arguments:
+    `variable` -- the variable name. This will be fetched and expanded (using d.getVar(variable)) and then split into a set().
+
+    `checkvalues` -- if this is a string it is split on whitespace into a set(), otherwise coerced directly into a set().
+
+    `d` -- the data store.
+
+.. _ref-library-functions-filter_environment:
+
+``filter_environment``
+------------------------
+
+Create a pristine environment for bitbake. This will remove variables that are not known and may influence the build in a negative way.
+
+.. _ref-library-functions-get_file_layer:
+
+``get_file_layer``
+--------------------
+
+Determine the collection (as defined by a layer's ``layer.conf`` file) containing the specified file.
+
+.. _ref-library-functions-get_referenced_vars:
+
+``get_referenced_vars``
+-------------------------
+
+Return names of vars referenced in `start_expr` (recursively), in quasi-BFS order (variables within the same level are ordered arbitrarily)
+
+.. _ref-library-functions-is_semver:
+
+``is_semver``
+---------------
+
+Is the version string following the semver semantic?
+
+.. _ref-library-functions-join_deps:
+
+``join_deps``
+---------------
+
+Take the result from ``explode_dep_versions`` and generate a dependency string.
+
+.. _ref-library-functions-lockfile:
+
+``lockfile``
+--------------
+
+Use the specified file as a lock file, return when the lock has been acquired. Returns a variable to pass to ``unlockfile()``.
+
+Parameters:
+    `retry`: `True` to re-try locking if it fails, `False` otherwise
+
+    `block`: `True` to block until the lock succeeds, `False` otherwise
+    
+The `retry` and `block` parameters are kind of equivalent unless you consider the possibility of sending a signal to the process to breakout - at which point you want block-True rather than retry-True.
+
+.. _ref-library-functions-md5_file:
+
+``md5_file``
+--------------
+
+Return the hex string representation of the MD5 checksum of filename.
+
+.. _ref-library-functions-mkdirhier:
+
+``mkdirhier``
+---------------
+
+Create a directory like 'mkdir -p', but does not complain if directory already exists like os.makedirs
+
+.. _ref-library-functions-movefile:
+
+``movefile``
+--------------
+
+Moves a file from `src` to `dest`, preserving all permissions and attributes; mtime will be preserved even when moving across filesystems.
+
+Returns `true` on success and `false` on failure. Move is atomic.
+
+.. _ref-library-functions-preserved_envvars:
+
+``preserved_envvars``
+-----------------------
+
+Variables which are taken from the environment and placed in the metadata.
+
+.. _ref-library-functions-preserved_envvars_exported:
+
+``preserved_envvars_exported``
+--------------------------------
+
+Variables which are taken from the environment and placed in and exported from the metadata.
+
+
+.. _ref-library-functions-prunedir:
+
+``prunedir``
+--------------
+
+Delete everything reachable from the directory named in `'topdir'`.
+
+.. _ref-library-functions-prune_suffix:
+
+``prune_suffix``
+------------------
+
+See if var ends with any of the suffixes listed and remove it if found .
+
+.. _ref-library-functions-remove:
+
+``remove``
+------------
+
+Equivalent to rm -f or rm -rf.
+
+.. _ref-library-functions-sha1_file:
+
+``sha1_file``
+---------------
+
+Return the hex string representation of the SHA1 checksum of the filename.
+
+.. _ref-library-functions-sha256_file:
+
+``sha256_file``
+-----------------
+
+Return the hex string representation of the 256-bit SHA checksum of filename.
+
+.. _ref-library-functions-sha384_file:
+
+``sha384_file``
+-----------------
+
+Return the hex string representation of the SHA384 checksum of the filename.
+
+.. _ref-library-functions-sha512_file:
+
+``sha512_file``
+-----------------
+
+Return the hex string representation of the SHA512 checksum of the filename.
+
+.. _ref-library-functions-signal_on_parent_exit:
+
+``signal_on_parent_exit``
+---------------------------
+
+Trigger signame to be sent when the parent process dies.
+
+.. _ref-library-functions-split_version:
+
+``split_version``
+-------------------
+
+Split a version string into its constituent parts (PE, PV, PR).
+
+.. _ref-library-functions-to_boolean:
+
+``to_boolean``
+----------------
+
+Check input string and return boolean value True/False/None depending upon the checks.
+
+.. _ref-library-functions-umask:
+
+``umask``
+-----------
+
+Context manager to set the umask to a specific mask, and restore it afterwards.
+
+.. _ref-library-functions-unlockfile:
+
+``unlockfile``
+----------------
+
+Unlock a file locked using ``lockfile()``.
+
+.. _ref-library-functions-vercmp_string:
+
+``vercmp_string``
+-------------------
+
+Split version strings and compare them.
+
+.. _ref-library-functions-vercmp_string_op:
+
+``vercmp_string_op``
+----------------------
+
+Compare two versions and check if the specified comparison operator matches the result of the comparison. This function is fairly liberal about what operators it will accept since there are a variety of styles depending on the context.
+
+.. _ref-library-functions-VersionStringException:
+
+``VersionStringException``
+----------------------------
+
+Exception raised when an invalid version specification is found.
+
+.. _ref-library-functions-which:
+
+``which``
+-----------
+
+Locate `item` in the list of paths `path` (colon separated string like $PATH).
+If `direction` is non-zero then the list is reversed.
+If `history` is True then the list of candidates also returned as result,history.
+If `executable` is True then the candidate has to be an executable file,
+otherwise the candidate simply has to exist.
+
+.. _ref-library-functions-_check_unsafe_delete_path:
+
+``_check_unsafe_delete_path``
+-------------------------------
+
+Basic safeguard against recursively deleting something we shouldn't. If it returns True, the caller should raise an exception with an appropriate message.
+
+.. note::
+
+    This is NOT meant to be a security mechanism - just a guard against silly mistakes with potentially disastrous results.
+
+.. _ref-library-functions-_print_trace:
+
+``_print_trace``
+------------------
+
+Print the Environment of a Text Body.
-- 
2.7.4

