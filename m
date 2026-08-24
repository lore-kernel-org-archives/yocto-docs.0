Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33428C5DF9B
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:45:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17066.1787579153670713709
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 06:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=FXsnnvx2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F261E4E4138F;
	Mon, 24 Aug 2026 13:45:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6B2E5FFC1;
	Mon, 24 Aug 2026 13:45:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAFD711C79594;
	Mon, 24 Aug 2026 15:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787579151; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2s3XP3Hclvy97tZecS/2wVTOQVgAB+qelqZvVbOYhzo=;
	b=FXsnnvx2YFKWKKuspVdxHJclMOAGS9KmJfrp01Ge5gD+ICv53jv3xx/chsAlGrx/039bAf
	GS5QdNxqD7kMe2WD3+NJBdxtTLClzopuChWtT/sGEveoI0sP61NJTj/5z+/59wzjh5M9ch
	Nrr4SXf+jp7SZCz2+lsH2eBjDfCWPMbm/TCIQQkNxVMNWCm3OOUvoRpyu5me1/2hBhHn5o
	CnA+EJNl/AYx2ESp0MkUAudCMhJamQfdi0F5ve1wqWvCg3AHNR21xF9IR6YKAtxR4oWWNi
	+FgBCiqH6MdCRUXgMT87EelaL6fGN1/iGVG6l11IjA6VMRve293F1NvhU7yyBw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Daiane Angolini <daiane.angolini@foundries.io>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Daiane Angolini <daiane.angolini@oss.qualcomm.com>
Subject: Re: [PATCH] docs-wide: fix manual names in cross references
Date: Mon, 24 Aug 2026 15:44:20 +0200
Message-ID: <178757686700.159281.1458719799246155240.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814220720.1115397-2-daiane.angolini@oss.qualcomm.com>
References: <20260814220720.1115397-2-daiane.angolini@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:45:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10329

Applied, thanks!

[1/1] docs-wide: fix manual names in cross references
      commit: a002724c80e958ad6336db9994ad28671da79f36

