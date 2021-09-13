Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.29868.1631540877748188190
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Sep 2021 06:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 48E341C000D;
	Mon, 13 Sep 2021 13:47:53 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: remove mention of obsolete devtool "--any-recipe" option
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <dfb2db5e-e71f-a830-8a6d-0f390b7a3bc@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d865320b-8471-6a11-b655-8e582c286fae@bootlin.com>
Date: Mon, 13 Sep 2021 15:47:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <dfb2db5e-e71f-a830-8a6d-0f390b7a3bc@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

On 9/6/21 9:12 PM, Robert P. J. Day wrote:
> Running "devtool edit-recipe -h" produces, in part, the output:
>
>   --any-recipe, -a  Does nothing (exists for backwards-compatibility)
>
> so it seems of little value to continue referring to it.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
> index 1862c481d..6bbbd1a91 100644
> --- a/documentation/ref-manual/devtool-reference.rst
> +++ b/documentation/ref-manual/devtool-reference.rst
> @@ -284,10 +284,7 @@ is identified using the ``EDITOR`` variable, on the specified recipe.
>  When you use the ``devtool edit-recipe`` command, you must supply the
>  root name of the recipe (i.e. no version, paths, or extensions). Also,
>  the recipe file itself must reside in the workspace as a result of the
> -``devtool add`` or ``devtool upgrade`` commands. However, you can
> -override that requirement by using the "-a" or "--any-recipe" option.
> -Using either of these options allows you to edit any recipe regardless
> -of its location.
> +``devtool add`` or ``devtool upgrade`` commands.
>
>  .. _devtool-updating-a-recipe:
>

Thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into "master-next".

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

