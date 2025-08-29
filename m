Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0EACA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 07:41:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.8264.1756453282333436794
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Aug 2025 00:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=wnWfMTQ/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 964B51A0E44
	for <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FF07606B9
	for <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BDF21C228095;
	Fri, 29 Aug 2025 09:41:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756453280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mK+nPw+Dy99a6gJmu6ArotCXTetQBfi99AD6ersbmtQ=;
	b=wnWfMTQ/mjSkj2x6P3M7w/f6AELTISdE+Buc6TC7LfJjhYVr6lV1rC1z3VUjWOkc7AFV0I
	w/TEInltQrdJFKTYsv5g7f667QFhK+34qMTAfzA0+OO9SH6ihbYhi6yBZNAcRnP/2FzD3l
	iTF2WnSGccdESF0/WS3f3iv9AoTsIaI7tP82Pg7cbp86VT1iqMG2fuE/2RzTTMGkYWMoPI
	jxroou5pZkSiumQsmsD5/COy/siVHMpBt/QYazBeuw7xJOLgdW0AuAaV0zby+I0XC+x++A
	lsx/Cx9kVVgY1EO+TAK56Zm6OfCgALPDXPolki/C9SJKjphcxkT5dgl1PtIK+A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [kirkstone][PATCH] ref-manual/system-requirements.rst: update supported distributions
Date: Fri, 29 Aug 2025 09:40:59 +0200
Message-ID: <175645283483.82658.394687439295152905.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806154546.719832-5-antonin.godard@bootlin.com>
References: <20250806154546.719832-5-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7465


On Wed, 06 Aug 2025 17:04:48 +0200, Antonin Godard wrote:
> Update the distributions to match the list of workers on the
> Autobuilder. This list was generated with the help of
> yocto-autobuilder-helper/scripts/yocto-supported-distros.
>=20
> Also:
>=20
> - Sort the lists alphabetically.
> - Fill the second list with EOL distros still running on the
>   Autobuilder.
>=20
> [...]

Applied, thanks!

[1/1] ref-manual/system-requirements.rst: update supported distributions
      commit: 56a7e8c209e804896558d759525d0c0317ac0ff5

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

