Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6E5D1AD48
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 11:24:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.20847.1729077861201871674
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 04:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TUnL9o6/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17A3C60003;
	Wed, 16 Oct 2024 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729077859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ow9z3Qh5M1WcX2IUkBV1XOOgfIJ3IlxbvUSerE+PYKc=;
	b=TUnL9o6/pZ5VOoQsnGqA398WBEKQmplemJYzpGGwv8J/zYsCS8IQn8bsJ6mRCkKUW1KLRs
	j3wnFJdYlHQZhM7Z79PU/EYg2V2xQCvDA1w/SYqABTOFId6aFfid5qQ1G/idSeRXi6XUSC
	TGeSLlqqGBQnzKaOrliO5J/7hkSqUJUSSErD7osH6Th6zeD/kSMk8kE6+dT78yWo7cXnJT
	iEjaMfbe0bwhq3YxuCjbY4v835UKuRma1XcUsuvxOOBXH/HdY9zwtUTaE+gGi2Ez7BzwjD
	wdkNTlnTzHBuy+QlNvkpWHKaEOrBpYX2KvwdqdNMSoQ2ItWepDf8yE3jMgIohg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Oct 2024 13:24:18 +0200
Message-Id: <D4X6Y2HFLZCP.2XXEK9388STXQ@bootlin.com>
To: <niko.mauno@vaisala.com>, <docs@lists.yoctoproject.org>
Cc: <quentin.schulz@cherry.de>
Subject: Re: [docs] [PATCHv3 1/2] docs: Replace VOLATILE_LOG_DIR with
 FILESYSTEM_PERMS_TABLES
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241016092340.262802-1-niko.mauno@vaisala.com>
In-Reply-To: <20241016092340.262802-1-niko.mauno@vaisala.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 11:24:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5501

Hi Niko,

Thanks for this new version.
I think we're almost set, just see my comment below.

On Wed Oct 16, 2024 at 11:23 AM CEST, Niko Mauno via lists.yoctoproject.org=
 wrote:
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-ma=
nual/features.rst
> index b2ba731bb2..84ebfa81ae 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -325,11 +325,6 @@ The image features available for all images are:
>     the ``/var/log/postinstall.log`` file on first boot of the image on
>     the target system.
>
> -   .. note::
> -
> -      To make the ``/var/log`` directory on the target persistent, use t=
he
> -      :term:`VOLATILE_LOG_DIR` variable by setting it to "no".
> -

As Quentin was saying, it would be nice to avoid removing information here,=
 and
replace it with the new implementation. I'm fine with keeping an explanatio=
n in
both the glossary and here, so you can probably paraphrase what you wrote i=
n the
glossary.

Thanks again,
Antonin

