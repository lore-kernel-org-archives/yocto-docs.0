Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960FCC44501
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87424.1782720328363104589
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=KjuUliu7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B38FD1A0CD7;
	Mon, 29 Jun 2026 08:05:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 893EE5FF96;
	Mon, 29 Jun 2026 08:05:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 402C5106F1578;
	Mon, 29 Jun 2026 10:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720324; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7emdBaxfgoFhwVtn1nbnwxo4QnXTuDX5+Xklgze/uB0=;
	b=KjuUliu7W34T7wjxC3eV8lBM9HCR+oMmAQDW2SATGJZKqnrCOIb20I8VHcZZiWZlXEThzb
	yEdpb/Ko7/agB7pMEo/4cYikWE2Uj6kAEkvK2XTWnpQXZQqN+oMsfEvsI6u7LYaRlM7Bcl
	Cn9w8ZJIsZL8wI3Wx1CGoGQcdMOV6DNVs8/IqMHSa3cX2NQoOafKtf9HU5612Myb8ZMaFf
	hZMmGLPM8ecbggWnnJxvuKU54/ai7/69z0s0K9bwX+y/eK1g095Oxp00a3Fg2aFXIZmCuK
	vDgWm6Kii3Xm/wUuD3nBVlDKDNbPdnjQc1n3j91D4O8nwJuz0ikhiqhIrvucxQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] ref-manual: update glossary entries for packaging backend variables
Date: Mon, 29 Jun 2026 10:03:28 +0200
Message-ID: <178272012572.45179.1149078040217019251.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <19502e62-c54b-239f-1b9e-13f963beb9d9@crashcourse.ca>
References: <19502e62-c54b-239f-1b9e-13f963beb9d9@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9958

Applied, thanks!

[1/1] ref-manual: update glossary entries for packaging backend variables
      commit: 2d813f54c7e204dcafadf34616d59b1530e642fe

