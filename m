Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.7227.1625808430500794629
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jul 2021 22:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=R9X9l6ov;
 spf=pass (domain: mvista.com, ip: 209.85.208.48, mailfrom: mshah@mvista.com)
Received: by mail-ed1-f48.google.com with SMTP id t3so11933648edc.7
        for <docs@lists.yoctoproject.org>; Thu, 08 Jul 2021 22:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3E+LP54wyJH1v5bn1NLyBQqs3zw9irZMOwRcx8rQLkA=;
        b=R9X9l6ovDjDgFBezq7QRrMUfXmM46wYaS/ot+5OS9v9LctqlNDTKHXf3EwEE4/qKUg
         uJTQs78yfT+8k3raSSQ7ula3MpNh+PUt520kIk/7FjZeOMPB76J6TaPDMtqPFTT2Qbn/
         sw0gF6zRXczerStBBK4guputnn30yrXF66H+7eUV5oH0c42yikr9YQn4Z278i5Wv1XjB
         LVRLlRF8gcYvSiGeIPG73idzek5A93BTj/16TsdWnNdPdVb0mlp/FBEw9YJ3R+KrkVJw
         0jqMEco4XALz4kFBKJqahb/GTCfqRgMTM4yMIYEJtUxedM1200Y6gE+1Xl3L3cjXynjw
         4DuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3E+LP54wyJH1v5bn1NLyBQqs3zw9irZMOwRcx8rQLkA=;
        b=ivwkcsaW8nDw4DgY0YjlhfHlw6jOi+E0vTmYC8PpawyQiXXJdvOw2t8yKbKa2hGpai
         mcjS2FoFiNJMRJm4j4SjLp+4sWIS6RwRzFyZlehPu69lnunQ17l4DbLqpFb0ZwIJmioX
         zLnGkYv6YjuVCAj4Qmp/9y/x5myKRfY6X3B5msUaTauR3gDALZBqIcNihqPU1dYqij5t
         tM1+J465DAkq2hiU9M908PEPgDdAq4SrQtnvs92Vk73ysnRTNIX9mOWa6YFuQS2rZ6GT
         xwIkc9l+OmAuATGQOmA8amp5nei7+5XHIhoFQGTpqP7WL1U24jrQYPwSMi+ngTFby36E
         vCCA==
X-Gm-Message-State: AOAM533WMxuqItti2ziK4DqH7/Z19guwSt8g9J3PlpblP26ui0FxqFSH
	TLsZG7boqQeLgVCPgZhp4tWMpOcjDSjmBxO702iQdg==
X-Google-Smtp-Source: ABdhPJxyRLNYpAKnI0HFPQZHmw7U/GNTkoTQImTfsiWLA4yiksWomJXA4WrwK683oNSU8tT84SodDVoaEvSZx+stoo4=
X-Received: by 2002:a05:6402:451:: with SMTP id p17mr42707964edw.332.1625808428872;
 Thu, 08 Jul 2021 22:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <1615787270-17662-1-git-send-email-mshah@mvista.com> <f81a94d1-9903-0799-862c-de5ea0b5da73@windriver.com>
In-Reply-To: <f81a94d1-9903-0799-862c-de5ea0b5da73@windriver.com>
From: "Milan Shah" <mshah@mvista.com>
Date: Fri, 9 Jul 2021 10:56:32 +0530
Message-ID: <CA+=qD9O79RYoq68WFLp2Xibqcu82SwJJkCKYbmBgW8cqXrxFHQ@mail.gmail.com>
Subject: Re: [docs] [yocto-docs][PATCH v2] ref-manual: added new section library-functions
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, michael.opdenacker@bootlin.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Scott Rifenbark <srifenbark@gmail.com>, 
	Paul Eggleton <bluelightning@bluelightning.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Content-Type: multipart/alternative; boundary="000000000000e0480a05c6aa05f2"

--000000000000e0480a05c6aa05f2
Content-Type: text/plain; charset="UTF-8"

Hello All,

My Patch-v2 has not been reviewed yet. Looking forward to see some updates
on it.
https://lists.yoctoproject.org/g/docs/message/903
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9612

Thanks & Regards,
Milan Shah

<https://www.mvista.com/>
*Milan Shah* * | Software Engineer*
*a: * MontaVista Software, LLC | Bangalore, India
*e:* info@mvista.com | *w:* www.mvista.com/
*p:* +91-80-4939-5000


