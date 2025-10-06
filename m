Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B2ECCA472
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 08:08:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.28500.1759738085442957771
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 01:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=0o9chqOI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1FF854E40EFF;
	Mon,  6 Oct 2025 08:08:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E898F606B7;
	Mon,  6 Oct 2025 08:08:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32ECA102F1D4E;
	Mon,  6 Oct 2025 10:07:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759738079; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y8BKn/YTIYK8uW2xli95is3ky4viZ3GXAPC+vSw/7/Q=;
	b=0o9chqOIltlmc/sRghMZFSwGW3nGc3Mi8C4a57jViMahczVUDEZfVdbKZY8O4MkyeoNJcI
	r/MazLZf8sLr+SAX2W0T/efrGTWIk3oM9S3H+neru+bbqWH3R59JlqD/2fDrDvPWPbd0Kh
	MNL9JHR6/uCFzmgy+R/hjGkXvmgasZF69d2FzL5IAUt/UN7PJ0y+bqS1s6vh+bDZS4ZEKI
	G4bhv0RnvumZ1QL6T9/C8qBuj2KaHGi0M+WYwGn3YqoqNRqzh5O+CEjcXXEF74+7E51t9H
	v2Da0C65IKq6e9bSepUrgP2Gua5X6FgE6u7KguapZjy/zEA3sh1zW1BUh7z84A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	AdrianF <adrian.freihofer@siemens.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] docs: add util-linux-script package for Fedora 42+
Date: Mon,  6 Oct 2025 10:07:19 +0200
Message-ID: <175973778848.1174293.9710057977078850380.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922065859.157251-1-adrian.freihofer@siemens.com>
References: <20250922065859.157251-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 08:08:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7649


On Mon, 22 Sep 2025 08:58:59 +0200, AdrianF wrote:
> Fedora 42 split the script utility from util-linux into a separate
> util-linux-script package. This change adds conditional installation
> of util-linux-script for Fedora 42 and later versions.
> https://src.fedoraproject.org/rpms/util-linux/c/5a2471d6e5b0055cb607b30=
dc2e9613b312ffb74?branch=3Drawhide
>=20
> The package is added conditionally using rpm macro evaluation to
> maintain compatibility with older Fedora versions where script was
> included in the base util-linux package.
>=20
> [...]

Applied, thanks!

[1/1] docs: add util-linux-script package for Fedora 42+
      commit: 22e28e817d2c9b49d9fedbb93b08874cec1fa3d3

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

