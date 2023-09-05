Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4630DC83F3E
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 08:21:31 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.16776.1693902082952666918
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 01:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fmKsmn9J;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14CF01C000A;
	Tue,  5 Sep 2023 08:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693902080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ga9IliUmeN697+8nPEEwusR2z8XbL4wLQzPgnvE0mMc=;
	b=fmKsmn9JABmAgcGj+Izg3eQCNfH3N88tNvDbDMC5qdX/0dDebIaDwsuBTDjdB5FJP3VCz6
	rujt49/9qVDIqh2nnknAE1WJApq4Ct+s2CZBu1mY73XZRZiXi2cQsAgQ5SEDpx1pvUh0Oa
	JXHc/U2iQ/VkDfd8NYHl9lBFIqAa0K0ehT9CGaNOmGXSTY60Gwx+4G5ua2qft1Jtz4vtY5
	ZhmvsHtomkltFJ4PLchDBjsdoYPhK5Q0U2qB5vDiYB5MgytZkXWpQchoFW/uEOIWzEBZ8L
	GuxqbjRuP1rqrph37rdnVF/2MHWgsSDz8avjB8ziptlPyesM31v2pJolWSDvhA==
Message-ID: <20af2d30-c531-7285-073d-030fc58d44cf@bootlin.com>
Date: Tue, 5 Sep 2023 10:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: remove unsupported :term: markup
 inside markup
Content-Language: en-US
To: Yoann Congal <yoann.congal@smile.fr>
References: <20230904102111.472125-1-yoann.congal@smile.fr>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230904102111.472125-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Sep 2023 08:21:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4188

Hi Yoann

On 04.09.23 at 12:21, Yoann Congal wrote:
> ":term:`Initramfs`" in bold text appears verbatim (no link is created).
>
> The term link is present elsewhere in the text so remove the extra
> markup.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>   documentation/dev-manual/building.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
> index 1f1642e84..a39579349 100644
> --- a/documentation/dev-manual/building.rst
> +++ b/documentation/dev-manual/building.rst
> @@ -273,12 +273,12 @@ loading modules needed to locate and mount the final root filesystem.
>   
>   Follow these steps to create an :term:`Initramfs` image:
>   
> -#. *Create the :term:`Initramfs` Image Recipe:* You can reference the
> +#. *Create the Initramfs Image Recipe:* You can reference the
>      ``core-image-minimal-initramfs.bb`` recipe found in the
>      ``meta/recipes-core`` directory of the :term:`Source Directory`
>      as an example from which to work.
>   
> -#. *Decide if You Need to Bundle the :term:`Initramfs` Image Into the Kernel
> +#. *Decide if You Need to Bundle the Initramfs Image Into the Kernel
>      Image:* If you want the :term:`Initramfs` image that is built to be bundled
>      in with the kernel image, set the :term:`INITRAMFS_IMAGE_BUNDLE`
>      variable to ``"1"`` in your ``local.conf`` configuration file and set the


Thank you for the patch!
Actually, I'd prefer to keep the code as it is. It doesn't hurt as the 
output is the same, and it makes it easier to look for terms which are 
not referred to through a ":term:" statement.

It's also possible that future versions of Sphinx will create such a link.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


