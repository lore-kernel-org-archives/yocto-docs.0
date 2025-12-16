Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF126D609BF
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:14:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26514.1765901637850413104
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 08:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=dqUlG0cT;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D0F0E4E41C34
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:13:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93E626071C
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:13:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9EC2C119A8FA9;
	Tue, 16 Dec 2025 17:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765901635; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KuA3xbuHzxdCDsM4BzMLjg6j6K9P4zYP5LXj/7gSMsE=;
	b=dqUlG0cTEHbhL+VTHH6mbFHZULv9HhQkjgwqvnDz2ONwT/Z7ycwJKEMZmRcqgGQF3po/+e
	MtMs+4zy7pbPuJmfLiPngmStdArvxDiO1Iqb4sxpMxC0GH39zquxku8RqjYaknI2NR09R5
	JxLnPljeqqyr5+4eLfNI5snghYye7MhNTnOG+2fbxa0zGftV3CJ2Svowc9nYCeWpfzdDrS
	0ZfdGSEJc0QMj0h47DN57yfk7Xe1FtdRbk1oVNooANjHm+pv+VGhNbDF506DVI+eWbLPcD
	ahBhlXKbZTxLLAaIEe6S7NeOydV26szjGb2dwOcNusmKhy2Yaa2w0yJ9pQ1wDg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/4] Various docs fixes
Date: Tue, 16 Dec 2025 17:12:38 +0100
Message-ID: <176590152186.120473.8442517407333798645.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251201-fixes-v1-0-1cf15a5a4cbe@bootlin.com>
References: <20251201-fixes-v1-0-1cf15a5a4cbe@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:14:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8291


On Mon, 01 Dec 2025 10:55:18 +0100, Antonin Godard wrote:
> Fix obsolete documentation in some places, after receiving reports on
> the list.
>=20
>=20

Applied, thanks!

[1/4] ref-manual/variables.rst: NVD_DB_VERSION: fix default value
      commit: 238c88a25b2fc0879cd549c1eaf00498dd4b86cc
[2/4] dev-manual/temporary-source-code.rst: fix definition of WORKDIR
      commit: 9cb0e8a94590563491e210b403519ccfbde866e9
[3/4] overview-manual/yp-intro.rst: change removed ECOSYSTEM to ABOUT
      commit: a8a8d810f0505529aaaa90678e03152c8ac0c00b
[4/4] overview-manual/yp-intro.rst: link to YP members and participants
      commit: 9d394db4f88b66500e4d5a2a518d25f08a0c9472

Best regards,
--=20


