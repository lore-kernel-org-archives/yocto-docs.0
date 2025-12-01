Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978A4D116FC
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 08:36:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16804.1764578187913016738
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 00:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=mTr/xHXZ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0DF77C17B43
	for <docs@lists.yoctoproject.org>; Mon,  1 Dec 2025 08:36:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 31F5D606BB
	for <docs@lists.yoctoproject.org>; Mon,  1 Dec 2025 08:36:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA0A3119121CA;
	Mon,  1 Dec 2025 09:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764578185; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XNcprRUJD8QUkGH3CisNGy2IOXhXpNKUiXibGp8BhDw=;
	b=mTr/xHXZEf0/PvTJZtxrZZjhPkckZyVXCbPfSfASYHg7e5Twx1Ue7gaDFDlU5Nz4f439/F
	Ny2OWzWrDarcuDCfZZnhvOAxlPcEJ8C0AMCJoU213nsdcK1YBDiYmdv8xGiO4f0Fvu51aG
	bdFFyrxh7JMW8pFSe9ghbAkbr+Tc7KfuFeTjSiRbMIc3yfHxKca7CSQj2AxDsZTcUPzD2E
	gdEHFmOR3M8Dhv/6tVLDmZjtOUTCfh41zpK/m5feKw1ifIX+pPr8pbHAUOST0gvifywZfi
	om/WfFjFK9Yq1eILgJIsdBJfKkSzAdPKdjLh6mhgb+17UoEbgG2MM4GZW7W4cg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual/concepts.rst: update the cross-development toolchain section
Date: Mon,  1 Dec 2025 09:35:50 +0100
Message-ID: <176457799705.63554.11165323662736310893.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251126-fix-concepts-toolchains-v1-1-f701b23f0aff@bootlin.com>
References: <20251126-fix-concepts-toolchains-v1-1-f701b23f0aff@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Dec 2025 08:36:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8175


On Wed, 26 Nov 2025 16:47:43 +0100, Antonin Godard wrote:
> Update the cross-development toolchain section of the concepts document
> to make it GCC-agnostic as we now have Clang support.
>=20
> The chain presented to build the relocatable toolchain
> (gcc-cross-canadian) was also updated and simplified. `bitbake -g
> gcc-cross-canadian-aarch64` was used to understand it better.
>=20
> [...]

Applied, thanks!

[1/1] overview-manual/concepts.rst: update the cross-development toolchai=
n section
      commit: f663242ea22fa9c5b904e9eaf24991d1fbe53409

Best regards,
--=20
Antonin Godard

