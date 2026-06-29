Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07C9C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32899.1782720321908938648
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=S0RFpOgn;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 41EAD4E40B5C
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17BEE5FF96;
	Mon, 29 Jun 2026 08:05:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A4C3106F1578;
	Mon, 29 Jun 2026 10:05:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720318; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M+eLjE8Bk6QGEYM1x/p75LboCiSg5qXoxN98dfbSuTs=;
	b=S0RFpOgnt6uKNkooGJSVAVPFE2sb4yLpI6AXcghAbzHzEADQJQbOSF10IBlZN+OGWtUBg2
	76LAlaQY83+R2QzV6kqnjKpqIbYOJaC9fCZlX7iG2ILmIOk8oPijd/0a/n+/N7KWKubwHF
	23Cyn9S/9alGnFhT80dDWFjfA6zzbFJPg03qNIJZv8WKr7gcyLK9S7AyKNhYcFy4AuCMMl
	D8moQImLn+5dsthuozUinfWqiTHae8gIP4VI+0/ajVC5ApYDe6SzvGOh0c5n9ahdRaRsLj
	Nc/wsx8WQt/dexlVckX+hxejDlJ1+Ht26qtcUgModQUnQoBaAHGCyNAvJh84TA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] ref-manual: clarify that PACKAGE_EXCLUDE supports DEB packaging
Date: Mon, 29 Jun 2026 10:03:24 +0200
Message-ID: <178272012333.45179.7409206586310569424.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <3faa7374-9428-5882-2862-861454dd0b49@crashcourse.ca>
References: <3faa7374-9428-5882-2862-861454dd0b49@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9954

Applied, thanks!

[1/1] ref-manual: clarify that PACKAGE_EXCLUDE supports DEB packaging
      commit: 195fc0981996998ba2939bb9ce8770f396e5f438

