Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41827C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:45:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16931.1787579154354736085
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 06:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=BHLcjf3c;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A35B04E41399;
	Mon, 24 Aug 2026 13:45:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 787CF5FFC1;
	Mon, 24 Aug 2026 13:45:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A621811C7952B;
	Mon, 24 Aug 2026 15:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787579152; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uMrejLaGBGoQGD/tJ0+rk+h11XcM6zKOiOIT4h2aoVU=;
	b=BHLcjf3cW7uFdBxk4+4c/Gm9lUyjGr0ix7gq3U15QayYxIjCjLMmTn0pqXI60Uzt6La64+
	QKLMhUS+hkRXQrhAbnF6Izso4LLOyucBz1b7EEm5yzEsou9ShNBsjmM2ShydYqxAMdTbWp
	dIf+qDyMAyFeXDNdQGE3boVkvBnKY0pfW68QDV4Az48JLQ6ERWrC1xhhBmDftY8PVGML+Q
	qYQ79zi73/EUNEXq8PruQ3rvlQZTCmH4N2e7L5taTxxRTf5pXQkk6lv1v7VBlk5f2w+r90
	u3Ij0AXr2KFvvOkk6xjecnjoYElJZ2h94OURvuiVQ41TJgEU9GlMeKe+ii4dHQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Daiane Angolini <daiane.angolini@foundries.io>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Daiane Angolini <daiane.angolini@oss.qualcomm.com>
Subject: Re: [PATCH] ref-manual/features.rst: fix some cross references
Date: Mon, 24 Aug 2026 15:44:21 +0200
Message-ID: <178757686698.159281.9469526290987687240.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814202800.1106393-1-daiane.angolini@oss.qualcomm.com>
References: <20260814202800.1106393-1-daiane.angolini@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:45:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10330

Applied, thanks!

[1/1] ref-manual/features.rst: fix some cross references
      commit: cb7de72f45032e476a772a1ae8f4bd5bd20c882d

