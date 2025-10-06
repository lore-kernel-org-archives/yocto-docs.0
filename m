Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C22CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 08:08:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.28498.1759738081561089177
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 01:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=juias/Gm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7B3234E40EFF
	for <docs@lists.yoctoproject.org>; Mon,  6 Oct 2025 08:07:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 506BF606B7;
	Mon,  6 Oct 2025 08:07:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C1E7102F1D4F;
	Mon,  6 Oct 2025 10:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759738075; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XaGyPV9W5A/xCTL+nBkC7nwYni6skPqfp6o4+ze/tvU=;
	b=juias/GmGIRR8VulbDvKwW97i8MCb29xwkkSAtDdOfyr7mPV3EjehPR78g+d6I+gTU7k5R
	ZF6CsoiCPMfksxp/hoW7itoMktRn9fLc2YJ+7QOLo6OjzJVqBP+WJGKPmOU4azy3URv9Kp
	QQtwMpGVlnK8Q9XmoxLxZLuzRI4Xl5ziWoJm7EbkNOcdwGV7jfSIyB+wQb93HhmSeurFkT
	Ll1AmgxMtPREk8gUxaP5E1LFh6VxXdA7Y8WT32g+/4KqVZ93e0o+lVK7cFgDiAXTm5bkJU
	Ru8bgKVxoOEue5y3CbNEiAitBzFF1bg8MkXHusYhXzze3cpkkODOgaWwKaOUHQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Adam Blank <adam.blank.g@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2 0/2] Fix KBUILD_DEFCONFIG documentation
Date: Mon,  6 Oct 2025 10:07:18 +0200
Message-ID: <175973778847.1174293.13225751211280586122.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929071634.25670-1-adam.blank.g@gmail.com>
References: <20250929071634.25670-1-adam.blank.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 08:08:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7648


On Mon, 29 Sep 2025 09:16:32 +0200, Adam Blank wrote:
>=20


Applied, thanks!

[1/2] kernel-dev/common.rst: fix the in-tree defconfig description
      commit: a808420655a0976ba08f013f468cf80f379b1d89
[2/2] ref-manual/variables.rst: fix the description of KBUILD_DEFCONFIG
      commit: 582ee9e0b4930aea03255542b3d3913df19af8b0

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

