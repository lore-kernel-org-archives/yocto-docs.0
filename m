Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED9DD2D0FA
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:10:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58457.1768309823965605021
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:10:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=C2u6Q98o;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 764DC1A2819
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D61060701;
	Tue, 13 Jan 2026 13:10:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4578E103C9270;
	Tue, 13 Jan 2026 14:10:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768309821; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iw1A7SxLPvdYWU92fgrfD2yQKglZwtTTV+RQKmuB71E=;
	b=C2u6Q98oDm9LiulJB5kYOvuV4dejh+orXn0/l0kvbhKApuszyERvmgREiH/PpR0bgjQNFE
	CUYHBbqs4mRc2yINkR1uLpsq3qqY3X4w08grIXN6m8bPrkUB21GRoIhXkGruf4B+4xZfv+
	zK/19fpk/ecvZU8IgnB+hfhv02mq66qrclcf/aaYQ7lIUQYjWGOWaoL0x8FZ1apcTb3+wo
	96iTKVx+zDcK6YFLHjgq7pxiH7/zFNYLezlSMP9Ow9gKQ5UD5QliEkaXNCUzTKl/BmdfFc
	HEdZ/+7+J2mSfIHyMH5nzXPSDlgxI+WFvOfAVvrWS5RBcVy5N+mjctlLv2MhnQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Barker <paul@pbarker.dev>
Subject: Re: [PATCH v2] contributor-guide/recipe-style-guide.rst: explain difference between layer and recipe license(s)
Date: Tue, 13 Jan 2026 14:09:57 +0100
Message-ID: <176830971054.418327.8517400725889352129.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109-layer-license-clarification-v2-1-3b7f0682df97@bootlin.com>
References: <20260109-layer-license-clarification-v2-1-3b7f0682df97@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8502


On Fri, 09 Jan 2026 10:32:59 +0100, Antonin Godard wrote:
> Explain that the LICENSE set in a recipe does not apply to the recipe
> file itself, but to the underlying software. The license of the recipe
> file is the license provided in the layer itself. Give OpenEmbedded-Cor=
e
> as an example for this.
>=20
> Fixes [YOCTO #14410]
>=20
> [...]

Applied, thanks!

[1/1] contributor-guide/recipe-style-guide.rst: explain difference betwee=
n layer and recipe license(s)
      commit: b8a56b8b2e8c0417b2f7204f80c79b05d95e9ce4

Best regards,
--=20


