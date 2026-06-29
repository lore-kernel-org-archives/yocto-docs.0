Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA41C43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87417.1782720309849055370
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=peFj8Lso;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 38669C51462
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AE655FF96;
	Mon, 29 Jun 2026 08:05:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF011106F1570;
	Mon, 29 Jun 2026 10:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720307; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tc6AqyqBjOvYm2m5gpN37vV+O04GNJDXaoaunjYpphw=;
	b=peFj8LsoywRDQZPWKLpkFTh4FY1iGvrsOlDwyQRbmbBJHfMEhjlO25yqTxRRaqFBDnAeM1
	nLPfB/6ib/1hH1OsHbtCSYxdKgnNq0uujVpXB0b/bGN5oPH3BVDdwJNXYgoVLhBl4/T7z7
	sDMq90gAe/+J0p/qZrMwcaexAo/2G6v1sQPeF7LJxiAMhw2oxKc5fxYK9A78LKRK9/wyyM
	qkjkBwrXUhIiGENjbTbz0RivT56o44CAOrlWTIRs5k/xpURBpElE4QBjbIHExmWMvbaynx
	osT7emZBSWC2goVcIifFmuPUo3Um+EDJmkng8AiqTioJSVgydhjR59cqjLe6Aw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual: add more explanation to glossary variable LICENSE
Date: Mon, 29 Jun 2026 10:03:15 +0200
Message-ID: <178272012582.45179.6178652162183915656.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <3beaf215-35cd-0e87-ce29-cdf2ff3a8135@crashcourse.ca>
References: <3beaf215-35cd-0e87-ce29-cdf2ff3a8135@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9945

Applied, thanks!

[1/1] ref-manual: add more explanation to glossary variable LICENSE
      commit: a75f75fe86c339246b94b78c593c54647a75ba6a

