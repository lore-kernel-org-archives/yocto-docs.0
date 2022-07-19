Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91D7C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 17:51:00 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.43904.1658253051709917118
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 10:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZXL8ZSwW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4C3D860003;
	Tue, 19 Jul 2022 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658253049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Cnuxa0qjalXBsQGMUlmSjoMI23evh6VympEqU77bQI=;
	b=ZXL8ZSwWgKqjAD+POcGqRcqXxU9uLB8/NdcLNHGnnnJZ1tg977TUfamhFzwnDzf8/FeWVV
	A74rM/3Jip9VJx+Scj/rIEeonkNSW0jELmBinJpecOqx/uZI9Cco+Wf6pgpvU/TYrLQwJL
	AjbFyzWezm2wJT70NXdXeanlBUOlfK1zpPSunrd2TKdCswYi1GVtH8PFwrf3k9w7V0e7If
	D7yMQkl8XInRE5VlYeeV0JbRpfEonmRQXfJ3v476rkTvem9dZ4RZqdzgWukXqXfMfVG7Yx
	XayIrCbdRGIFNuCmvMQTuY+nfouzY4fyUkawOo7HP9szxG1L9VzjUvttLH0XYg==
Message-ID: <547edd13-2efb-b3a6-39e3-01c86c937f88@bootlin.com>
Date: Tue, 19 Jul 2022 19:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH] docs: ref-manual: variables: remove sphinx
 directive from literal block
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20220707133317.1202686-1-foss+yocto@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220707133317.1202686-1-foss+yocto@0leil.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Jul 2022 17:51:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3070

Hey Quentin

Thanks for the patch!

On 7/7/22 15:33, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> Literal blocks make sphinx take their text verbatim. This means that
> directives cannot be used in literal blocks. This means :term:`S` was
> printed as-is, without actually creating a link to the S variable
> definition as would be expected outside of literal blocks.
>
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   documentation/ref-manual/variables.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index c4b2119f2..dbb7a4628 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7660,7 +7660,7 @@ system and gives an overview of their function and contents.
>         :ref:`systemd-boot <ref-classes-systemd-boot>` class sets the
>         :term:`SYSTEMD_BOOT_CFG` as follows::
>   
> -         SYSTEMD_BOOT_CFG ?= "${:term:`S`}/loader.conf"
> +         SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
>   
>         For information on Systemd-boot, see the `Systemd-boot
>         documentation <https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__.


Good catch!
Using the mega-manual, I double checked that this was the only instance 
of this issue.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


