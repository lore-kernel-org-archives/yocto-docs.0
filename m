Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1123CCF9FF
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 12:31:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.14397.1761913859711661869
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 05:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=vvWC88te;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6208C4E41439
	for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 394A660704;
	Fri, 31 Oct 2025 12:30:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 520C9118125C3;
	Fri, 31 Oct 2025 13:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761913857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=29N62kDXeCu5OzV04MjkrGYI2J1F017nDCLdY7ElZbQ=;
	b=vvWC88teCnmVQzQBiy8KrborOKFCQIbKldlfdQowinqSfvOsTybOG0MAa2vNrllUUStwin
	4JSsrZUHMTSkrc3IsqZjxKOQ4lilz+o1GNI5HM0A2dTvaf+eNoT1YSFUCfMUduop5e+wkN
	cqXfh8iKYDgmi2TdpLuYw0QixBS81SFBB80HLNbH7paqjkUvCmqKAU5dDWefgrhbVbuyJa
	nJY0p3PyckEyFuk9CzkHRwIsqy9V6Ckgen1LLmgeCF9xIG3VMpbSTKbvklPx3bM47bwukM
	Nd57iIWqGCIJJQCD6f3vvx0QYtsHvm5Ep0EmtGRR/95ZOu7Hx5qtUu7JHl7uUA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual/start.rst: fix typo "RELEASE" -> "RELEASES"
Date: Fri, 31 Oct 2025 13:30:13 +0100
Message-ID: <176191377000.156612.2547004342415662428.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <4b9f4516-12b1-ac82-02cc-614905b2971e@crashcourse.ca>
References: <4b9f4516-12b1-ac82-02cc-614905b2971e@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:31:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7948


On Fri, 24 Oct 2025 08:52:47 -0400, Robert P. J. Day wrote:
> In addition, some minor grammatical tweaking.
>=20
>=20

Applied, thanks!

[1/1] dev-manual/start.rst: fix typo "RELEASE" -> "RELEASES"
      commit: 9e9bd1bec2d1ef96ff416bbf94e3821056436073

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

