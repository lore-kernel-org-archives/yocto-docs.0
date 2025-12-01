Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B5DD111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 08:36:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16803.1764578187912846445
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 00:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=agLwRHBW;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ACC5CC17B42
	for <docs@lists.yoctoproject.org>; Mon,  1 Dec 2025 08:36:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF76E606BB
	for <docs@lists.yoctoproject.org>; Mon,  1 Dec 2025 08:36:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35C4B1191211F;
	Mon,  1 Dec 2025 09:36:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764578185; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1jwZTrz21MDuwDydJvLHYpM1ROvSr13BwvwDNEefkhs=;
	b=agLwRHBW3V2G2+9eshiUvp6L6OKZhJSIWCtm3tUq4F+5j7sDZBfI6LyHDaT4bzrWd1HKIh
	d/H5jSlLdA0aoiMuLjFSDPH4G6jZ0/ZY87lN0prT8sAOohGFSdJa9VOhLy1Q7Ua+kWcqPq
	YFBrvPlLo+/tEXdzgGtsrrqois9XcEs8eOIhTPLJEY2jCpGUVBEcL8/UMEg5TrkHio2DSd
	odDEBK3lpXI90fB+4ebi5y6cCTKglP2ArWj25crY8rY0DYcE1IkOQZK0ywWCpyPVZwOHjc
	muJUt5QVzljbM6rG1b7Urx59Es3ooO43lCW5TN3+dL48MDFqnzSjfNkMssNhQQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/3] bitbake-setup updates
Date: Mon,  1 Dec 2025 09:35:49 +0100
Message-ID: <176457799708.63554.16142983454618110413.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127-bitbake-setup-updates-v1-0-75ac1e490a40@bootlin.com>
References: <20251127-bitbake-setup-updates-v1-0-75ac1e490a40@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Dec 2025 08:36:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8174


On Thu, 27 Nov 2025 17:37:44 +0100, Antonin Godard wrote:
> Add a commit to be able to use the release series in a numerical format=
,
> and use that number in what's shown in the output of bitbake-setup init=
.
>=20
> Switch the shell code-blocks to console code-blocks.
>=20
>=20

Applied, thanks!

[1/3] poky.yaml.in: add DISTRO_RELEASE_SERIES
      commit: 4d6bce0c3c61ca7f6f49b5aa0dc69e9da9d7584b
[2/3] brief-yoctoprojectqs/index.rst: update available bitbake-setup conf=
igurations
      commit: e5cded397725835e3d352de163edd9806750e345
[3/3] brief-yoctoprojectqs/index.rst: switch shell block to to console le=
xer
      (no commit info)

Best regards,
--=20
Antonin Godard

