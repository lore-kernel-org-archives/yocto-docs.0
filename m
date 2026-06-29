Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BC1C44501
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32881.1782720294122608142
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=fFHv/h3/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7A0041A0CA1;
	Mon, 29 Jun 2026 08:04:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A7205FF96;
	Mon, 29 Jun 2026 08:04:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E050D106F1567;
	Mon, 29 Jun 2026 10:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mUCzUZKUaQEIbvD7IYy5I31lN+zwUPMWShqB9O8wSrw=;
	b=fFHv/h3/daad1NzyGSvzHBuGs4nGEDj+NdfKI9P/pPbJ6b09MpPbFQN4dWhwZVsNr+r81I
	kH6Ve+zaC/t6GPhN5p+vJ3dM0BII0XMQBda4bFeX7MV/aZ+DgzStKy3jwO4fhINME7oKCm
	DLDxesmfOL1sntmTowjr8sNBEOqoJhFRYm9P2g58eltHjZo/BXkN7JDyC9APR2VhTriCir
	pr3ke2Cp6/pUzd5yT+ynH3O4TdOlpvbt2i2DoeqADvhMHuOi8l+W6OozxLihw8YNaFcQBf
	aAYJgWElYb9lza3nLlzLwWVd4mVtONX7SQxsadUuZfwpzhFGYVz1yDdItuPcbA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: fix broken grammar in "Libraries" section
Date: Mon, 29 Jun 2026 10:03:03 +0200
Message-ID: <178272012467.45179.7448722211323625576.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <e9b3258b-c745-860c-0da8-7e3ed1f1389a@crashcourse.ca>
References: <e9b3258b-c745-860c-0da8-7e3ed1f1389a@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9933

Applied, thanks!

[1/1] dev-manual: fix broken grammar in "Libraries" section
      commit: ff83e149175dc7470770cc53fd75a243d0fc8191

