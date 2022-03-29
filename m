Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840A4C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 16:56:48 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.9335.1648573006903587215
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 09:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oLI5gm0o;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A386B24000A;
	Tue, 29 Mar 2022 16:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648573005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BkP8f4tKJf0uh6uLlqMOTdjX3dAjPr0WuCTbnAQJaC0=;
	b=oLI5gm0oW1frBrjbCalNinBcgUhiBtgjUzk7zkkpwCb+TEnonptFBaWDyJGfn9i8JFdk4L
	7DHOxYuZSIWFLt9BAykNWIBb4CN4rShSfc0nqoVMxMuLAF8oF++QnZGFRJo+6pEh1c6JZB
	iddy6LD5jXMvbN737rLJ1vX9xWV8tPMQbuA7ksysjsSMzJvF19HFieV+2UjVy4VAgM8wmS
	sp+K31EnSAOAtOfwNiawX8//y3GRqqNafZMMv1qYisHWBiLCsVUSj/TYRP4z1cGrRVObek
	9v1DUhoOn34hDa75F9D7P+QmUZCEW+jZCh3pq5mSi+Tp/KIFh9XDsai4eqQPTg==
Message-ID: <9a44a43a-cf31-2fd7-b00c-ea3ee61168f7@bootlin.com>
Date: Tue, 29 Mar 2022 18:56:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH] ref-manual: Add vfat in list of filesystems
 supported by kickstart
Content-Language: en-US
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>, docs@lists.yoctoproject.org
References: <20220329103941.52651-1-daniel.ammann@bytesatwork.ch>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220329103941.52651-1-daniel.ammann@bytesatwork.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Mar 2022 16:56:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2733

Hi Daniel

On 3/29/22 12:39, Daniel Ammann wrote:
> Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
> ---
>  documentation/ref-manual/kickstart.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
> index 885c72129..d82da0ee7 100644
> --- a/documentation/ref-manual/kickstart.rst
> +++ b/documentation/ref-manual/kickstart.rst
> @@ -125,6 +125,8 @@ the ``part`` and ``partition`` commands:
>  
>     -  ``swap``
>  
> +   -  ``vfat``
> +
>  -  ``--fsoptions``: Specifies a free-form string of options to be used
>     when mounting the filesystem. This string is copied into the
>     ``/etc/fstab`` file of the installed system and should be enclosed in


Good catch here too. Thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


