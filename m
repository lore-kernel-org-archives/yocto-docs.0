Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22ED5CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 11:45:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.75315.1756813545417096134
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Sep 2025 04:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=B5yDYkQJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7A4831A0D26
	for <docs@lists.yoctoproject.org>; Tue,  2 Sep 2025 11:45:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5335260695;
	Tue,  2 Sep 2025 11:45:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65EFE1C22DBA2;
	Tue,  2 Sep 2025 13:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756813543; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zBUKwP95buBvWeWsGjQ4M6atCayACHCtq6I0zE3lfu4=;
	b=B5yDYkQJp8pVJWOy0nU3P5bIt0klf/+hPDj6Q4NlapOmiFSjEWvZVreo4poqzcET/8FrFZ
	wX4V6U8I0Vy8M981rCKH7O+edOwDaggpmXT3ZlkrcMnb8tE2WtJDT+Ec0iAMDmkDs55y6/
	6bnbRL0YXPiEufhgWRBIt6w9kU9uvT22HyNrj2JGNRWhg2JMGj9JECnpXvbRnKtLiKV3t2
	P+cSfG2ulR2Ls8njHd8CtKVYaqDWBo4XpbA9o5DfQu0KMqfpJFHQjtEDsXYAgxyG2KC+ND
	7IQRlgJ4kL/hi8wa8SVWLSG63dpA03K7/9NDJ0uYELIvGPOIp8GZWkO2AW8sPQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Sep 2025 13:45:40 +0200
Message-Id: <DCIAFAYHYCJ1.24FYABCZ6HR0A@bootlin.com>
Subject: Re: [docs] [PATCH] migration-5.3.rst: update removed recipes list
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <skandigraun@gmail.com>, <docs@lists.yoctoproject.org>
References: <20250902061722.2226405-1-skandigraun@gmail.com>
In-Reply-To: <20250902061722.2226405-1-skandigraun@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Sep 2025 11:45:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7483

On Tue Sep 2, 2025 at 8:17 AM CEST, Gyorgy Sarvari via lists.yoctoproject.o=
rg wrote:
> Add a note about the removed xf86-input-mouse and xf86-input-vmmouse reci=
pes.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  documentation/migration-guides/migration-5.3.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/documentation/migration-guides/migration-5.3.rst b/documenta=
tion/migration-guides/migration-5.3.rst
> index 97e41605f4..2d2f8d91ad 100644
> --- a/documentation/migration-guides/migration-5.3.rst
> +++ b/documentation/migration-guides/migration-5.3.rst
> @@ -174,6 +174,11 @@ The following recipes have been removed in this rele=
ase:
>     removed in May 2024 with dfa482f1998 ("python3-requests: cleanup RDEP=
ENDS"),
>     and there is no other user of this variable.
> =20
> +-  ``xf86-input-mouse``: The project has stopped supporting Linux.
> +
> +-  ``xf86-input-vmmouse``: It has a runtime dependency on ``xf86-input-m=
ouse``,
> +   which stopped supporting Linux.
> +
>  Removed :term:`PACKAGECONFIG` entries
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> =20

Thanks for taking the time to update the release notes!

I will merge this once your patch makes it to master in OE-Core.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


