Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.8304.1615556611507586789
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 05:43:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=drSfDoAN;
 spf=pass (domain: linaro.org, ip: 209.85.221.52, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f52.google.com with SMTP id x13so1803054wrs.9
        for <docs@lists.yoctoproject.org>; Fri, 12 Mar 2021 05:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DHvdbw8672iK9loiacfu7UWQj+l7Ja2DHDDiSWhA2dA=;
        b=drSfDoANtfE5JJGYYLBGr5d4SQbDix9IWOnQuWQaHGRFwUVLNkljxRq/dAdWAzg/gQ
         eiOKHInXu/Fp2j5sCEyir0iSjsWHx7/TW9Kt8+v7E8naKbciHinBskL7g3y+SMoKOE3L
         aRCt0ezdEg2sL5O0GSCxxbVyb23ErphCbMePRfUmEFZXhdMuuNJzPVmbzDRCY8HONUsp
         3o4p9wfzpIj2ZdqX+Kot3YHQ11/BHoArIX+1qRhC96T59QC5437+sjUe70kT1mCVavEr
         hwJqhU07ZuYZzooJW6hp+kCOP2WD1IW1NxXtlx/ZtpA6lRk0tOvEGb2SqlsART91q970
         4PBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DHvdbw8672iK9loiacfu7UWQj+l7Ja2DHDDiSWhA2dA=;
        b=en4W7lmmr+dwaOVJoSp/6zCY1tI9kJPT5O9eMVLGIwSJFUZivP8x4ruQVQvjvuLB6i
         foWHlxqWJX0c1Ev/QOuTe/mCX8OZH5dzTJzYiLxhLiodkcDVAlB1IjZKtY7i1FVNGY/H
         CAnJLvdMAmQzSzyWLvM0cvc8sj/S4aiB1u/HgKkfNFAwi+D4RTPpE0VN9XFNWHMuPSCz
         e4YJuUubR/pn9xov741MSnWdr0Kmp1/1HLV2jkx9mttMvBfcn+I4YrpsPcfXceOpM1mQ
         TFy8BML9UAb/Ooy7cRB7qfY9S79c0p37CMd8IhNBbbjmIWuHhQ5RyYWtCe/fVGwqtf7Y
         SQ/g==
X-Gm-Message-State: AOAM533FnICP6yJzq8+hVT+ejn7pYzLyX7AVimlAhM0+jhXElsuOUlKS
	cYrv78gQFtwQLnaybGMcFyNVeQ==
X-Google-Smtp-Source: ABdhPJx5ZAcXGyaetpYYgaZshOqmnokykJbS8C3CAeLLvCSjADGe5Z3iaU6xGXNEpMUcEuuJu+bQBQ==
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr9550859wrr.265.1615556609507;
        Fri, 12 Mar 2021 05:43:29 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from ?IPv6:2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3? ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id q19sm8141615wrg.80.2021.03.12.05.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 05:43:29 -0800 (PST)
Subject: Re: [docs] [yocto-docs][PATCH] ref-manual: added new section library-functions
To: Milan Shah <mshah@mvista.com>, docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org, randy.macleod@windriver.com,
 bluelightning@bluelightning.org
References: <1615552603-31220-1-git-send-email-mshah@mvista.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Message-ID: <1ac1ee79-ace6-eb99-91b0-eea799b043f3@linaro.org>
Date: Fri, 12 Mar 2021 14:43:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1615552603-31220-1-git-send-email-mshah@mvista.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/12/21 1:36 PM, Milan Shah wrote:
> A number of functions in lib/bb/utils.py are used throughout the meta*/ recipe
> and bbclass files. Unfortunately the methods for the class are not documented.
> 
> Added a new "library functions" section to the manual in the reference manual
> in the yocto-docs repository and document the utils functions to start with.
> 
> See [YOCTO #9612] for the details.
> 
> Signed-off-by: Milan Shah <mshah@mvista.com>
> ---
>   documentation/ref-manual/index.rst             |   1 +
>   documentation/ref-manual/library-functions.rst | 471 +++++++++++++++++++++++++
>   2 files changed, 472 insertions(+)
>   create mode 100644 documentation/ref-manual/library-functions.rst
> 
> diff --git a/documentation/ref-manual/index.rst b/documentation/ref-manual/index.rst
> index deb0383..e351142 100644
> --- a/documentation/ref-manual/index.rst
> +++ b/documentation/ref-manual/index.rst
> @@ -17,6 +17,7 @@ Yocto Project Reference Manual
>      structure
>      classes
>      tasks
> +   library-functions
>      devtool-reference
>      kickstart
>      qa-checks
> diff --git a/documentation/ref-manual/library-functions.rst b/documentation/ref-manual/library-functions.rst
> new file mode 100644
> index 0000000..b222441
> --- /dev/null
> +++ b/documentation/ref-manual/library-functions.rst
> @@ -0,0 +1,471 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +*****************
> +Library Functions
> +*****************
> +
> +utils functions
> +===============
> +
> +The Bitbake Utility Functions ``utils.py`` provides some useful python functions that are typically used in ``meta/classes/utils.bbclass``.
> +
> +See :ref:`ref-manual/migration-1.6:Python Definition substitutions` for the reference of some python definitions.
> +
> +.. _ref-library-functions-approved_variables:

We are trying to get rid of these 'extra' labels. We inherited them from 
the Docbook conversion, but eventually, we want them gone. Especially 
since Sphinx automatically generates references for each heading. I 
don't think you are using any of the _ref-library-xxx labels anywhere, 
so please remove them all.

> +
> +``approved_variables``
> +------------------------

i think the number of 'dash' should match the size of the heading. Not 
just here, but throughout the patch.

> +
> +Determine and return the list of whitelisted variables which are approved to remain in the environment.

We haven't published coding style yet, and it's clearly not consistent 
throughout the doc, but please try to avoid long lines and split them.

> +
> +.. _ref-library-functions-better_compile:
> +
> +``better_compile``
> +--------------------
> +
> +A better compile method. This method will print the offending lines.
> +
> +.. _ref-library-functions-better_exec:
> +
> +``better_exec``
> +-----------------
> +
> +Similiar to ``better_compile``, ``better_exec`` will print the lines that are responsible for the error.

Sometimes when you refer to function you use ``function`` sometimes 
``function()``. I prefer the latter.

> +
> +.. _ref-library-functions-break_hardlinks:
> +
> +``break_hardlinks``
> +---------------------
> +
> +Ensures src is the only hardlink to this file.  Other hardlinks, if any, are not affected (other than in their st_nlink value, of course).
``src``

> +
> +Returns `true` on success and `false` on failure.
> +
> +.. _ref-library-functions-build_environment:
> +
> +``build_environment``
> +-----------------------
> +
> +Build an environment from all exported variables.
> +
> +.. _ref-library-functions-clean_environment:
> +
> +``clean_environment``
> +-----------------------
> +
> +Clean up any spurious environment variables. This will remove any variables the user hasn't chosen to preserve.
You are making often use of contractions, and i think we typically don't 
do that in docs. there are a few.. but for example this would be the 
first instance of hasn't..  Maybe someone slightly more English than me 
could confirm.. but i would try to avoid contraction as mush as 
possible. There are several occurrences throughout the patch.

> +
> +.. _ref-library-functions-contains:
> +
> +``contains``
> +--------------
> +
> +Check if a variable contains all the values specified.
> +
> +Arguments:
> +
> +    `variable` -- the variable name. This will be fetched and expanded (using d.getVar(variable)) and then split into a set().
> +
> +    `checkvalues` -- if this is a string it is split on whitespace into a set(), otherwise coerced directly into a set().
> +
> +    `truevalue` -- the value to return if checkvalues is a subset of variable.
> +    `falsevalue` -- the value to return if variable is empty or if checkvalues is not a subset of variable.
> +
> +    `d` -- the data store.

Can you use explicit lists for the arguments? how does it look like, 
isn't it better?
> +
> +
> +
> +See the occurrence in :term:`TUNE_ASARGS` , :term:`TUNE_LDARGS` , :ref:`image_types.bbclass <ref-classes-image_types>` , and :ref:`migration-1.8-bluez` sections.

extra space after each :term:

> +
> +.. _ref-library-functions-contains_any:
> +
> +``contains_any``
> +------------------
> +
> +Check if a variable contains any values specified.
> +
> +Arguments:
> +
> +    `variable` -- the variable name. This will be fetched and expanded (using d.getVar(variable)) and then split into a set().
> +
> +    `checkvalues` -- if this is a string it is split on whitespace into a set(), otherwise coerced directly into a set().
> +
> +    `truevalue` -- the value to return if checkvalues is a subset of variable.
> +
> +    `falsevalue` -- the value to return if variable is empty or if checkvalues is not a subset of variable.
> +
> +    `d` -- the data store.
> +
> +See the occurrence in :ref:`image_types.bbclass <ref-classes-image_types>` section.
> +
> +.. _ref-library-functions-copyfile:
> +
> +``copyfile``
> +--------------
> +
> +Copies a file from src to dest, preserving all permissions and attributes; mtime will be preserved even when moving across filesystems.
> +
> +Returns `true` on success and `false` on failure.
> +
> +.. _ref-library-functions-edit_bblayers_conf:
> +
> +``edit_bblayers_conf``
> +------------------------
> +
> +Edit ``bblayers.conf``, adding and/or removing layers
> +
> +Parameters:

Not sure why, but it renders as 'bold' for me, while "Arguments" above 
does not..

> +    `bblayers_conf` -- path to bblayers.conf file to edit
> +
> +    `add` -- layer path (or list of layer paths) to add; None or empty list to add nothing
> +
> +    `remove` -- layer path (or list of layer paths) to remove; None or empty list to remove nothing
> +
> +    `edit_cb` -- optional callback function that will be called after processing adds/removes once per existing entry.
> +
> +Returns a tuple:
> +    `notadded` -- list of layers specified to be added but weren't (because they were already in the list)
> +
> +    `notremoved` -- list of layers that were specified to be removed but weren't (because they weren't in the list)
> +
> +.. _ref-library-functions-edit_metadata:
> +
> +``edit_metadata``
> +-------------------
> +
> +Edit lines from a recipe or config file and modify one or more specified variable values set in the file using a specified callback function. Lines are expected to have trailing newlines.
> +
> +Parameters:
> +    `meta_lines` -- lines from the file; can be a list or an iterable (e.g. file pointer)
> +
> +    `variables` -- a list of variable names to look for. Functions may also be specified, but must be specified with '()' at the end of the name. Note that the function doesn't have any intrinsic understanding of _append, _prepend, _remove, or overrides, so these are considered as part of the name. These values go into a regular expression, so regular expression syntax is allowed.
> +
> +    `varfunc` -- callback function called for every variable matching one of the entries in the variables parameter.
> +
> +        The function should take four arguments:
> +
> +                `varname` -- name of variable matched
> +
> +	        `origvalue` -- current value in file
> +
> +	        `op` -- the operator (e.g. '+-')
> +
> +	        `newlines` --  list of lines up to this point. You can use this to prepend lines before this variable setting if you wish.
> +
> +	    and should return a four-element tuple:
> +
> +	        `newvalue` -- new value to substitute in, or None to drop the variable setting entirely. (If the removal results in two consecutive blank lines, one of the blank lines will also be dropped).
> +
> +	        `newop` -- the operator to use - if you specify None here, the original operation will be used.
> +
> +	        `indent` -- number of spaces to indent multi-line entries, or -1 to indent up to the level of the assignment and opening quote, or a string to use as the indent.
> +
> +	        `minbreak` -- True to allow the first element of a multi-line value to continue on the same line as the assignment, False to indent before the first element.
> +
> +        To clarify, if you wish not to change the value, then you would return like this: return origvalue, None, 0, True
> +        match_overrides: True to match items with _overrides on the end, False otherwise
> +
> +Returns a tuple:
> +    `updated`:
> +        True if changes were made, False otherwise.
> +    `newlines`:
> +        Lines after processing
> +
> +.. _ref-library-functions-edit_metadata_file:
> +
> +``edit_metadata_file``
> +------------------------
> +
> +Edit a recipe or config file and modify one or more specified variable values set in the file using a specified callback function. The file is only written to if the value(s) actually change. This is basically the file version of ``edit_metadata()``, see that function's description for parameter/usage information.
> +
> +Returns `True` if the file was written to, `False` otherwise.
> +
> +.. _ref-library-functions-empty_environment:
> +
> +``empty_environment``
> +-----------------------
> +
> +Remove all variables from the environment.
> +
> +.. _ref-library-functions-exec_flat_python_func:
> +
> +``exec_flat_python_func``
> +---------------------------
> +
> +Execute a flat python function (defined with def funcname(args):...)
> +
> +.. _ref-library-functions-explode_deps:
> +
> +``explode_deps``
> +------------------
> +
> +Take an RDEPENDS style string of format:
> +"DEPEND1 (optional version) DEPEND2 (optional version) ..."
> +and return a list of dependencies. Version information is ignored.

I think the 2nd line should be highlighted as code.

> +
> +.. _ref-library-functions-explode_dep_versions:
> +
> +``explode_dep_versions``
> +---------------------------
> +
> +Take an RDEPENDS style string of format:
> +"DEPEND1 (optional version) DEPEND2 (optional version) ..."
> +skip null value and items appeared in dependancy string multiple times and return a dictionary of dependencies and versions.
> +
> +.. _ref-library-functions-explode_dep_versions2:
> +
> +``explode_dep_versions2``
> +---------------------------
> +
> +Take an RDEPENDS style string of format:
> +"DEPEND1 (optional version) DEPEND2 (optional version) ..."
> +and return a dictionary of dependencies and versions.
> +
> +.. _ref-library-functions-export_proxies:
> +
> +``export_proxies``
> +--------------------
> +
> +export common proxies variables from datastore to environment.
> +
> +.. _ref-library-functions-fileslocked:
> +
> +``fileslocked``
> +-----------------
> +
> +Context manager for locking and unlocking file locks.
> +
> +.. _ref-library-functions-filter:
> +
> +``filter``
> +------------
> +
> +Return all words in the variable that are present in the checkvalues.
> +
> +Arguments:
> +    `variable` -- the variable name. This will be fetched and expanded (using d.getVar(variable)) and then split into a set().
> +
> +    `checkvalues` -- if this is a string it is split on whitespace into a set(), otherwise coerced directly into a set().
> +
> +    `d` -- the data store.
> +
> +.. _ref-library-functions-filter_environment:
> +
> +``filter_environment``
> +------------------------
> +
> +Create a pristine environment for bitbake. This will remove variables that are not known and may influence the build in a negative way.
Bitbake

> +
> +.. _ref-library-functions-get_file_layer:
> +
> +``get_file_layer``
> +--------------------
> +
> +Determine the collection (as defined by a layer's ``layer.conf`` file) containing the specified file.
> +
> +.. _ref-library-functions-get_referenced_vars:
> +
> +``get_referenced_vars``
> +-------------------------
> +
> +Return names of vars referenced in `start_expr` (recursively), in quasi-BFS order (variables within the same level are ordered arbitrarily)
> +
> +.. _ref-library-functions-is_semver:
> +
> +``is_semver``
> +---------------
> +
> +Is the version string following the semver semantic?
Define semver?

> +
> +.. _ref-library-functions-join_deps:
> +
> +``join_deps``
> +---------------
> +
> +Take the result from ``explode_dep_versions`` and generate a dependency string.
> +
> +.. _ref-library-functions-lockfile:
> +
> +``lockfile``
> +--------------
> +
> +Use the specified file as a lock file, return when the lock has been acquired. Returns a variable to pass to ``unlockfile()``.
> +
> +Parameters:
> +    `retry`: `True` to re-try locking if it fails, `False` otherwise
> +
> +    `block`: `True` to block until the lock succeeds, `False` otherwise
> +
> +The `retry` and `block` parameters are kind of equivalent unless you consider the possibility of sending a signal to the process to breakout - at which point you want block-True rather than retry-True.
> +
> +.. _ref-library-functions-md5_file:
> +
> +``md5_file``
> +--------------
> +
> +Return the hex string representation of the MD5 checksum of filename.
> +
> +.. _ref-library-functions-mkdirhier:
> +
> +``mkdirhier``
> +---------------
> +
> +Create a directory like 'mkdir -p', but does not complain if directory already exists like os.makedirs
> +
> +.. _ref-library-functions-movefile:
> +
> +``movefile``
> +--------------
> +
> +Moves a file from `src` to `dest`, preserving all permissions and attributes; mtime will be preserved even when moving across filesystems.
mtime -> ``mtime``
`src` -> ``src``
...
> +
> +Returns `true` on success and `false` on failure. Move is atomic.
> +
> +.. _ref-library-functions-preserved_envvars:
> +
> +``preserved_envvars``
> +-----------------------
> +
> +Variables which are taken from the environment and placed in the metadata.
> +
> +.. _ref-library-functions-preserved_envvars_exported:
> +
> +``preserved_envvars_exported``
> +--------------------------------
> +
> +Variables which are taken from the environment and placed in and exported from the metadata.
> +
> +
> +.. _ref-library-functions-prunedir:
> +
> +``prunedir``
> +--------------
> +
> +Delete everything reachable from the directory named in `'topdir'`.
> +
> +.. _ref-library-functions-prune_suffix:
> +
> +``prune_suffix``
> +------------------
> +
> +See if var ends with any of the suffixes listed and remove it if found .
> +
> +.. _ref-library-functions-remove:
> +
> +``remove``
> +------------
> +
> +Equivalent to rm -f or rm -rf.

use ``xx``

> +
> +.. _ref-library-functions-sha1_file:
> +
> +``sha1_file``
> +---------------
> +
> +Return the hex string representation of the SHA1 checksum of the filename.
> +
> +.. _ref-library-functions-sha256_file:
> +
> +``sha256_file``
> +-----------------
> +
> +Return the hex string representation of the 256-bit SHA checksum of filename.
> +
> +.. _ref-library-functions-sha384_file:
> +
> +``sha384_file``
> +-----------------
> +
> +Return the hex string representation of the SHA384 checksum of the filename.
> +
> +.. _ref-library-functions-sha512_file:
> +
> +``sha512_file``
> +-----------------
> +
> +Return the hex string representation of the SHA512 checksum of the filename.
> +
> +.. _ref-library-functions-signal_on_parent_exit:
> +
> +``signal_on_parent_exit``
> +---------------------------
> +
> +Trigger signame to be sent when the parent process dies.
> +
> +.. _ref-library-functions-split_version:
> +
> +``split_version``
> +-------------------
> +
> +Split a version string into its constituent parts (PE, PV, PR).

PE, PV and PR are terms, please link them.

> +
> +.. _ref-library-functions-to_boolean:
> +
> +``to_boolean``
> +----------------
> +
> +Check input string and return boolean value True/False/None depending upon the checks.
> +
> +.. _ref-library-functions-umask:
> +
> +``umask``
> +-----------
> +
> +Context manager to set the umask to a specific mask, and restore it afterwards.
> +
> +.. _ref-library-functions-unlockfile:
> +
> +``unlockfile``
> +----------------
> +
> +Unlock a file locked using ``lockfile()``.
> +
> +.. _ref-library-functions-vercmp_string:
> +
> +``vercmp_string``
> +-------------------
> +
> +Split version strings and compare them.
> +
> +.. _ref-library-functions-vercmp_string_op:
> +
> +``vercmp_string_op``
> +----------------------
> +
> +Compare two versions and check if the specified comparison operator matches the result of the comparison. This function is fairly liberal about what operators it will accept since there are a variety of styles depending on the context.
> +
> +.. _ref-library-functions-VersionStringException:
> +
> +``VersionStringException``
> +----------------------------
> +
> +Exception raised when an invalid version specification is found.
> +
> +.. _ref-library-functions-which:
> +
> +``which``
> +-----------
> +
> +Locate `item` in the list of paths `path` (colon separated string like $PATH).
> +If `direction` is non-zero then the list is reversed.
> +If `history` is True then the list of candidates also returned as result,history.
> +If `executable` is True then the candidate has to be an executable file,
> +otherwise the candidate simply has to exist.
> +
> +.. _ref-library-functions-_check_unsafe_delete_path:
> +
> +``_check_unsafe_delete_path``
> +-------------------------------
> +
> +Basic safeguard against recursively deleting something we shouldn't. If it returns True, the caller should raise an exception with an appropriate message.
> +
> +.. note::
> +
> +    This is NOT meant to be a security mechanism - just a guard against silly mistakes with potentially disastrous results.
> +
> +.. _ref-library-functions-_print_trace:
> +
> +``_print_trace``
> +------------------
> +
> +Print the Environment of a Text Body.
> 
> 
> 
> 
> 

