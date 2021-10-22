Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F15C433F5
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 07:25:29 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.5104.1634887527770371416
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Oct 2021 00:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 71DBE1C000D;
	Fri, 22 Oct 2021 07:25:25 +0000 (UTC)
Subject: Re: [docs] [docs v2] ref-manual: Update how to set a useradd password
To: Daiane Angolini <daiane.angolini@foundries.io>,
 docs@lists.yoctoproject.org
References: <20211021181604.4077605-1-daiane.angolini@foundries.io>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <a2d5ad1e-9c33-0a03-12fd-0e2f59ce9674@bootlin.com>
Date: Fri, 22 Oct 2021 09:25:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021181604.4077605-1-daiane.angolini@foundries.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Oct 2021 07:25:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2036

Hi Daiane,

Thank you for the patch update!

On 10/21/21 8:16 PM, Daiane Angolini wrote:
> Partial fix for [YOCTO 14605]
>
> Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
> ---
> changes since v2:
> - changing suggested encrypt algoritm (512->256)
> - resultant -> resulting
> - closing quote around ${PASSW}
>
>  documentation/ref-manual/classes.rst | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 79af45ada..8747c4b08 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -590,19 +590,25 @@ Here is an example that uses this class in an image recipe::
>         "
>  
>  Here is an example that adds two users named "tester-jim" and "tester-sue" and assigns
> -passwords::
> +passwords. First on host, create the password hash::
> +
> +   mkpasswd -m sha256crypt tester01
> +
> +The resulting hash is set to a variable and used in ``useradd`` command parameters.
> +Remember to escape the character ``$``::
>  
>     inherit extrausers
> +   PASSWD = "\$6\$kt.uxYMp9O9.Yxqd\$SBaJTucixmPm7/WjFL2CjUGMHTqtw8KPK0yxpYw.tGWWHlnOwkUwZ0Pa6vR724Te/E5./V.wua4HT/h0li8Lw/"


Shouldn't you update the hashed password too? The above is still the
output of "mkpasswd -m sha512crypt tester01".

All the rest looks good.

Thanks,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


