Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.1741.1632246976019045202
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Sep 2021 10:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1D7A140006;
	Tue, 21 Sep 2021 17:56:12 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: extend explanation of PACKAGE_DEBUG_SPLIT_STYLE
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <b9acb74f-7823-f8cc-f6f4-9d45fd5dace8@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <e6dc3636-7b2c-f63b-5564-90d4df0478a3@bootlin.com>
Date: Tue, 21 Sep 2021 19:56:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b9acb74f-7823-f8cc-f6f4-9d45fd5dace8@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

On 9/18/21 1:57 PM, Robert P. J. Day wrote:
> The current explanation of this variable seems incomplete, so be a
> bit more verbose to make sure the reader understands the packaging
> possibilities.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 5caada626..a46ea186e 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5064,33 +5064,39 @@ system and gives an overview of their function and contents.
>        ":ref:`package.bbclass <ref-classes-package>`" section.
>
>     :term:`PACKAGE_DEBUG_SPLIT_STYLE`
> -      Determines how to split up the binary and debug information when
> -      creating ``*-dbg`` packages to be used with the GNU Project Debugger
> -      (GDB).
> -
> -      With the :term:`PACKAGE_DEBUG_SPLIT_STYLE` variable, you can control
> -      where debug information, which can include or exclude source files,
> -      is stored:
> -
> -      -  ".debug": Debug symbol files are placed next to the binary in a
> -         ``.debug`` directory on the target. For example, if a binary is
> -         installed into ``/bin``, the corresponding debug symbol files are
> -         installed in ``/bin/.debug``. Source files are placed in
> -         ``/usr/src/debug``.
> -
> -      -  "debug-file-directory": Debug symbol files are placed under
> -         ``/usr/lib/debug`` on the target, and separated by the path from
> -         where the binary is installed. For example, if a binary is
> -         installed in ``/bin``, the corresponding debug symbols are
> -         installed in ``/usr/lib/debug/bin``. Source files are placed in
> -         ``/usr/src/debug``.
> -
> -      -  "debug-without-src": The same behavior as ".debug" previously
> -         described with the exception that no source files are installed.
> -
> -      -  "debug-with-srcpkg": The same behavior as ".debug" previously
> -         described with the exception that all source files are placed in a
> -         separate ``*-src`` pkg. This is the default behavior.
> +      Determines how to split up and package debug and source information
> +      when creating debugging packages to be used with the GNU Project
> +      Debugger (GDB). In general, based on the value of this variable,
> +      you can combine the source and debug info in a single package,
> +      you can break out the source into a separate package that can be
> +      installed independently, or you can choose to not have the source
> +      packaged at all.
> +
> +      The possible values of :term:`PACKAGE_DEBUG_SPLIT_STYLE` variable:
> +
> +      -  "``.debug``": All debugging and source info is placed in a single
> +         ``*-dbg`` package; debug symbol files are placed next to the
> +         binary in a ``.debug`` directory so that, if a binary is installed
> +         into ``/bin``, the corresponding debug symbol file is installed
> +         in ``/bin/.debug``. Source files are installed in the same ``*-dbg``
> +         package under ``/usr/src/debug``.
> +
> +      -  "``debug-file-directory``": As above, all debugging and source info
> +         is placed in a single ``*-dbg`` package; debug symbol files are
> +         placed entirely under the directory ``/usr/lib/debug`` and separated
> +         by the path from where the binary is installed, so that if a binary
> +         is installed in ``/bin``, the corresponding debug symbols are installed
> +         in ``/usr/lib/debug/bin``, and so on. As above, source is installed
> +         in the same package under ``/usr/src/debug``.
> +
> +      -  "``debug-with-srcpkg``": Debugging info is placed in the standard
> +         ``*-dbg`` package as with the ``.debug`` value, while source is
> +         placed in a separate ``*-src`` package, which can be installed
> +         independently.  This is the default setting for this variable,
> +         as defined in Poky's ``bitbake.conf`` file.
> +
> +      -  "``debug-without-src``": The same behavior as with the ``.debug``
> +         setting, but no source is packaged at all.
>
>        You can find out more about debugging using GDB by reading the
>        ":ref:`dev-manual/common-tasks:debugging with the gnu project debugger (gdb) remotely`" section


Many thanks for the patch. I agree this clarifies the explanations.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com> ... and
merged in "master-next".

By the way, what about submitting a patch to
https://git.openembedded.org/openembedded-core/tree/meta/conf/local.conf.sample.extended
too, to mention "debug-with-srcpkg" and "debug-without-src" too?

Thanks again,

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

