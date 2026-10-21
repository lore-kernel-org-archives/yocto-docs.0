Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6036.1792567328234619881
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 00:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=qNaP2kNf;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 836264E4125C
	for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 07:22:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 592CB606E3;
	Wed, 21 Oct 2026 07:22:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11D1410328C5E;
	Wed, 21 Oct 2026 09:22:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792567325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mcfX4YVgF7vydZwfBUN6icGpOgdsIvqOvU/wi1Ozx+E=;
	b=qNaP2kNfJp75nC3KTcgrwEMM6WCGIZgsFstOgdH01rHcyVITNfxiVHYtQmBO0eI3OToz3t
	7WMq1KqTgu2HdqHrL2cN42j3TVXyfe7OoFTEmnmtmmSNXqDmh94D6BvyI7aT9/FrHBen8K
	vypOGCKFk6t8K56OLsZUGIo/y9o8BFMWzuIedUFWreW0RGdtWXnllJ5HKeK1eRDjHM6zKa
	mYoeh64LWzPGN27rnGjDtJGHmxUF1H2dD/OE969sT3H4On9EJGM0+eXMIVKTcTjc7A5x87
	OOpY/eC8GmBWXYO6d020i3/h2OqnE1X4ugLA5yzDOPYHoV/DyRHIeP2FcFgFbw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: correct directory name for oe-core wic files
Date: Wed, 21 Oct 2026 09:21:46 +0200
Message-ID: <179256699497.524663.6540763490190581761.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <d2b5671c-6a58-530e-608d-5e2cd2d44343@crashcourse.ca>
References: <d2b5671c-6a58-530e-608d-5e2cd2d44343@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 07:22:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10701

Applied to master, thanks!

[1/1] dev-manual: correct directory name for oe-core wic files
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D3b784f986bb1
