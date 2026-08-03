Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F2EC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:31:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38861.1785745862324566646
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Aug 2026 01:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BnjKzMUd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7D9AA1A13C5;
	Mon,  3 Aug 2026 08:31:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 526336029B;
	Mon,  3 Aug 2026 08:31:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00CE111C17C52;
	Mon,  3 Aug 2026 10:30:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785745859; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A0xUgl4qj4iJ4AMBRtGgqgNKm+0dZJZa0whP+wXP14Y=;
	b=BnjKzMUdcMzgfYlMxhybwO6reEAxCJzlpmV2PJtQuewzXDNUgifdR7PCNW21VechQt/eHS
	bOXSC+tiaMPAG7kG/Btw5rgvLxXmGOICswvuJmtEdKK8i3KmsvMIJdc4JbRwi6s6EJ3Yiq
	7Ikf0r4pO7G9nx7SeoE5f1ttB92MypAOQ16klsPti3wvpu9pW/XcLjNHb/peiXCqFS1jfv
	ZSAnp90NQYXbHO6B+kLYt+hq/zGapY/2sYaa+5L1GnJUT4Hi3TEFlojT85n9fDaylgfMRH
	pRSiac8Ua39Wn/xUOmeKmhmVkMqqysDjwYTTMBkNs1Yalhl9mHKjppsKA4M1TQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 10:30:58 +0200
Message-Id: <DKF62QA1SSEU.1DZK0ZOBIXUWE@bootlin.com>
Subject: Re: [PATCH v5 1/2] documentation: Replace non-ASCII confusable
 characters with ASCII
Cc: <paul@pbarker.dev>, <quentin.schulz@cherry.de>, "Claude Opus 4.8 (1M
 context)" <noreply@anthropic.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <niko.mauno@vaisala.com>, <docs@lists.yoctoproject.org>
References: <20260803034827.26904-1-niko.mauno@vaisala.com>
 <20260803034827.26904-2-niko.mauno@vaisala.com>
In-Reply-To: <20260803034827.26904-2-niko.mauno@vaisala.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Aug 2026 08:31:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10230

Applied to master-next, thanks!

Antonin

