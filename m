Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B3DD609C2
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:14:06 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26517.1765901640094732920
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 08:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=0Thfxxsq;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5294BC1A585
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:13:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2EFC6071C;
	Tue, 16 Dec 2025 16:13:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8854119A8FBB;
	Tue, 16 Dec 2025 17:13:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765901637; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JquRBzdS4duKYCDPx6F51ozLgauDIzGHM/K0HlBR3Ww=;
	b=0ThfxxsqdjRO7mQfhB3pqVuorzks5qtkAlSc7d/k6YerGxpj7xiABwCTNG3AbhoJnnY5ib
	SCS4A0cDAjLRMVrA8GBuZwkjRnUOvwDdE407KUCPx5UWgujDkdZ8F4SrqABufwGdH3CbH6
	ib0kpX4cdq9pS9acIjgUW029zp3KjGMVj3KVvMdQWAX/6ZEbZrl6C2vIQcKtcH1dI7DKLE
	7wkBTmsavxcPKCFrFDMHRVy/hLJSx6BZI8j1bwtTI4Ad48UbmQewDNViXNuE1OYwNAUQ7G
	nts5u/JEAnqlEMDuErWXv1i1Mt4lq43CjdnMcbVH0gMjAXoLXHUPxLdjHKNYJw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 0/4] Whinlatter release updates
Date: Tue, 16 Dec 2025 17:12:42 +0100
Message-ID: <176590152199.120473.2259150854058604689.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204-release-updates-v2-0-04ca6c26ddd5@bootlin.com>
References: <20251204-release-updates-v2-0-04ca6c26ddd5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:14:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8295


On Thu, 04 Dec 2025 14:36:37 +0100, Antonin Godard wrote:
> Regarding which patch to merge/backport:
>=20
> - The first patch can be merged and backported to active branches.
>=20
> - The second patch will be backported to the whinlatter branch once the
>   release is out.
>=20
> [...]

Applied, thanks!

[1/4] ref-manual/svg/releases.svg: mark styhead and walnascar EOL
      commit: 834de77b543de43ee3c1c12ca1d6277e67e126de
[2/4] ref-manual/svg/releases.svg: mark whinlatter as current release
      commit: 6f8e97c6e529f3c47f45f34d9e04e3ad7bddd587
[3/4] set_versions.py: add wrynose as devbranch
      commit: 4f8c8aaee3f807d1db7f466c96647ac8fc095bd3
[4/4] poky.yaml.in: split automatic and manually replaced macros
      commit: ec00b084a44498f324d642061ae11889ebef9f04

Best regards,
--=20


