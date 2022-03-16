Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C29FC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 21:10:58 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.2323.1647465056538281288
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 14:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hog/YMIc;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 29925240008;
	Wed, 16 Mar 2022 21:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647465054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=beBKxkc04wwRL4NDu2irCKO0sOfCwrIjmow1A/zh984=;
	b=Hog/YMIc6cSzB3HdzYHw2iynO8hUIHlTWUJztQDdApv7spI4/hMIVEzr4+f8BUTUxDp7Mp
	lNyla/NsP8FPGVnT/dukUrigbKQZRMxVuj0LPDBuwIxPKdpNwdsmb2RSO6cfciw13X8w9N
	O5DRuiCWjJplY67Mwp2FEU3PI0RrPArvrRJhgVzsNkSqbMeUSkFOMyky/RJMYHj1Krt8F2
	jccWVJs3V4peg4fxMIUcaTrUgtvWYjjZUcJmkVmedMjw7OSD/73+rfglx4r7Dz6TJU9i24
	8RGGzpzwbK4iFkRBUIFCyWribaW7HqUag7M4fPgl5+BHRDH7Y4HzRw4yhapgyQ==
Message-ID: <fd8b8e1e-16ba-a634-0849-bf97aec44f67@bootlin.com>
Date: Wed, 16 Mar 2022 22:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: Nicholas Sielicki <nicholas.sielicki@legrand.com>
Subject: Re: [docs] [PATCH 1/1] dev-manual: note on using journald without
 syslog
Content-Language: en-US
To: Nicholas Sielicki <yocto@opensource.nslick.com>,
 docs@lists.yoctoproject.org
References: <20220316162857.1226591-1-yocto@opensource.nslick.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220316162857.1226591-1-yocto@opensource.nslick.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Mar 2022 21:10:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2616

Hi Nicolas,

Many thanks for the patch!

See my comments below...

On 3/16/22 17:28, Nicholas Sielicki wrote:
> From: Nicholas Sielicki <nicholas.sielicki@legrand.com>
>
> journald is not a syslog provider, so using journald exclusively amounts
> to just preventing a syslog provider from being specified on a system
> where journald is active.
>
> Various spots where this has popped up:
> * https://stackoverflow.com/q/48746397
> * https://lists.yoctoproject.org/g/yocto/topic/82883035#53548
>
> Signed-off-by: Nicholas Sielicki <nicholas.sielicki@legrand.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index ca3fbc856..4e9c2c04e 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -7910,6 +7910,20 @@ image cannot use this package group. However, it can install SysVinit
>  and the appropriate packages will have support for both systemd and
>  SysVinit.
>  
> +Using systemd-journald without a traditional syslog daemon
> +------------------------------------------------------------------------
>

FYI, here, your underlining is unnecessary longer than the text. There
is no warning though, but that's a convention we seem to follow. I fixed
this by myself.
> +
> +Counter-intuitively, ``systemd-journald`` is not a syslog runtime or provider,
> +and the proper way to use systemd-journald as your sole logging mechanism is to
> +effectively disable syslog entirely by set these variables in your distribution
> +configuration file::


s/by set/by setting/

I fixed that by myself. No need to resubmit, unless other people have
comments.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


