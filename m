Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829C8D2D0F7
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:10:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58736.1768309824574353815
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=fFbnVO7O;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 129474E420A7
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DBD8360701;
	Tue, 13 Jan 2026 13:10:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2420C103C8A53;
	Tue, 13 Jan 2026 14:10:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768309822; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a5KO1EiNCXIIWQGRvZewmzGQo3qYfC0yBQfJbt/9s0w=;
	b=fFbnVO7OYKEZWbiFNadLq3TUjHjbAAdUYKz2LMrZ60dSTgcgG2+yWV+oti2ubNDiONeV5F
	seflQqj8FPxKsAAFGS+OIw667RoMW1Jk4Ek1DdgAj8Kd4GqaQ3HqCPl9RnUuQ12vAuXfbS
	zCr8+8n1z88+Y45KZTNw7/ivYKwkuj4K4Ow3NHKlRHeLwM+IpxFlxMvw6t8/xvOD6WbYXY
	Rx3ccJXqMBwcynjoGs83EuOI4irKpvolCCG9tfJR0ogxxbkeP0SQZCO0H70DWB6GoJ6r3r
	VIxmZKDT5ZNhV+WWLHVIQlO/8FG2JpXKsox9FQqofbPzXKXhr5UV1JEOeXuReA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	pierre-loup.gosse@smile.fr
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2 1/2] ref-manual/variables.rst: document UBOOT_INITIAL_ENV_BINARY variables
Date: Tue, 13 Jan 2026 14:09:58 +0100
Message-ID: <176830971043.418327.8513921388861213519.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109093305.1137281-1-pierre-loup.gosse@smile.fr>
References: <20260109093305.1137281-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8503


On Fri, 09 Jan 2026 10:33:04 +0100, pierre-loup.gosse@smile.fr wrote:
> Added by commit cf11b14a4cfc ("u-boot: make initial environment binary
> image") in OE-Core.
>=20
>=20

Applied, thanks!

[1/2] ref-manual/variables.rst: document UBOOT_INITIAL_ENV_BINARY variabl=
es
      commit: 4f7ad2a2279d5551cb3cae59bc315510998a3445
[2/2] migration-guides/release-notes-6.0.rst: add U-Boot initial env bina=
ry
      commit: ee21053b9eccb00ee69f828d6f76e81c9af7c726

Best regards,
--=20


