Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D381EC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 16:55:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.59360.1699289715814244870
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 08:55:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KEli5Ene;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6773D2000B;
	Mon,  6 Nov 2023 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699289713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wlu/UEcEsgGYDkplJkx/g38CUPnslH1tIm0rhuL3IfI=;
	b=KEli5EnePZLuBAg6lHpVi38MT2zuZO4iTJNKyO4n0VQ6SyWeimMBXfaDADzbPEe0eQfsHF
	ZuxGYNYi6GKs2jNUhaiT3IMZ9Kos+0tSLNbq31eiECO/m18mERRThCYUAAIQo/ItRLebis
	XA+KiR7+feZlH7RNanAd2F7AzQD1XXs+DgOPuUJix0QL4tjzaIbrQ3KCrepvW11R0VwbV1
	s6cfnkbkZh7fdwZ5M71r+yi8mCExz758ZD7o6weBYHhCBv0hcXFDLeJGqrze0JPosv3lWq
	WEsDv0baH8LBD4MUEZ3iqXvdHf9QqnvUulNvvplVf3t2NRPKYRx56rqPPt1j+g==
Message-ID: <cd2309ce-7175-4da6-809f-58dd6c64779b@bootlin.com>
Date: Mon, 6 Nov 2023 17:55:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 05/12] release-notes-4.3: tweaks to existing text
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
 <d4318080dc94fe426323c4505f93617c235d1f6e.1699266393.git.bluelightning@bluelightning.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <d4318080dc94fe426323c4505f93617c235d1f6e.1699266393.git.bluelightning@bluelightning.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 16:55:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4605

Hi Paul

On 06.11.23 at 11:29, Paul Eggleton wrote:
> A few grammar tweaks.
>
> Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
> ---
>   documentation/migration-guides/release-notes-4.3.rst | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
> index 2f20fcb6946..dd61a9c8e41 100644
> --- a/documentation/migration-guides/release-notes-4.3.rst
> +++ b/documentation/migration-guides/release-notes-4.3.rst
> @@ -92,7 +92,7 @@ New Features / Enhancements in 4.3
>   
>      -  `ttyrun <https://github.com/ibm-s390-linux/s390-tools>`__, starts
>         ``getty`` programs only when a terminal exists, preventing respawns
> -      through the ``init`` program. This allowed to remove the
> +      through the ``init`` program. This enabled removing the


Oops, I guess it's not the first time I make this mistake.
I show pay extra attention every time I feeling like using the "allow" 
verb :)
https://letlucyedit.wordpress.com/2013/04/03/enable-or-allow-why-you-need-to-get-it-right/

Many thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


