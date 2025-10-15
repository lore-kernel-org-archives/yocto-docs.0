Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB11ECCD199
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 11:46:22 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.14105.1760528781973774263
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 04:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ct+TQfB3;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 01AECC09FB7;
	Wed, 15 Oct 2025 11:46:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1FBA1606F9;
	Wed, 15 Oct 2025 11:46:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C61F102F22B7;
	Wed, 15 Oct 2025 13:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760528779; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T5xSgXKKHIevUhpDMYWQpqGMn81aOfziUBCKMq1B/TA=;
	b=ct+TQfB3xhbUtHgvipJJ7GK6RZwYV/z2COWSOQbjGh7OupAOXJGX+7+x96e5kfz2gsiOFK
	26cfHFFVK8BIGEauZD2ZKwQ8PN9yfybeEbDXg3gAOZmQ2NvIWAFfrvOjWwyyxzvlsAnLJA
	gCfrZbZTffKIKoogrDkFQ6KSechbPyryRXhFtAWTfwwEjcM8tgm0urW0C3YIT/vCE3tKeS
	JNtIcouGGjvkDs034y15Rq3iSpFcnvVmGSWBXaGS/fwt5kBHxK88XZDe/wnKnKiinf9hjL
	UCGc30K+/ZS8Bgd13GkkBYaad8oSUPifqBpBfXCJ0CZKzrnKDJi5VSlYNV5onw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Gyorgy Sarvari <skandigraun@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] ref-manual/variables.rst: add note about PSEUDO ignore/include precedence
Date: Wed, 15 Oct 2025 13:45:25 +0200
Message-ID: <176052868602.3167271.2765364697531576895.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013132247.3987452-1-skandigraun@gmail.com>
References: <20251013132247.3987452-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:46:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7707


On Mon, 13 Oct 2025 15:22:47 +0200, Gyorgy Sarvari wrote:
> This commit[1] in pseudo introduced the PSEUDO_INCLUDE_PATHS variable, =
however
> the previous PSEUDO_IGNORE_PATHS variable is still present also. Add a =
clarifying
> note about the order of precedence of the two.
>=20
> [1]: https://git.yoctoproject.org/pseudo/commit/?id=3D2c43381180f9cfef4=
c0a8bb0c1658a86c3fcc876
>=20
>=20
> [...]

Applied, thanks!

[1/1] ref-manual/variables.rst: add note about PSEUDO ignore/include prec=
edence
      commit: 8b85245490ae0b19a9c3880ec31e55b42e19d094

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

