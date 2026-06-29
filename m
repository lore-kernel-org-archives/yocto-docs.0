Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB03C43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32903.1782720329760606875
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=mqoL8/0N;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 29E22C51468;
	Mon, 29 Jun 2026 08:05:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C1D35FF96;
	Mon, 29 Jun 2026 08:05:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5A67106F1584;
	Mon, 29 Jun 2026 10:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720327; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2vyJ+IkLTLYf0kAPD3K2skyVbpVi+o19Y9Cszb546GM=;
	b=mqoL8/0NdfteKQIARuRCZzJ4YJQFPDF5SgcCjkZ0ZiZVTFIbba3lLWmuaFyHVmvmAsr+gC
	2L/mL+fnaanoqk/dQY7nXbXb0yS+/KRY0F+LYAG3In0q94hEr9WDtm55RcWoxxP2agJBXN
	8ifL/XJQpe3u9CZyaBybQdwXnlvscngwB7s3ZcYu0zUzUDexqW27JB+Bz8J3I8cI3NKDR/
	WPAlX6A6g1zZbHBrHfNfe8OCy/unOfu4xmi75fqx3fjLBKRL5W0dqw9U5QyD1dPJRTpjPZ
	izc8bkMqlY5U6IXp95aixgxtY9LnzSVleQ5Go1bxj79meXNM6PJKlQ1QU0fu2g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v3] ref-manual: add missing entry for build/tmp/deploy/spdx
Date: Mon, 29 Jun 2026 10:03:30 +0200
Message-ID: <178272012653.45179.3936895117221027977.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <5d1922b8-dd2d-8a47-dc3f-fb3a8d017947@crashcourse.ca>
References: <5d1922b8-dd2d-8a47-dc3f-fb3a8d017947@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9960

Applied, thanks!

[1/1] ref-manual: add missing entry for build/tmp/deploy/spdx
      commit: 0d607004917ea231bd89a07c8ec254c7ad374e75

