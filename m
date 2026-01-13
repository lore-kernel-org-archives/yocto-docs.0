Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3B9D2D0F5
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:10:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58455.1768309822471380702
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:10:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=wLt+SRUj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E438F4E420B0
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BAB1260701
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E9BD103C9333;
	Tue, 13 Jan 2026 14:10:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768309820; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s2si1tRzBddVAwnqTWw2KA1/1ZUiK5VdVE58XV9Qow0=;
	b=wLt+SRUjIaXY27JWPZXUNoDbJCkAGANDlOJi90VnAVtaYWf4WOJaw5QypF81pzlegI5yb4
	ioDKuXqX4N/d8iR8sz6NVfmEkI+hLmsVtujITKccyhD0L7B6AL6EIsNt4eEjYybpR25UUX
	2nONvMS35QgHOltJFI39WtkqF5Zw70J+ISF3rMJN93hygYtBJasOp6yOslUdh0gU8juVFh
	bf1Ad/tdZ1g6KhRAruQqw1RKw+CbefI7QrOPLctV82c1TD7HkodxR/e1e4/W+WisSdYOFR
	gZVnKaY9T44GXt9y3MJFtvkkzG8xibAD2kK+6TUjmMyvzKiQcikz9jPD8WDS2Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] set_versions.py: remove missing_tags array
Date: Tue, 13 Jan 2026 14:09:55 +0100
Message-ID: <176830971052.418327.4155750059746213375.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108-update-missing-tags-v1-1-ff1986f73c73@bootlin.com>
References: <20260108-update-missing-tags-v1-1-ff1986f73c73@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8500


On Thu, 08 Jan 2026 09:28:07 +0100, Antonin Godard wrote:
> As we now have tagged the documentation with all the missing tags, we
> can remove the missing_tags array and also the sorting algorithm, since
> git already sorts them.
>=20
> One thing that should be noted: the yocto-1.4.5 docs page will be
> removed after this. In fact, 1.4.5 was never released for Poky[1], so
> there is no need to publish documentation for it.
>=20
> [...]

Applied, thanks!

[1/1] set_versions.py: remove missing_tags array
      commit: eac1d096a677509cc705c3e99318e80fad44351f

Best regards,
--=20


