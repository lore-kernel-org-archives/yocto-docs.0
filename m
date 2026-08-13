Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FE6C5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 12:02:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17365.1786622564592382379
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 05:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=aDCzPdqW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E302C4E411F1;
	Thu, 13 Aug 2026 12:02:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7053602B8;
	Thu, 13 Aug 2026 12:02:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1C8311C4DE72;
	Thu, 13 Aug 2026 14:02:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786622562; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zr1sVogqN8ty2//7hmlu1ftK1ZWLYKP+hkv39acyb9A=;
	b=aDCzPdqWZ+4pDYH6SQsOTgeN9tLUHDpf2ntqHTleFqqrdLg93P0bgn1/MWalveXyUBHq/B
	IfKJtpnXf08nlMDj1bN7nP6Badve/baOnmJLjEsNog3pmc93BazlLNwmptA68/jsU067gV
	fpCqrJ3DGRn1rtvI/rm20BySPQAY/p2goy/KLSfzRK2yBfeEEBkQclA597hoHh7fGWaEJN
	0dCPbllYAiteE1PjyVVGQRXyMZtWHpp7nr9nxC3sWTLgUHn6u+KKrOUd8HqG6OyL8qUtsD
	dqZsk2Ypz+75DuJolQthV1Aak5S7xdswwUd2EIBlkHSW3QkJrIgDgwN8/0rHiQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	niko.mauno@vaisala.com
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	paul@pbarker.dev,
	quentin.schulz@cherry.de,
	"Claude Opus 4.8 (1M context)" <noreply@anthropic.com>
Subject: Re: [PATCH v5 1/2] documentation: Replace non-ASCII confusable characters with ASCII
Date: Thu, 13 Aug 2026 14:01:42 +0200
Message-ID: <178662237131.775933.7632669156582632499.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803034827.26904-2-niko.mauno@vaisala.com>
References: <20260803034827.26904-2-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10283

Applied, thanks!

[1/2] documentation: Replace non-ASCII confusable characters with ASCII
      commit: 79c3f9788ce19275f7a263deb164a434743d5cee

