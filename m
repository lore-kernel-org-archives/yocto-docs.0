Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351D1CE79D8
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 14:25:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.41076.1695219928563722269
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 07:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iELHl9mp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9878D24000B;
	Wed, 20 Sep 2023 14:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695219926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRhWDIns6VE1YBc930r1OLB8QZq6OzLPDFt1FUM7F+8=;
	b=iELHl9mppkndWonrKAWi5gBnrFpsW/vUStzMt3b3KzLorJdcTzXxQOH4gJpHYmeSfBjQFn
	xsZKZ2BwTms+pORVcTrUxLy0F9SL5rXLZWJDYfozNctRFc/uWCq0HVp0cmFLDLGP8wJjDm
	8RYahr3rGgUI0XhO02dFK07hvXjNobqKYYFdZiTOz67geyNzfVVn3aoau2SrMd1E34qid3
	Qs+CsWwcrqtMAjalEMJmeZDhsbxbxi5T0VaViSDKoqmnCJwcoh3ouvTurPcKerNgqdNq+S
	rXoZf65JZBIMQcKtWoOs3ulkYHNED/X2ZXjW8HiqSR1zb5JxZ436j7JyGdHvPQ==
Message-ID: <12ef125b-5466-408c-ec8c-c5bef1510bc7@bootlin.com>
Date: Wed, 20 Sep 2023 16:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: yocto@pengutronix.de, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 4/4] contributor-guide: deprecate "Accepted" patch
 status
Content-Language: en-US
To: Roland Hieber <rhi@pengutronix.de>
References: <20230920100647.1038583-1-rhi@pengutronix.de>
 <20230920100647.1038583-4-rhi@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230920100647.1038583-4-rhi@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 14:25:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4273


On 20.09.23 at 12:06, Roland Hieber wrote:
> This is in accordance with the Release Notes of the gatesgarth release:
>
>    > In the ``Upstream-Status`` header convention for patches,
>    > ``Accepted`` has | been replaced with ``Backport`` as these almost
>    > always mean the same thing i.e. the patch is already upstream and
>    > may need to be removed in a future recipe upgrade. If you are adding
>    > these headers to your own patches then use Backport to indicate that
>    > the patch has been sent upstream.
>
>    <https://docs.yoctoproject.org/migration-guides/migration-3.2.html#miscellaneous-changes>
>
> Suggested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> ---
>   .../contributor-guide/recipe-style-guide.rst       | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
> index bc14c58a9759..ab3b94f02e7e 100644
> --- a/documentation/contributor-guide/recipe-style-guide.rst
> +++ b/documentation/contributor-guide/recipe-style-guide.rst
> @@ -277,13 +277,13 @@ following status strings:
>      Submitted to upstream, waiting for approval. Optionally include where
>      it was submitted, such as the author, mailing list, etc.
>   
> -``Accepted``
> -   Accepted in upstream, expect it to be removed at next update, include
> -   expected version info.
> +``Backport [version]``
> +   Accepted upstream and included in the next release, or backported from newer
> +   upstream version, because we are at a fixed version.
> +   Include upstream version info (e.g. commit ID or next expected version).
>   
> -``Backport``
> -   Backported from new upstream version, because we are at a fixed version,
> -   include upstream version info.
> +   Note: historically, ``Accepted`` was another way to mark such patches, but
> +   this status is now deprecated.


I'd remove these last 2 lines, as we'd have to remove them one day 
anyway, to keep the manual going straight to the point.
The rest looks good to me otherwise.

I actually started to make the changes by myself, but then it was hard 
to share these changes with you and other reviewers. I hope this can 
help with future patches :)

Maybe in a V3 you can add what Alex explained about the "Pending" status.

Thanks for everything!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


