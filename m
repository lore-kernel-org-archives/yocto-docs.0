Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB5ED10F40
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12341.1764162018773986513
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=oIo26iPD;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4A6181A1D54;
	Wed, 26 Nov 2025 13:00:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21CC660721;
	Wed, 26 Nov 2025 13:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77977102F08EA;
	Wed, 26 Nov 2025 14:00:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162015; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oiufCzjkDii9SLKEuSUi2hjhIWJIwQTCp81h7u7PYGE=;
	b=oIo26iPDJLb4SQSRIc9EbDWu3KtxmucLKtc6rhEpJZOhGfCfJbsp0oI8rx3OxN6TKRv1G5
	pGrqRFCqfWPP6Zyt92V4+WTueT0QnkOb+0dWIaBMfsmgpg7OrQ3pv0USQzJuEk3yFRStIT
	45TmwQwenQIMj0Jm0I2EHW7nh9sb21I7wXg5BYu+86qskcnHAiBFAXcjxeHfA7pKTtSM9t
	TEmN7rsXT9Rt7BYfD+fhR/wVttlOeANSLn07AeN5//aGLPOtkA0167xs77RTIYOQ3Mi7y/
	RP2iTCO+5DNhj3cpdqTEuYYTZRvLPP/Rs6+oVP3wTh5TvZ/IKvPfUUSBqMAuMg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] documentation: link to the Releases page on yoctoproject.org instead of wiki
Date: Wed, 26 Nov 2025 13:51:30 +0100
Message-ID: <176416145954.617433.15625945478307416457.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112154024.2573140-1-ross.burton@arm.com>
References: <20251112154024.2573140-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8136


On Wed, 12 Nov 2025 15:40:24 +0000, Ross Burton wrote:
> We have a machine-generated Releases page[1] which is preferable to the
> wiki.
>=20
> [1] https://www.yoctoproject.org/development/releases/
>=20
>=20

Applied, thanks!

[1/1] documentation: link to the Releases page on yoctoproject.org instea=
d of wiki
      commit: 46a9172fd17aa518028e35b8c874e74889079094

Best regards,
--=20


