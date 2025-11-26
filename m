Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E86D10F40
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:15 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12332.1764162010232196568
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=epsYYQ0n;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BC6E11A1D76
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9289B60721
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CD84102F08EA;
	Wed, 26 Nov 2025 14:00:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162007; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Rwl1IMskE/CCGo8X6mBJzWV4ieKCXj8hi0SKIcJWYHk=;
	b=epsYYQ0nFAWtgcUaPcunp3R4essVieDDrpywEgUQJ7rIqefL3SM8TS82TOQXNDTz0ONE8A
	83U6Bd1vVts7A5MHllUsWeZkyRmg6dpbHJ7x9SENYQoELy10Hqove5IeWxR7Kehqil0Hx8
	SXEvxLNkHyFSQPpXnWc8zhxP+ns1i2BqUbalf5XR6QxSu86gIPCJyupOMBrs25PSHYQyYZ
	A1imIDT7Ijq4VLa+9w5XDpT8PABDkDweUT6tcQUXrzDXcMJ34/NHqLESPvFIg9gP1dJRry
	bMXl7Xi/30IW9EuNuoj1Yzia15X7HxYLDuRMp/fUp0mKaZBRM5AIVTkq3Qoc0A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual/system-requirements.rst: add ubuntu 25.10 to supported distros
Date: Wed, 26 Nov 2025 13:51:21 +0100
Message-ID: <176416145959.617433.9917804062645602966.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251113-add-ubuntu-25-10-v1-1-092133ab6d40@bootlin.com>
References: <20251113-add-ubuntu-25-10-v1-1-092133ab6d40@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8127


On Thu, 13 Nov 2025 10:03:46 +0100, Antonin Godard wrote:
> After it was added to meta-yocto/meta-poky's sanity.conf.
>=20
>=20

Applied, thanks!

[1/1] ref-manual/system-requirements.rst: add ubuntu 25.10 to supported d=
istros
      commit: 40f4c2077faa31e6261dc698d8dc7bf0697e01d1

Best regards,
--=20


