Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7070FEEF44
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:13:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80901.1775567618203206954
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Apr 2026 06:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=j1FlRJM5;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7406BC5B18C;
	Tue,  7 Apr 2026 13:14:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD37F603C7;
	Tue,  7 Apr 2026 13:13:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B52F1045020E;
	Tue,  7 Apr 2026 15:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775567616; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zx1M198BmKEKQ7EoWd6bpD6JYovfirT9JDx4iE1ovLE=;
	b=j1FlRJM5xNdLIzYFDHtxjKU+tfLOtQGgkuRkc0CAFieKy5JkRW96mHHe9gGOhwOuIQ2IfY
	qEXI1k2EoqODT81saCpdlU02+J9gJVNWZDIT2XqEymWAzXfXYd8DtaajTB4j9/6Gm9e4/x
	EjvNY6IW4ecNw8Fo2njq0WA9CbPvuf9wNC+BII+Zb8E4LQZwyqew0rMH917mUqfDCj4odB
	hJlIQ65Jpr/78uwpJgjAigpWaW1lMTjlkQAtep/B8O8rLgxzpewY/a+EyuIOInjr5q1w39
	djwGSMOAnaTABwRyJpP8gqySn83INXVd7mu1TAMyS/RXKhAJmguTJVBNd3caag==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	stondo@gmail.com
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com
Subject: Re: [docs][PATCH] ref-manual/dev-manual: document new SPDX variables and capabilities
Date: Tue,  7 Apr 2026 15:11:47 +0200
Message-ID: <177556742859.245356.4667804354467853669.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317085735.32664-1-stondo@gmail.com>
References: <20260317085735.32664-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Apr 2026 13:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9193

Applied, thanks!

[1/1] ref-manual/dev-manual: document new SPDX variables and capabilities
      commit: b8502b2ba5707b7036c26f9218b5846e0ed2ffb8

