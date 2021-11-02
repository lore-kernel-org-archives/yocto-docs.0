Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8ABC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 14:54:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.831.1635864846538434258
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 07:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B2A891C0015;
	Tue,  2 Nov 2021 14:54:04 +0000 (UTC)
Subject: Re: [docs] [PATCH 2/2] kickstart: update busybox note regarding
 PARTUUID
To: Ross Burton <ross@burtonini.com>, docs@lists.yoctoproject.org
References: <20211101122219.5965-1-ross.burton@arm.com>
 <20211101122219.5965-2-ross.burton@arm.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <6d6d8427-ec24-fd7c-8d1a-77123780f367@bootlin.com>
Date: Tue, 2 Nov 2021 15:54:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101122219.5965-2-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Nov 2021 14:54:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2065

Hi Ross,

On 11/1/21 1:22 PM, Ross Burton wrote:
> As of oe-core c996cabf the default BusyBox configuration supports
> PARTUUID, so update the note to reflect this.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  documentation/ref-manual/kickstart.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
> index cac9f2f49..807f5e052 100644
> --- a/documentation/ref-manual/kickstart.rst
> +++ b/documentation/ref-manual/kickstart.rst
> @@ -54,8 +54,9 @@ must also provide one of the ``--ondrive``, ``--ondisk``, or
>  .. note::
>  
>     The mount program must understand the PARTUUID syntax you use with
> -   ``--use-uuid`` and non-root *mountpoint*, including swap. The BusyBox
> -   versions of these application are currently excluded.
> +   ``--use-uuid`` and non-root *mountpoint*, including swap. The default
> +   configuration of BusyBox in OpenEmbedded supports this, but this may
> +   be disabled in custom configurations.
>  
>  Here is an example that uses "/" as the mountpoint. The command uses
>  ``--ondisk`` to force the partition onto the ``sdb`` disk::


Thanks for the updates.
However, this is out of sync with the messages in
scripts/lib/wic/help.py in OE core.

See https://lists.yoctoproject.org/g/docs/message/1520

How could we address the mismatch?
Could we update OE core instead and then the documentation? That would
be even better to include the text from the sources, but that I'm not
sure how to do this...

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


