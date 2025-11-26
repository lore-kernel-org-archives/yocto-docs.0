Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C815FD10F3B
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:15 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12330.1764162008573210083
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Kt5H6+Mn;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0B7C5C15D78;
	Wed, 26 Nov 2025 12:59:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0F2760721;
	Wed, 26 Nov 2025 13:00:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C173F102F08EA;
	Wed, 26 Nov 2025 14:00:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162005; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SAqHRbKPUoGFA+xq/DDMfU7kH+0ymLGnqdp2H6TLyXw=;
	b=Kt5H6+MnRkwP3P8GH4PRnElUIVrgkhYmvZLiuQayWWcVTBxVyhEkQ3++KofiCEnCoo4Jqc
	slJ+5AQ62To9fh6uYYFMWVGmPXT6j0Utc9CQdTgqBV372zubJ6nhBpQmH1UKYABPKBs9EL
	XzhXziKnyWnc+Y50P9pikRmPB1+wQsgnWVTnZR3rQUzSNGagyqUBVrKKRQsvQvbC18dHWN
	aTkyxqAw+pqFLTP1dkqKwdMgYA9XhSQXvscno0ThWoH1WqMARUP5bvbNniN4MJvR6fBPW1
	1EQZWblJF3ej6NhuTJuFb37x7k7nVNmrWIC3wi39rCIB7pQcD3l3vaVJJtbbWQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	AdrianF <adrian.freihofer@siemens.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] ref-manual/variables.rst: cover new FIT_KERNEL variables
Date: Wed, 26 Nov 2025 13:51:19 +0100
Message-ID: <176416145909.617433.9613349596565036324.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029213029.2480507-1-adrian.freihofer@siemens.com>
References: <20251029213029.2480507-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8125


On Wed, 29 Oct 2025 22:30:29 +0100, AdrianF wrote:
> Document the new variables:
> - FIT_KERNEL_SIGN_ENABLE
> - FIT_KERNEL_SIGN_KEYNAME
> - FIT_KERNEL_SIGN_KEYDIR
>=20
>=20

Applied, thanks!

[1/1] ref-manual/variables.rst: cover new FIT_KERNEL variables
      commit: fe7b38b2c5f918974f82ba3c3027fa907c6c5602

Best regards,
--=20

