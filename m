Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0D8CD8CBE
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73974.1780990129024050005
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=WqPK0F67;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E2BE6C4FED6;
	Tue,  9 Jun 2026 07:28:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CD9D5FFC1;
	Tue,  9 Jun 2026 07:28:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8C09106A2AC6;
	Tue,  9 Jun 2026 09:28:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990127; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z17g5yDjV4i2XR4oghxWDGSC5kWEYHSUJE628ttO230=;
	b=WqPK0F67/4M4lwPzlg6ooxVMSdtIksIgcNVUB5T3RxbL0bOxV1bj/bCRb5sT0mWiGj8wsj
	Mxea0M6HTsoUFmMWoIyNV3p51Hkma/TMhkoZ08si1iDGa9TYrzpgUQjFQ5PFTQyeGrhdoA
	PEX+L1A+TkvGsOReHYUkXCITFtfWJaVyxgd2FWdhg0KvSgiO13DKeXpN7rLHp+T1wvR/Fk
	l2626Jb+qRFIQiObM+JSxMJUmhRHaXem1unfawxfhyYpk5EycH9pvB4JAPhl828zRKSwaz
	fzL11zVGq8L9GuJy/iPhKC7iPYGEQ451/YATRU3iqEE3QrgVmGnV2gK+MN91wQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual: use correct spelling "counterpart"
Date: Tue,  9 Jun 2026 09:27:18 +0200
Message-ID: <178099000170.200930.14440329543245131501.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <9c30130c-e27a-b6b5-2b40-f4de9cbd0723@crashcourse.ca>
References: <9c30130c-e27a-b6b5-2b40-f4de9cbd0723@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9653

Applied, thanks!

[1/1] overview-manual: use correct spelling "counterpart"
      commit: fa4ae5e6d19064c0f049d2a1656bf5415564fb13

