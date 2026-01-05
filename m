Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6996AC79F95
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 13:53:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64249.1767621187210741373
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 05:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=tLGz7JDR;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8BE2BC1E485
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 13:52:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C0CC60726;
	Mon,  5 Jan 2026 13:53:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45B3C103C8549;
	Mon,  5 Jan 2026 14:53:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767621185; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JCwbzPgxAXePNzQets27JQUEvTObh3N2nbzMRYpstXI=;
	b=tLGz7JDRiSzF/EdEwc50zvpVgeBB5oiRcwuDRiim1NC1p787diLdCcdz/rPjeHSVV3zwP9
	83nSU6MjK2Z5YWJ2yTEb+gyhOPKcAcTS0Iu8uz7GsfICwr6HJyV5/kX+hizDJnf25SiexU
	Z+TbfsOwYcqXAlHmbsK2D7qJ5GdkqUsTDLBUI93SFCqqvv0ePwRFxYdbsvGeMkovL4kKqT
	yDGSjYCdQAxgZEODUy5Mm13Q3VbtWQR5FQh+SwQHoy2TlqXscwR8xP57dSmf/rS0xTMcSK
	m1I/R/AXFfu1gyRiYtHFsklRXzrRF2YIZ8vW5YEoaUViiboJlenug92SijATVA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guide: update 5.3 release notes download section
Date: Mon,  5 Jan 2026 14:52:32 +0100
Message-ID: <176762113055.481362.12113591311684442961.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216143327.759452-1-chee.yang.lee@intel.com>
References: <20251216143327.759452-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Jan 2026 13:53:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8388


On Tue, 16 Dec 2025 22:33:27 +0800, chee.yang.lee@intel.com wrote:
> also align some note with finalized release notes.
>=20
>=20

Applied, thanks!

[1/1] migration-guide: update 5.3 release notes download section
      commit: 0f6a768b809589a1b1caec7fc3fa96aff974363b

Best regards,
--=20


