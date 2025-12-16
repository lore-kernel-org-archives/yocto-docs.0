Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0814ED609C8
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:14:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26522.1765901642384949178
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 08:14:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Lp7b18cb;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 474A8C1A585;
	Tue, 16 Dec 2025 16:13:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBBD46071C;
	Tue, 16 Dec 2025 16:14:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D91F119A8FA9;
	Tue, 16 Dec 2025 17:13:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765901638; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BDx65seaS6M0kW7y45mtrB88aRPYsI/MKAav3NcOag8=;
	b=Lp7b18cbva5TXX6rrgjzXpiWny7ReexFCLvB81MTrgZ7jKthABmQorHe8Xy+IP7+itnY9D
	zx/DvIO2aY5oIvicovmHLf4Yff8wwLzjCO3GIcsop1HMsS04TzdVkHsSzx0wRveGzIKbKE
	qafc5lPRxauRG3mtc8qqc2t/gYrW71GMdQnJC3y7tPE/MBuBVJm9n9bdQTYqnuqh35A+yr
	6mT/g6bz0iW1EDVQuOQxfvu63zZ4vvnfJqLzfUiY/BG/YxwksJVWQN1LDqAOFNJ6tfbmtM
	xGY70hRd4RV0P2Cpjvx+lzly1EzotUA3lkbvXe9MyD1ZquohA6UZ9a83WqGWMw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guides: add release notes for 5.0.14
Date: Tue, 16 Dec 2025 17:12:43 +0100
Message-ID: <176590152197.120473.4014886468390348112.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204074630.73375-1-chee.yang.lee@intel.com>
References: <20251204074630.73375-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:14:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8296


On Thu, 04 Dec 2025 15:46:30 +0800, chee.yang.lee@intel.com wrote:
>=20


Applied, thanks!

[1/1] migration-guides: add release notes for 5.0.14
      commit: 79e597aa45c4b171c8340d48803fa9987926851e

Best regards,
--=20


