Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B8BC4450E
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 09:13:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8651.1784193178554858946
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 02:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=q6n40fmT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BBC211A1026
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 09:12:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9105A602B8;
	Thu, 16 Jul 2026 09:12:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6594411BD3CB7;
	Thu, 16 Jul 2026 11:12:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784193176; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aehjV3l39XvOghwys73Hx93L/t8jJFxRUfN0DLyfaE4=;
	b=q6n40fmTuYdQdOiaTStsBYONL887keslnLH2kxW70rRHJn4LUyrw11KGcF9DvJwzY+NAtk
	REqclOgVtyBC46m17BdwZNMGFcNSa9Tr7Von7XdQttrCB68QV33t3ggwEIXdjXbkB2vU08
	rpVUCQ29GVfWaIzDBI6ZPLmmzIcnfLCdmVsFRJ8xg4fl8fx0ER3w5+Ofn9lUO/jboP6aTT
	R7tZHkJjgxFB2qXSgqMec4luuUDZu+suHDzXOTRW7wFvJKF/G3gP6OKjE5gSjZhxUkqoHE
	kxKMCrwDfwzvy4MdnvCzbS2ZnuL7Xi28JbGBJyozj99wHystEWNjscQDTopV2w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [docs] [PATCH v2] ref-manual: add "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS" to variables
Date: Thu, 16 Jul 2026 11:12:18 +0200
Message-ID: <178419298527.94913.8424349956189867302.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <9cd7883a-e24c-8376-5954-cdfd8b18dbcb@crashcourse.ca>
References: <9cd7883a-e24c-8376-5954-cdfd8b18dbcb@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 09:13:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10083

Applied, thanks!

[1/1] ref-manual: add "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS" to variables
      commit: f43fc622d2fd6bc832a2993841b2020f86c6475c

