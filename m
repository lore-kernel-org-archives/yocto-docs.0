Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A110ECD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 17:55:05 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.45366.1712253297051103903
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 10:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iCtP58ib;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E5D1C0004;
	Thu,  4 Apr 2024 17:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712253294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ugvfvpp+nlNpGfIlaoteGmfu2w5vmie8Sk32mnh4kK4=;
	b=iCtP58ibzs01vFLRSBI5NNWHyXwaeeLKfrlvft36wxvkcWzhpHkI9GC6A2xHlr3qfZip6M
	o70uTgR/THdTNQomM2ttgBJ7e62jR30/Ken0RODbYDt46d0xihKtbsaVzPPoKCxjUzu7so
	xE0jjuR2uqC4Pn6uv+KDfr+ocJi4uyb0GhZ3dT80A/RcLfgBnRW0rZ/oCCN2+viJRXGx4W
	QZeBHdPHD+Z42ce44g8zw7bWG7j2UXywW/1bWMfdhhU96XMZbhYqMYvVyLsl4w3YsWyzxj
	rFjjeZx+TwCe+NpheZRzoEfoyX4QWb4sbwMRCV21YIF/CxDYaKadJeUKkdGdFA==
Message-ID: <fa40a0c5-b6d8-4045-bb92-1c5efff75f9b@bootlin.com>
Date: Thu, 4 Apr 2024 19:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: thomas.petazzoni@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [PATCH v1 2/5] release-notes: add changes to Go language
To: joaomarcos.costa@bootlin.com
References: <20240404165620.2248838-1-joaomarcos.costa@bootlin.com>
 <20240404165620.2248838-3-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240404165620.2248838-3-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Apr 2024 17:55:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5064

Hi João,

On 4/4/24 at 18:56, joaomarcos.costa@bootlin.com wrote:
> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>
> Mention the new class 'go-vendor' in 'Miscellaneous changes'.
>
> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   documentation/migration-guides/release-notes-5.0.rst | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
> index a56995cc9..e03f722a2 100644
> --- a/documentation/migration-guides/release-notes-5.0.rst
> +++ b/documentation/migration-guides/release-notes-5.0.rst
> @@ -62,6 +62,10 @@ New Features / Enhancements in 5.0
>      -  ``systemd-boot`` can, from now on, be compiled as ``native``, thus
>         providing ``ukify`` tool to build UKI images.
>   
> +   -  The ``go-vendor`` class was added to support offline builds (i.e.,
> +      vendoring). It can also handle modules from the same repository, taking
> +      into account their versions.


Before I merge this one, could you send an update that also briefly 
describes this new class in ref-manual/classes.rst? This way, you will 
be able to make a reference to this class in the release notes too.

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


