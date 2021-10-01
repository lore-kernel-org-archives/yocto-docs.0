Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF997C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 15:33:56 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.9879.1633102435313937222
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Oct 2021 08:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E834EFF802;
	Fri,  1 Oct 2021 15:33:46 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: mention INHIBIT_PACKAGE_DEBUG_SPLIT
 variable
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <898ffd75-d74f-7fe7-3ca7-b818d2c7cab@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d4777a69-5764-2a5f-75e6-06e6187b8ca7@bootlin.com>
Date: Fri, 1 Oct 2021 17:33:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <898ffd75-d74f-7fe7-3ca7-b818d2c7cab@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Oct 2021 15:33:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1905

Hi Robert,

On 9/23/21 11:00 AM, Robert P. J. Day wrote:
> Following a detailed discussion of PACKAGE_DEBUG_SPLIT_STYLE, it seems
> only appropriate to refer the reader to INHIBIT_PACKAGE_DEBUG_SPLIT.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>   this patch is against master-next, as the earlier patch has not been
> merged into master yet.
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 28eb5f233..6cb9ad9c9 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5098,6 +5098,11 @@ system and gives an overview of their function and contents.
>        -  "``debug-without-src``": The same behavior as with the ``.debug``
>           setting, but no source is packaged at all.
>
> +      .. note::
> +
> +         Much of the above package splitting can be overridden via
> +         use of the :term:`INHIBIT_PACKAGE_DEBUG_SPLIT` variable.
> +
>        You can find out more about debugging using GDB by reading the
>        ":ref:`dev-manual/common-tasks:debugging with the gnu project debugger (gdb) remotely`" section
>        in the Yocto Project Development Tasks Manual.

Thanks for the new patch.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged in master-next.

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


