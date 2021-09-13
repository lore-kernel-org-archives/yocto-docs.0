Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.28771.1631536672856372736
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Sep 2021 05:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DFBF3C0018;
	Mon, 13 Sep 2021 12:37:50 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: render options in monospace to show quotes properly
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <5810ee5d-5d1f-3ac4-fff3-479ae5ea4496@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <b8350db9-e706-53b1-d5a2-6323df9ff30a@bootlin.com>
Date: Mon, 13 Sep 2021 14:37:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5810ee5d-5d1f-3ac4-fff3-479ae5ea4496@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

On 9/6/21 9:22 PM, Robert P. J. Day wrote:
> It's important (at least for now) to mark up options with monospaced
> font to highlight the difference between single and double quotes.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
> index 1862c481d..883f54e39 100644
> --- a/documentation/ref-manual/devtool-reference.rst
> +++ b/documentation/ref-manual/devtool-reference.rst
> @@ -78,7 +78,7 @@ has a number of sub-commands for each function. You can run
>
>  As directed in the general help output, you can
>  get more syntax on a specific command by providing the command name and
> -using "--help"::
> +using ``--help``::
>
>     $ devtool add --help
>     NOTE: Starting bitbake server...
> @@ -471,7 +471,7 @@ Use the ``devtool build`` command to build your recipe. The
>
>  When you use the ``devtool build`` command, you must supply the root
>  name of the recipe (i.e. do not provide versions, paths, or extensions).
> -You can use either the "-s" or the "--disable-parallel-make" options to
> +You can use either the ``-s`` or the ``--disable-parallel-make`` options to
>  disable parallel makes during the build. Here is an example::
>
>     $ devtool build recipe


Thanks for the patch! Agreeing on the direction to take. I'm sure there
are many further places to update.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Applied in master-next.
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

