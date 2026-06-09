Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472CFCD98C3
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73963.1780990119272356160
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=ssjfK5Mn;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C70411A37F1;
	Tue,  9 Jun 2026 07:28:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B8715FFC1;
	Tue,  9 Jun 2026 07:28:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB046106A2A05;
	Tue,  9 Jun 2026 09:28:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990117; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ycOuKfaRWK9iFoJ+rsO6ZbSdovG7JJmrM1MstlqAGt8=;
	b=ssjfK5Mnzdak7s47+zGclIE02aYaw5rTFRSxKCt/I8qHmkrPZcPWxvWSO8DiwPiPCyWbR+
	HOIWGNyKq+gLbCTIsM7IBVxz/7MqIsMhmV4x3GWt2yQ1rHDFx25LqPSPOuC+jA2mxXQYM1
	0LOafj5393z+WTI68CjG+N2tLPyE8QQzlSQEhPYSPCgmwIZmj7pVzfc3vRF7gVWZxjEHKP
	w63cR1UvffnTSkWHokjlr1ScwYr2GPK2nKCHyuYTTy6XPTICH5Hoo/E6/oz2ykBptirmUM
	RBgoGc6ZCO40dF77LHkRFDfMUbTvG5CQDvM581j7NMfbviuZDyMgZcrO9ImEAg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] contributor-guide: couple minor typo/grammar fixes
Date: Tue,  9 Jun 2026 09:27:07 +0200
Message-ID: <178099000199.200930.14862547460265353301.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <306cd0d9-8b5e-5f72-b21f-4b1051491c2b@crashcourse.ca>
References: <306cd0d9-8b5e-5f72-b21f-4b1051491c2b@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9642

Applied, thanks!

[1/1] contributor-guide: couple minor typo/grammar fixes
      commit: a9bf37a1166120f8870422aceaf2f3d8cb53788a

