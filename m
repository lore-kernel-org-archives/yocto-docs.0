Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B7FCCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 09:49:36 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web01.3128.1761731370274008060
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 02:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Lh4Opdix;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C3E92C0BEBC
	for <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 09:49:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 014BB606E8;
	Wed, 29 Oct 2025 09:49:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2740117F1C46;
	Wed, 29 Oct 2025 10:49:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761731367; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TGCvoomn43vFQj1PsPLYYOBp6D6yqhsMhz8IAOt0qQk=;
	b=Lh4Opdix+CagDawsT2joqrcuS8NvY78LPsNW+gYqKDuci0q8DDiRlMbooV1FOPw135GLsX
	rCaTQVp6siOvD5b4m2pCtmHUOr4WoHA2FYVDFv3tN1OhV34Q8a5oHn80BnUlHFVia4YaKU
	ReTw0Bm80TQhlvv8BV6Obkx1YNpfhs6Zl0qfPdGixFoKWg7hgQS3bl7rTJZyj1pf/cWORx
	6xQ9ES5nRg/SwnD46FzlFTk6KiKK7GeGGuXpISNXtHI1rTIeP8I0rAJabo5O7NM0ObP804
	I8P1I8sK1GqI62HRbqPzss7IAgEyYGzjnCHKvnuws/lXRyBfyWiNnlCAjR7P6g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 10:49:26 +0100
Message-Id: <DDUPNCN1D5IW.24XQI86ABYQAZ@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] whether "bitbake -e" examples should be updated
References: <a21a032d-3f13-03fa-a7d2-69112eafa2fa@crashcourse.ca>
In-Reply-To: <a21a032d-3f13-03fa-a7d2-69112eafa2fa@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 09:49:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7892

On Tue Oct 28, 2025 at 7:37 PM CET, Robert P. J. Day wrote:
>
>   more nitpicky pedantry ... here:
>
> https://docs.yoctoproject.org/dev-manual/new-recipe.html#running-a-build-=
on-the-recipe
>
> the reader is advised to display the value of a variable relative to a
> recipe basename with:
>
>   $ bitbake -e basename | grep ^WORKDIR=3D
>
> well, sure, but as we all know, there's the newer:
>
>   $ bitbake-getvar -r basename WORKDIR
>
> which inspires the question -- should that second variation be *added*
> to that page, or should it *replace* the older command because there's
> little point in explaining the earlier command?

I think it's worth showing the bitbake-getvar here and I would replace it (=
also
in other places if you find any other).

>   more globally, how complete are the docs in terms of explaining all
> the cool debugging scripts provided in oe-core/scripts? i know the dev
> manual has an entire section on debugging, so i'll get to that later.

The debugging document has a "Viewing Variable Values" section. It would be
great to add `bitbake-getvar` there, if you have some time a patch would be
appreciated.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


