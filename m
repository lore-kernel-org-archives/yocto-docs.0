Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A54D10F45
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12181.1764162011515206867
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ZvzXEaF3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0AB061A1D79
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D4F2560721;
	Wed, 26 Nov 2025 13:00:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51B7F102F08EB;
	Wed, 26 Nov 2025 14:00:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dDHdwaKjLh73JRziTNCLPPREmRBsjmwmFKnRRKbQHks=;
	b=ZvzXEaF3tm9MFZWPz0uwsvSWJxjL72RviXTKTk/+q2ezPLsWahyYSIf35lVQ5Dt6BrEnC/
	Ji1ywODtEi8Yg8voOONn3DftXONiQNZdhWB90RuElCMLuBThkGI7+mmtroVtBcL2jsqLb1
	eWcZ9mPOJrNujqBkZ3GwO3cSXUAdrgQYspH9ylX0aJMUIWMJ4vReMbqZXUzR9v2O7soxLT
	YT7xgtkXjQe+Pnb0spN6lztEKOhq501lASdlxuTFDKPp/BFot9fmt7kJnxd9UQAqYW8f7C
	a2q42Ms4iiP8lJ4/XCNgo3f0KB9CGZhe+r7z2+XXw2JTIzNSvfZPywF+EssaUw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guides: add release notes for 5.0.13
Date: Wed, 26 Nov 2025 13:51:24 +0100
Message-ID: <176416145943.617433.6058900998670165943.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105072700.1209561-1-chee.yang.lee@intel.com>
References: <20251105072700.1209561-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8130


On Wed, 05 Nov 2025 15:27:00 +0800, chee.yang.lee@intel.com wrote:
>=20


Applied, thanks!

[1/1] migration-guides: add release notes for 5.0.13
      commit: 5a6f63e955807d6aab4a9dbcb4560078c2cec77f

Best regards,
--=20