On Thu, May 20, 2021 at 6:43 AM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> Add: michael.opdenacker@bootlin.com
>
> and ping since Milan asked about this in:
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=9612
> ../Randy
>
>
> On 2021-03-15 1:47 a.m., Milan Shah wrote:
> > Added a new "library functions" section to the manual in the reference
> manual
> > in the yocto-docs repository and document the utils functions to start
> with.
> >
> > See Yocto Bug [#9612] for the details.
> >
> > Signed-off-by: Milan Shah <mshah@mvista.com>
> > ---
> >   documentation/ref-manual/index.rst             |   1 +
> >   documentation/ref-manual/library-functions.rst | 467
> +++++++++++++++++++++++++
> >   2 files changed, 468 insertions(+)
> >   create mode 100644 documentation/ref-manual/library-functions.rst
> >
> > diff --git a/documentation/ref-manual/index.rst
> b/documentation/ref-manual/index.rst
> > index deb0383..e351142 100644
> > --- a/documentation/ref-manual/index.rst
> > +++ b/documentation/ref-manual/index.rst
> > @@ -17,6 +17,7 @@ Yocto Project Reference Manual
> >      structure
> >      classes
> >      tasks
> > +   library-functions
> >      devtool-reference
> >      kickstart
> >      qa-checks
> > diff --git a/documentation/ref-manual/library-functions.rst
> b/documentation/ref-manual/library-functions.rst
> > new file mode 100644
> > index 0000000..55c8339
> > --- /dev/null
> > +++ b/documentation/ref-manual/library-functions.rst
> > @@ -0,0 +1,467 @@
> > +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> > +
> > +*****************
> > +Library Functions
> > +*****************
> > +
> > +utils functions
> > +===============
> > +
> > +The Bitbake Utility Functions ``utils.py`` provides some useful python
> > +functions that are typically used in ``meta/classes/utils.bbclass``.
> > +
> > +See :ref:`ref-manual/migration-1.6:Python Definition substitutions` for
> the
> > +reference of some python definitions.
> > +
> > +``approved_variables``
> > +----------------------
> > +
> > +Determine and return the list of whitelisted variables which are
> approved to
> > +remain in the environment.
> > +
> > +``better_compile``
> > +------------------
> > +
> > +A better compile method. This method will print the offending lines.
> > +
> > +``better_exec``
> > +---------------
> > +
> > +Similiar to ``better_compile``, ``better_exec`` will print the lines
> that are
> > +responsible for the error.
> > +
> > +``break_hardlinks``
> > +-------------------
> > +
> > +Ensures ``src`` is the only hardlink to this file.  Other hardlinks, if
> any,
> > +are not affected (other than in their st_nlink value, of course).
> > +
> > +Returns `true` on success and `false` on failure.
> > +
> > +``build_environment``
> > +---------------------
> > +
> > +Build an environment from all exported variables.
> > +
> > +``clean_environment``
> > +---------------------
> > +
> > +Clean up any spurious environment variables. This will remove any
> variables
> > +the user has not chosen to preserve.
> > +
> > +``contains``
> > +------------
> > +
> > +Check if a variable contains all the values specified.
> > +
> > +::
> > +
> > +    Arguments:
> > +
> > +        `variable` -- the variable name. This will be fetched and
> expanded
> > +        (using d.getVar(variable)) and then split into a set.
> > +
> > +        `checkvalues` -- if this is a string it is split on whitespace
> into a
> > +        set, otherwise coerced directly into a set.
> > +
> > +        `truevalue` -- the value to return if checkvalues is a subset
> of variable.
> > +
> > +        `falsevalue` -- the value to return if variable is empty or if
> checkvalues
> > +        is not a subset of variable.
> > +
> > +        `d` -- the data store.
> > +
> > +See the occurrence in :term:`TUNE_ASARGS`, :term:`TUNE_LDARGS`,
> > +:ref:`image_types.bbclass <ref-classes-image_types>`, and
> > +:ref:`migration-1.8-bluez` sections.
> > +
> > +``contains_any``
> > +----------------
> > +
> > +Check if a variable contains any values specified.
> > +
> > +::
> > +
> > +    Arguments:
> > +
> > +        `variable` -- the variable name. This will be fetched and
> expanded
> > +        (using d.getVar(variable)) and then split into a set.
> > +
> > +        `checkvalues` -- if this is a string it is split on whitespace
> into a
> > +        set, otherwise coerced directly into a set.
> > +
> > +        `truevalue` -- the value to return if checkvalues is a subset
> of variable.
> > +
> > +        `falsevalue` -- the value to return if variable is empty or if
> checkvalues
> > +        is not a subset of variable.
> > +
> > +        `d` -- the data store.
> > +
> > +See the occurrence in :ref:`image_types.bbclass
> <ref-classes-image_types>`
> > +section.
> > +
> > +``copyfile``
> > +------------
> > +
> > +Copies a file from src to dest, preserving all permissions and
> attributes;
> > +mtime will be preserved even when moving across filesystems.
> > +
> > +Returns `true` on success and `false` on failure.
> > +
> > +``edit_bblayers_conf``
> > +----------------------
> > +
> > +Edit ``bblayers.conf``, adding and/or removing layers
> > +
> > +::
> > +
> > +    Parameters:
> > +
> > +        `bblayers_conf` -- path to bblayers.conf file to edit
> > +
> > +        `add` -- layer path (or list of layer paths) to add; None or
> empty list
> > +        to add nothing
> > +
> > +        `remove` -- layer path (or list of layer paths) to remove; None
> or
> > +        empty list to remove nothing
> > +
> > +        `edit_cb` -- optional callback function that will be called
> after
> > +        processing adds/removes once per existing entry.
> > +
> > +    Returns a tuple:
> > +
> > +        `notadded` -- list of layers specified to be added but were not
> > +        (because they were already in the list)
> > +
> > +        `notremoved` -- list of layers that were specified to be
> removed but
> > +        were not (because they were not in the list)
> > +
> > +``edit_metadata``
> > +-----------------
> > +
> > +Edit lines from a recipe or config file and modify one or more specified
> > +variable values set in the file using a specified callback function.
> > +Lines are expected to have trailing newlines.
> > +
> > +::
> > +
> > +    Parameters:
> > +
> > +        `meta_lines` -- lines from the file; can be a list or an
> iterable
> > +        (e.g. file pointer)
> > +
> > +        `variables` -- a list of variable names to look for.
> > +        Functions may also be specified, but must be specified with '()'
> > +        at the end of the name. Note that the function does not have
> any intrinsic
> > +        understanding of _append, _prepend, _remove, or overrides,
> > +        so these are considered as part of the name. These values go
> into
> > +        a regular expression, so regular expression syntax is allowed.
> > +
> > +        `varfunc` -- callback function called for every variable
> matching
> > +        one of the entries in the variables parameter.
> > +
> > +            The function should take four arguments:
> > +
> > +                `varname` -- name of variable matched
> > +
> > +                `origvalue` -- current value in file
> > +
> > +                `op` -- the operator (e.g. '+-')
> > +
> > +                `newlines` --  list of lines up to this point.
> > +                You can use this to prepend lines before this variable
> setting
> > +                if you wish.
> > +
> > +            and should return a four-element tuple:
> > +
> > +                `newvalue` -- new value to substitute in, or None to
> drop the
> > +                variable setting entirely. (If the removal results in
> two
> > +                consecutive blank lines, one of the blank lines will
> also
> > +                dropped).
> > +
> > +                `newop` -- the operator to use - if you specify None
> here,
> > +                the original operation will be used.
> > +
> > +                `indent` -- number of spaces to indent multi-line
> entries,
> > +                or -1 to indent up to the level of the assignment and
> opening
> > +                quote, or a string to use as the indent.
> > +
> > +                `minbreak` -- True to allow the first element of a
> multi-line
> > +                value to continue on the same line as the assignment,
> > +                False to indent before the first element.
> > +
> > +        To clarify, if you wish not to change the value, then you would
> return
> > +        like this: return origvalue, None, 0, True
> > +        match_overrides: True to match items with _overrides on the end,
> > +        False otherwise
> > +
> > +    Returns a tuple:
> > +
> > +        `updated`:
> > +            True if changes were made, False otherwise.
> > +        `newlines`:
> > +            Lines after processing
> > +
> > +``edit_metadata_file``
> > +----------------------
> > +
> > +Edit a recipe or config file and modify one or more specified variable
> values
> > +set in the file using a specified callback function. The file is only
> written
> > +to if the value(s) actually change.
> > +This is basically the file version of ``edit_metadata``, see that
> function's
> > +description for parameter/usage information.
> > +
> > +Returns `True` if the file was written to, `False` otherwise.
> > +
> > +``empty_environment``
> > +---------------------
> > +
> > +Remove all variables from the environment.
> > +
> > +``exec_flat_python_func``
> > +-------------------------
> > +
> > +Execute a flat python function (defined with def funcname(args):...)
> > +
> > +``explode_deps``
> > +----------------
> > +
> > +Take an RDEPENDS style string of format:
> > +::
> > +
> > +    "DEPEND1 (optional version) DEPEND2 (optional version) ..."
> > +
> > +and return a list of dependencies. Version information is ignored.
> > +
> > +``explode_dep_versions``
> > +------------------------
> > +
> > +Take an RDEPENDS style string of format:
> > +::
> > +
> > +    "DEPEND1 (optional version) DEPEND2 (optional version) ..."
> > +
> > +skip null value and items appeared in dependancy string multiple times
> and
> > +return a dictionary of dependencies and versions.
> > +
> > +``explode_dep_versions2``
> > +-------------------------
> > +
> > +Take an RDEPENDS style string of format:
> > +::
> > +
> > +    "DEPEND1 (optional version) DEPEND2 (optional version) ..."
> > +
> > +and return a dictionary of dependencies and versions.
> > +
> > +``export_proxies``
> > +------------------
> > +
> > +export common proxies variables from datastore to environment.
> > +
> > +``fileslocked``
> > +---------------
> > +
> > +Context manager for locking and unlocking file locks.
> > +
> > +``filter``
> > +----------
> > +
> > +Return all words in the variable that are present in the checkvalues.
> > +
> > +::
> > +
> > +    Arguments:
> > +
> > +        `variable` -- the variable name. This will be fetched and
> expanded
> > +        (using d.getVar(variable)) and then split into a set.
> > +
> > +        `checkvalues` -- if this is a string it is split on whitespace
> into a
> > +        set, otherwise coerced directly into a set.
> > +
> > +        `d` -- the data store.
> > +
> > +``filter_environment``
> > +----------------------
> > +
> > +Create a pristine environment for Bitbake. This will remove variables
> that are
> > +not known and may influence the build in a negative way.
> > +
> > +``get_file_layer``
> > +------------------
> > +
> > +Determine the collection (as defined by a layer's ``layer.conf`` file)
> > +containing the specified file.
> > +
> > +``get_referenced_vars``
> > +-----------------------
> > +
> > +Return names of vars referenced in `start_expr` (recursively),
> > +in quasi-BFS order (variables within the same level are ordered
> arbitrarily)
> > +
> > +``is_semver``
> > +-------------
> > +
> > +Is the version string following the semver semantic?
> > +
> > +    https://semver.org/spec/v2.0.0.html
> > +
> > +``join_deps``
> > +-------------
> > +
> > +Take the result from ``explode_dep_versions`` and generate a dependency
> string.
> > +
> > +``lockfile``
> > +------------
> > +
> > +Use the specified file as a lock file, return when the lock has been
> acquired.
> > +Returns a variable to pass to ``unlockfile``.
> > +
> > +::
> > +
> > +    Parameters:
> > +
> > +        `retry`: `True` to re-try locking if it fails, `False` otherwise
> > +
> > +        `block`: `True` to block until the lock succeeds, `False`
> otherwise
> > +
> > +The `retry` and `block` parameters are kind of equivalent unless you
> consider
> > +the possibility of sending a signal to the process to breakout - at
> which point
> > +you want block-True rather than retry-True.
> > +
> > +``md5_file``
> > +------------
> > +
> > +Return the hex string representation of the MD5 checksum of filename.
> > +
> > +``mkdirhier``
> > +-------------
> > +
> > +Create a directory like 'mkdir -p', but does not complain if directory
> already
> > +exists like os.makedirs
> > +
> > +``movefile``
> > +------------
> > +
> > +Moves a file from ``src`` to `dest`, preserving all permissions and
> attributes;
> > +``mtime`` will be preserved even when moving across filesystems.
> > +
> > +Returns `true` on success and `false` on failure. Move is atomic.
> > +
> > +``preserved_envvars``
> > +---------------------
> > +
> > +Variables which are taken from the environment and placed in the
> metadata.
> > +
> > +``preserved_envvars_exported``
> > +------------------------------
> > +
> > +Variables which are taken from the environment and placed in and
> exported from
> > +the metadata.
> > +
> > +``prunedir``
> > +------------
> > +
> > +Delete everything reachable from the directory named in `'topdir'`.
> > +
> > +``prune_suffix``
> > +----------------
> > +
> > +See if var ends with any of the suffixes listed and remove it if found .
> > +
> > +``remove``
> > +----------
> > +
> > +Equivalent to rm -f ``xx`` or rm -rf ``xx``.
> > +
> > +``sha1_file``
> > +-------------
> > +
> > +Return the hex string representation of the SHA1 checksum of the
> filename.
> > +
> > +``sha256_file``
> > +---------------
> > +
> > +Return the hex string representation of the 256-bit SHA checksum of
> filename.
> > +
> > +``sha384_file``
> > +---------------
> > +
> > +Return the hex string representation of the SHA384 checksum of the
> filename.
> > +
> > +``sha512_file``
> > +---------------
> > +
> > +Return the hex string representation of the SHA512 checksum of the
> filename.
> > +
> > +``signal_on_parent_exit``
> > +-------------------------
> > +
> > +Trigger signame to be sent when the parent process dies.
> > +
> > +``split_version``
> > +-----------------
> > +
> > +Split a version string into its constituent parts
> > +(:term:`PE`, :term:`PV`, :term:`PR`).
> > +
> > +``to_boolean``
> > +--------------
> > +
> > +Check input string and return boolean value True/False/None depending
> upon the
> > +checks.
> > +
> > +``umask``
> > +---------
> > +
> > +Context manager to set the umask to a specific mask, and restore it
> afterwards.
> > +
> > +``unlockfile``
> > +--------------
> > +
> > +Unlock a file locked using ``lockfile``.
> > +
> > +``vercmp_string``
> > +-----------------
> > +
> > +Split version strings and compare them.
> > +
> > +``vercmp_string_op``
> > +--------------------
> > +
> > +Compare two versions and check if the specified comparison operator
> matches
> > +the result of the comparison. This function is fairly liberal about what
> > +operators it will accept since there are a variety of styles depending
> on
> > +the context.
> > +
> > +``VersionStringException``
> > +--------------------------
> > +
> > +Exception raised when an invalid version specification is found.
> > +
> > +``which``
> > +---------
> > +
> > +Locate `item` in the list of paths `path` (colon separated string like
> $PATH).
> > +If `direction` is non-zero then the list is reversed.
> > +If `history` is True then the list of candidates also returned as
> result,
> > +history.
> > +If `executable` is True then the candidate has to be an executable file,
> > +otherwise the candidate simply has to exist.
> > +
> > +``_check_unsafe_delete_path``
> > +-----------------------------
> > +
> > +Basic safeguard against recursively deleting something we should not.
> > +If it returns True, the caller should raise an exception with
> > +an appropriate message.
> > +
> > +.. note::
> > +
> > +    This is NOT meant to be a security mechanism -
> > +    just a guard against silly mistakes with potentially disastrous
> results.
> > +
> > +``_print_trace``
> > +----------------
> > +
> > +Print the Environment of a Text Body.
> >
> >
> >
> > 
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

--000000000000e0480a05c6aa05f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif">Hello All,</div><div class=3D"gmail_default" style=3D"font-famil=
y:tahoma,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-f=
amily:tahoma,sans-serif">My Patch-v2 has not been reviewed yet. Looking for=
ward to see some updates on it.</div><div class=3D"gmail_default" style=3D"=
font-family:tahoma,sans-serif"><a href=3D"https://lists.yoctoproject.org/g/=
docs/message/903">https://lists.yoctoproject.org/g/docs/message/903</a></di=
v><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-serif"><a h=
ref=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9612">https://bu=
gzilla.yoctoproject.org/show_bug.cgi?id=3D9612</a></div><div><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr"><div><br></div><div><span style=3D"font-family:tahoma,sans-serif"><fo=
nt size=3D"2"><span style=3D"color:rgb(0,0,0)">Thanks &amp; Regards,</span>=
</font></span></div><div><span style=3D"font-family:Arial,sans-serif;font-s=
ize:11pt;color:#1793d2"><span style=3D"font-family:tahoma,sans-serif"><font=
 size=3D"2"><span style=3D"color:rgb(0,0,0)">Milan Shah</span></font></span=
><br></span></div><div><br></div><div>
<table style=3D"width:525px;font-size:11pt;font-family:Arial,sans-serif" c=
ellspacing=3D"0" cellpadding=3D"0">
<tbody>
 <tr>
  <td style=3D"font-size:10pt;font-family:Arial,sans-serif;border-right:1p=
x solid;border-right-color:#fb6303;width:125px;padding-right:10px;vertical-=
align:top" rowspan=3D"6" width=3D"125" valign=3D"top">
	=09<a href=3D"https://www.mvista.com/" target=3D"_blank"><img src=3D"http=
s://docs.google.com/uc?export=3Ddownload&amp;id=3D1Qm7yQfvCvd_kh_U4m6GVByOd=
aJDPquiJ&amp;revid=3D0B4U1D7fiiJwsSjRjMWRWSnByanRKcyszUkE3TzNKcHVZTFlNPQ"><=
/a>
	=09  =20
  </td>
    
 <td style=3D"padding-left:10px">
  <table cellspacing=3D"0" cellpadding=3D"0">
  <tbody>
    <tr>
      <td style=3D"font-size:10pt;color:#0079ac;font-family:Arial,sans-ser=
if;width:400px;padding-bottom:5px;padding-left:10px;vertical-align:top" val=
ign=3D"top">
       <b><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color=
:#fb6303">Milan Shah</span></b>
       <b style=3D"font-family:Arial,sans-serif;font-size:11pt;color:#0000=
00"><span> | </span>Software Engineer</b>
      </td>
    </tr>=20
    <tr>
      <td style=3D"font-size:10pt;color:#444444;font-family:Arial,sans-ser=
if;padding-bottom:5px;padding-top:5px;padding-left:10px;vertical-align:top;=
line-height:17px" valign=3D"top">
	 =20
	=09<span>
	=09	<span style=3D"color:#fb6303"><b>a: </b></span>
	=09</span>
	=09<span>
	=09	<span style=3D"font-family:Arial,sans-serif;font-size:10pt;color:#000=
000">MontaVista Software, LLC</span>  =20
	=09</span>
	=09<span>
	=09	<span style=3D"font-size:10pt;font-family:Arial,sans-serif;color:#000=
000"><span> | </span>Bangalore, India</span>
	=09=09
	=09</span>
	=09
	=09<span><br></span>
	=09<span><span style=3D"color:#fb6303"><b>e:</b></span><span style=3D"fon=
t-size:10pt;font-family:Arial,sans-serif;color:#000000"> <a href=3D"mailto:=
info@mvista.com" target=3D"_blank">info@mvista.com</a></span></span>
	=09<span><span> | </span><span style=3D"color:#fb6303"><b>w:</b></span><a=
 href=3D"http://www.mvista.com/" rel=3D"noopener" style=3D"text-decoration:=
none" target=3D"_blank"><span style=3D"font-size:10pt;font-family:Arial,san=
s-serif;color:#000000"> www.mvista.com/</span></a></span>
        
	=09<span><br></span>
	=09
        <span><span style=3D"color:#fb6303"><b>p:</b></span><span style=3D=
"font-size:10pt;font-family:Arial,sans-serif;color:#000000"> +91-80-4939-50=
00</span></span>
        
      </td>
    </tr>
    
    
  </tbody>
  </table>
 </td></tr>=20
</tbody>
</table>
</div></div></div></div><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, May 20, 2021 at 6:43 AM Randy MacLeo=
d &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macleod@windrive=
r.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Add: <a href=3D"mailto:michael.opdenacker@bootlin.com" target=3D"_blan=
k">michael.opdenacker@bootlin.com</a><br>
<br>
and ping since Milan asked about this in:<br>
=C2=A0 =C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D9612" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoprojec=
t.org/show_bug.cgi?id=3D9612</a><br>
../Randy<br>
<br>
<br>
On 2021-03-15 1:47 a.m., Milan Shah wrote:<br>
&gt; Added a new &quot;library functions&quot; section to the manual in th=
e reference manual<br>
&gt; in the yocto-docs repository and document the utils functions to star=
t with.<br>
&gt; <br>
&gt; See Yocto Bug [#9612] for the details.<br>
&gt; <br>
&gt; Signed-off-by: Milan Shah &lt;<a href=3D"mailto:mshah@mvista.com" tar=
get=3D"_blank">mshah@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0documentation/ref-manual/index.rst=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0documentation/ref-manual/library-functions.rst | 467 ++++=
+++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 468 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 documentation/ref-manual/library-funct=
ions.rst<br>
&gt; <br>
&gt; diff --git a/documentation/ref-manual/index.rst b/documentation/ref-m=
anual/index.rst<br>
&gt; index deb0383..e351142 100644<br>
&gt; --- a/documentation/ref-manual/index.rst<br>
&gt; +++ b/documentation/ref-manual/index.rst<br>
&gt; @@ -17,6 +17,7 @@ Yocto Project Reference Manual<br>
&gt;=C2=A0 =C2=A0 =C2=A0 structure<br>
&gt;=C2=A0 =C2=A0 =C2=A0 classes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tasks<br>
&gt; +=C2=A0 =C2=A0library-functions<br>
&gt;=C2=A0 =C2=A0 =C2=A0 devtool-reference<br>
&gt;=C2=A0 =C2=A0 =C2=A0 kickstart<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qa-checks<br>
&gt; diff --git a/documentation/ref-manual/library-functions.rst b/documen=
tation/ref-manual/library-functions.rst<br>
&gt; new file mode 100644<br>
&gt; index 0000000..55c8339<br>
&gt; --- /dev/null<br>
&gt; +++ b/documentation/ref-manual/library-functions.rst<br>
&gt; @@ -0,0 +1,467 @@<br>
&gt; +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK<br>
&gt; +<br>
&gt; +*****************<br>
&gt; +Library Functions<br>
&gt; +*****************<br>
&gt; +<br>
&gt; +utils functions<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +The Bitbake Utility Functions ``utils.py`` provides some useful pyth=
on<br>
&gt; +functions that are typically used in ``meta/classes/utils.bbclass``.=
<br>
&gt; +<br>
&gt; +See :ref:`ref-manual/migration-1.6:Python Definition substitutions` =
for the<br>
&gt; +reference of some python definitions.<br>
&gt; +<br>
&gt; +``approved_variables``<br>
&gt; +----------------------<br>
&gt; +<br>
&gt; +Determine and return the list of whitelisted variables which are app=
roved to<br>
&gt; +remain in the environment.<br>
&gt; +<br>
&gt; +``better_compile``<br>
&gt; +------------------<br>
&gt; +<br>
&gt; +A better compile method. This method will print the offending lines.=
<br>
&gt; +<br>
&gt; +``better_exec``<br>
&gt; +---------------<br>
&gt; +<br>
&gt; +Similiar to ``better_compile``, ``better_exec`` will print the lines=
 that are<br>
&gt; +responsible for the error.<br>
&gt; +<br>
&gt; +``break_hardlinks``<br>
&gt; +-------------------<br>
&gt; +<br>
&gt; +Ensures ``src`` is the only hardlink to this file.=C2=A0 Other hardl=
inks, if any,<br>
&gt; +are not affected (other than in their st_nlink value, of course).<br=
>
&gt; +<br>
&gt; +Returns `true` on success and `false` on failure.<br>
&gt; +<br>
&gt; +``build_environment``<br>
&gt; +---------------------<br>
&gt; +<br>
&gt; +Build an environment from all exported variables.<br>
&gt; +<br>
&gt; +``clean_environment``<br>
&gt; +---------------------<br>
&gt; +<br>
&gt; +Clean up any spurious environment variables. This will remove any va=
riables<br>
&gt; +the user has not chosen to preserve.<br>
&gt; +<br>
&gt; +``contains``<br>
&gt; +------------<br>
&gt; +<br>
&gt; +Check if a variable contains all the values specified.<br>
&gt; +<br>
&gt; +::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Arguments:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `variable` -- the variable name. This wi=
ll be fetched and expanded<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (using d.getVar(variable)) and then spli=
t into a set.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `checkvalues` -- if this is a string it =
is split on whitespace into a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 set, otherwise coerced directly into a s=
et.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `truevalue` -- the value to return if ch=
eckvalues is a subset of variable.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `falsevalue` -- the value to return if v=
ariable is empty or if checkvalues<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 is not a subset of variable.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `d` -- the data store.<br>
&gt; +<br>
&gt; +See the occurrence in :term:`TUNE_ASARGS`, :term:`TUNE_LDARGS`,<br>
&gt; +:ref:`image_types.bbclass &lt;ref-classes-image_types&gt;`, and<br>
&gt; +:ref:`migration-1.8-bluez` sections.<br>
&gt; +<br>
&gt; +``contains_any``<br>
&gt; +----------------<br>
&gt; +<br>
&gt; +Check if a variable contains any values specified.<br>
&gt; +<br>
&gt; +::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Arguments:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `variable` -- the variable name. This wi=
ll be fetched and expanded<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (using d.getVar(variable)) and then spli=
t into a set.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `checkvalues` -- if this is a string it =
is split on whitespace into a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 set, otherwise coerced directly into a s=
et.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `truevalue` -- the value to return if ch=
eckvalues is a subset of variable.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `falsevalue` -- the value to return if v=
ariable is empty or if checkvalues<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 is not a subset of variable.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `d` -- the data store.<br>
&gt; +<br>
&gt; +See the occurrence in :ref:`image_types.bbclass &lt;ref-classes-imag=
e_types&gt;`<br>
&gt; +section.<br>
&gt; +<br>
&gt; +``copyfile``<br>
&gt; +------------<br>
&gt; +<br>
&gt; +Copies a file from src to dest, preserving all permissions and attri=
butes;<br>
&gt; +mtime will be preserved even when moving across filesystems.<br>
&gt; +<br>
&gt; +Returns `true` on success and `false` on failure.<br>
&gt; +<br>
&gt; +``edit_bblayers_conf``<br>
&gt; +----------------------<br>
&gt; +<br>
&gt; +Edit ``bblayers.conf``, adding and/or removing layers<br>
&gt; +<br>
&gt; +::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Parameters:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `bblayers_conf` -- path to bblayers.conf=
 file to edit<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `add` -- layer path (or list of layer pa=
ths) to add; None or empty list<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 to add nothing<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `remove` -- layer path (or list of layer=
 paths) to remove; None or<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 empty list to remove nothing<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `edit_cb` -- optional callback function =
that will be called after<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 processing adds/removes once per existin=
g entry.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Returns a tuple:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `notadded` -- list of layers specified t=
o be added but were not<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (because they were already in the list)<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `notremoved` -- list of layers that were=
 specified to be removed but<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 were not (because they were not in the l=
ist)<br>
&gt; +<br>
&gt; +``edit_metadata``<br>
&gt; +-----------------<br>
&gt; +<br>
&gt; +Edit lines from a recipe or config file and modify one or more speci=
fied<br>
&gt; +variable values set in the file using a specified callback function.=
<br>
&gt; +Lines are expected to have trailing newlines.<br>
&gt; +<br>
&gt; +::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Parameters:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `meta_lines` -- lines from the file; can=
 be a list or an iterable<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (e.g. file pointer)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `variables` -- a list of variable names =
to look for.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Functions may also be specified, but mus=
t be specified with &#39;()&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 at the end of the name. Note that the fu=
nction does not have any intrinsic<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 understanding of _append, _prepend, _rem=
ove, or overrides,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 so these are considered as part of the n=
ame. These values go into<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 a regular expression, so regular express=
ion syntax is allowed.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `varfunc` -- callback function called fo=
r every variable matching<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 one of the entries in the variables para=
meter.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The function should take f=
our arguments:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `varname` --=
 name of variable matched<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `origvalue` =
-- current value in file<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `op` -- the =
operator (e.g. &#39;+-&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `newlines` -=
-=C2=A0 list of lines up to this point.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 You can use =
this to prepend lines before this variable setting<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if you wish.=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and should return a four-e=
lement tuple:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `newvalue` -=
- new value to substitute in, or None to drop the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variable set=
ting entirely. (If the removal results in two<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 consecutive =
blank lines, one of the blank lines will also<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dropped).<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `newop` -- t=
he operator to use - if you specify None here,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the original=
 operation will be used.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `indent` -- =
number of spaces to indent multi-line entries,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 or -1 to ind=
ent up to the level of the assignment and opening<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 quote, or a =
string to use as the indent.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `minbreak` -=
- True to allow the first element of a multi-line<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value to con=
tinue on the same line as the assignment,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 False to ind=
ent before the first element.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 To clarify, if you wish not to change th=
e value, then you would return<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 like this: return origvalue, None, 0, Tr=
ue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 match_overrides: True to match items wit=
h _overrides on the end,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 False otherwise<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Returns a tuple:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `updated`:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 True if changes were made,=
 False otherwise.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `newlines`:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Lines after processing<br>
&gt; +<br>
&gt; +``edit_metadata_file``<br>
&gt; +----------------------<br>
&gt; +<br>
&gt; +Edit a recipe or config file and modify one or more specified variab=
le values<br>
&gt; +set in the file using a specified callback function. The file is onl=
y written<br>
&gt; +to if the value(s) actually change.<br>
&gt; +This is basically the file version of ``edit_metadata``, see that fu=
nction&#39;s<br>
&gt; +description for parameter/usage information.<br>
&gt; +<br>
&gt; +Returns `True` if the file was written to, `False` otherwise.<br>
&gt; +<br>
&gt; +``empty_environment``<br>
&gt; +---------------------<br>
&gt; +<br>
&gt; +Remove all variables from the environment.<br>
&gt; +<br>
&gt; +``exec_flat_python_func``<br>
&gt; +-------------------------<br>
&gt; +<br>
&gt; +Execute a flat python function (defined with def funcname(args):...)=
<br>
&gt; +<br>
&gt; +``explode_deps``<br>
&gt; +----------------<br>
&gt; +<br>
&gt; +Take an RDEPENDS style string of format:<br>
&gt; +::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 &quot;DEPEND1 (optional version) DEPEND2 (optional ver=
sion) ...&quot;<br>
&gt; +<br>
&gt; +and return a list of dependencies. Version information is ignored.<b=
r>
&gt; +<br>
&gt; +``explode_dep_versions``<br>
&gt; +------------------------<br>
&gt; +<br>
&gt; +Take an RDEPENDS style string of format:<br>
&gt; +::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 &quot;DEPEND1 (optional version) DEPEND2 (optional ver=
sion) ...&quot;<br>
&gt; +<br>
&gt; +skip null value and items appeared in dependancy string multiple tim=
es and<br>
&gt; +return a dictionary of dependencies and versions.<br>
&gt; +<br>
&gt; +``explode_dep_versions2``<br>
&gt; +-------------------------<br>
&gt; +<br>
&gt; +Take an RDEPENDS style string of format:<br>
&gt; +::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 &quot;DEPEND1 (optional version) DEPEND2 (optional ver=
sion) ...&quot;<br>
&gt; +<br>
&gt; +and return a dictionary of dependencies and versions.<br>
&gt; +<br>
&gt; +``export_proxies``<br>
&gt; +------------------<br>
&gt; +<br>
&gt; +export common proxies variables from datastore to environment.<br>
&gt; +<br>
&gt; +``fileslocked``<br>
&gt; +---------------<br>
&gt; +<br>
&gt; +Context manager for locking and unlocking file locks.<br>
&gt; +<br>
&gt; +``filter``<br>
&gt; +----------<br>
&gt; +<br>
&gt; +Return all words in the variable that are present in the checkvalues=
.<br>
&gt; +<br>
&gt; +::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Arguments:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `variable` -- the variable name. This wi=
ll be fetched and expanded<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (using d.getVar(variable)) and then spli=
t into a set.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `checkvalues` -- if this is a string it =
is split on whitespace into a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 set, otherwise coerced directly into a s=
et.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `d` -- the data store.<br>
&gt; +<br>
&gt; +``filter_environment``<br>
&gt; +----------------------<br>
&gt; +<br>
&gt; +Create a pristine environment for Bitbake. This will remove variable=
s that are<br>
&gt; +not known and may influence the build in a negative way.<br>
&gt; +<br>
&gt; +``get_file_layer``<br>
&gt; +------------------<br>
&gt; +<br>
&gt; +Determine the collection (as defined by a layer&#39;s ``layer.conf``=
 file)<br>
&gt; +containing the specified file.<br>
&gt; +<br>
&gt; +``get_referenced_vars``<br>
&gt; +-----------------------<br>
&gt; +<br>
&gt; +Return names of vars referenced in `start_expr` (recursively),<br>
&gt; +in quasi-BFS order (variables within the same level are ordered arbi=
trarily)<br>
&gt; +<br>
&gt; +``is_semver``<br>
&gt; +-------------<br>
&gt; +<br>
&gt; +Is the version string following the semver semantic?<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 <a href=3D"https://semver.org/spec/v2.0.0.html" rel=3D=
"noreferrer" target=3D"_blank">https://semver.org/spec/v2.0.0.html</a><br>
&gt; +<br>
&gt; +``join_deps``<br>
&gt; +-------------<br>
&gt; +<br>
&gt; +Take the result from ``explode_dep_versions`` and generate a depende=
ncy string.<br>
&gt; +<br>
&gt; +``lockfile``<br>
&gt; +------------<br>
&gt; +<br>
&gt; +Use the specified file as a lock file, return when the lock has been=
 acquired.<br>
&gt; +Returns a variable to pass to ``unlockfile``.<br>
&gt; +<br>
&gt; +::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Parameters:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `retry`: `True` to re-try locking if it =
fails, `False` otherwise<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 `block`: `True` to block until the lock =
succeeds, `False` otherwise<br>
&gt; +<br>
&gt; +The `retry` and `block` parameters are kind of equivalent unless you=
 consider<br>
&gt; +the possibility of sending a signal to the process to breakout - at =
which point<br>
&gt; +you want block-True rather than retry-True.<br>
&gt; +<br>
&gt; +``md5_file``<br>
&gt; +------------<br>
&gt; +<br>
&gt; +Return the hex string representation of the MD5 checksum of filename=
.<br>
&gt; +<br>
&gt; +``mkdirhier``<br>
&gt; +-------------<br>
&gt; +<br>
&gt; +Create a directory like &#39;mkdir -p&#39;, but does not complain if=
 directory already<br>
&gt; +exists like os.makedirs<br>
&gt; +<br>
&gt; +``movefile``<br>
&gt; +------------<br>
&gt; +<br>
&gt; +Moves a file from ``src`` to `dest`, preserving all permissions and =
attributes;<br>
&gt; +``mtime`` will be preserved even when moving across filesystems.<br>
&gt; +<br>
&gt; +Returns `true` on success and `false` on failure. Move is atomic.<br=
>
&gt; +<br>
&gt; +``preserved_envvars``<br>
&gt; +---------------------<br>
&gt; +<br>
&gt; +Variables which are taken from the environment and placed in the met=
adata.<br>
&gt; +<br>
&gt; +``preserved_envvars_exported``<br>
&gt; +------------------------------<br>
&gt; +<br>
&gt; +Variables which are taken from the environment and placed in and exp=
orted from<br>
&gt; +the metadata.<br>
&gt; +<br>
&gt; +``prunedir``<br>
&gt; +------------<br>
&gt; +<br>
&gt; +Delete everything reachable from the directory named in `&#39;topdir=
&#39;`.<br>
&gt; +<br>
&gt; +``prune_suffix``<br>
&gt; +----------------<br>
&gt; +<br>
&gt; +See if var ends with any of the suffixes listed and remove it if fou=
nd .<br>
&gt; +<br>
&gt; +``remove``<br>
&gt; +----------<br>
&gt; +<br>
&gt; +Equivalent to rm -f ``xx`` or rm -rf ``xx``.<br>
&gt; +<br>
&gt; +``sha1_file``<br>
&gt; +-------------<br>
&gt; +<br>
&gt; +Return the hex string representation of the SHA1 checksum of the fil=
ename.<br>
&gt; +<br>
&gt; +``sha256_file``<br>
&gt; +---------------<br>
&gt; +<br>
&gt; +Return the hex string representation of the 256-bit SHA checksum of =
filename.<br>
&gt; +<br>
&gt; +``sha384_file``<br>
&gt; +---------------<br>
&gt; +<br>
&gt; +Return the hex string representation of the SHA384 checksum of the f=
ilename.<br>
&gt; +<br>
&gt; +``sha512_file``<br>
&gt; +---------------<br>
&gt; +<br>
&gt; +Return the hex string representation of the SHA512 checksum of the f=
ilename.<br>
&gt; +<br>
&gt; +``signal_on_parent_exit``<br>
&gt; +-------------------------<br>
&gt; +<br>
&gt; +Trigger signame to be sent when the parent process dies.<br>
&gt; +<br>
&gt; +``split_version``<br>
&gt; +-----------------<br>
&gt; +<br>
&gt; +Split a version string into its constituent parts<br>
&gt; +(:term:`PE`, :term:`PV`, :term:`PR`).<br>
&gt; +<br>
&gt; +``to_boolean``<br>
&gt; +--------------<br>
&gt; +<br>
&gt; +Check input string and return boolean value True/False/None dependin=
g upon the<br>
&gt; +checks.<br>
&gt; +<br>
&gt; +``umask``<br>
&gt; +---------<br>
&gt; +<br>
&gt; +Context manager to set the umask to a specific mask, and restore it =
afterwards.<br>
&gt; +<br>
&gt; +``unlockfile``<br>
&gt; +--------------<br>
&gt; +<br>
&gt; +Unlock a file locked using ``lockfile``.<br>
&gt; +<br>
&gt; +``vercmp_string``<br>
&gt; +-----------------<br>
&gt; +<br>
&gt; +Split version strings and compare them.<br>
&gt; +<br>
&gt; +``vercmp_string_op``<br>
&gt; +--------------------<br>
&gt; +<br>
&gt; +Compare two versions and check if the specified comparison operator =
matches<br>
&gt; +the result of the comparison. This function is fairly liberal about =
what<br>
&gt; +operators it will accept since there are a variety of styles dependi=
ng on<br>
&gt; +the context.<br>
&gt; +<br>
&gt; +``VersionStringException``<br>
&gt; +--------------------------<br>
&gt; +<br>
&gt; +Exception raised when an invalid version specification is found.<br>
&gt; +<br>
&gt; +``which``<br>
&gt; +---------<br>
&gt; +<br>
&gt; +Locate `item` in the list of paths `path` (colon separated string li=
ke $PATH).<br>
&gt; +If `direction` is non-zero then the list is reversed.<br>
&gt; +If `history` is True then the list of candidates also returned as re=
sult,<br>
&gt; +history.<br>
&gt; +If `executable` is True then the candidate has to be an executable f=
ile,<br>
&gt; +otherwise the candidate simply has to exist.<br>
&gt; +<br>
&gt; +``_check_unsafe_delete_path``<br>
&gt; +-----------------------------<br>
&gt; +<br>
&gt; +Basic safeguard against recursively deleting something we should not=
.<br>
&gt; +If it returns True, the caller should raise an exception with<br>
&gt; +an appropriate message.<br>
&gt; +<br>
&gt; +.. note::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 This is NOT meant to be a security mechanism -<br>
&gt; +=C2=A0 =C2=A0 just a guard against silly mistakes with potentially d=
isastrous results.<br>
&gt; +<br>
&gt; +``_print_trace``<br>
&gt; +----------------<br>
&gt; +<br>
&gt; +Print the Environment of a Text Body.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
</blockquote></div>

--000000000000e0480a05c6aa05f2--
