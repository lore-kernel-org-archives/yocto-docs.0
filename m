Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76494C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 14:44:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.9373.1634913860726990902
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Oct 2021 07:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E21EBFF807;
	Fri, 22 Oct 2021 14:44:18 +0000 (UTC)
Subject: Re: [docs] [docs v3] ref-manual: Update how to set a useradd password
To: Daiane Angolini <daiane.angolini@foundries.io>,
 docs@lists.yoctoproject.org
References: <20211022141632.4118736-1-daiane.angolini@foundries.io>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <628c56a1-4332-0f62-a56c-d9e00a2f3c5f@bootlin.com>
Date: Fri, 22 Oct 2021 16:44:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022141632.4118736-1-daiane.angolini@foundries.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Oct 2021 14:44:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2042

Hi Daiane,

On 10/22/21 4:16 PM, Daiane Angolini wrote:
> Partial fix for [YOCTO 14605]
>
> Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
> ---
> changes since v2:
> - replace the content of PASSWD variable in the example
>
>  documentation/ref-manual/classes.rst | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 79af45ada..9b1ead66b 100644
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
> +   PASSWD = "\$X\$ABC123\$A-Long-Hash"
>     EXTRA_USERS_PARAMS = "\
> -       useradd -P tester01 tester-jim; \
> -       useradd -P tester01 tester-sue; \
> +       useradd -p '${PASSWD}' tester-jim; \
> +       useradd -p '${PASSWD}' tester-sue; \
>         "
>  
> -Finally, here is an example that sets the root password to "1876*18"::
> +Finally, here is an example that sets the root password::
>  
>     inherit extrausers
>     EXTRA_USERS_PARAMS = "\
> -       usermod -P 1876*18 root; \
> +       usermod -p '${PASSWD}' root; \
>         "
>  
>  .. _ref-classes-features_check:


Everything looks good to me. Thank you for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

... and merged into "master-next" and "honister-next".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


