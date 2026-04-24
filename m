Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B91FC037D
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:44:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16525.1777020242688393934
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=dvd+PVPA;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 245171A33E5
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:44:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF8D0604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:44:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31E7610720746;
	Fri, 24 Apr 2026 10:44:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777020240; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zCxwr970iB/84KXUbjflek8CpIDaHUwBkqsO4l7Z5bc=;
	b=dvd+PVPAgb1AHnGrnPODJq1vZCTGLungVQfxz8YGVSMfqM3wVPQsUFESJcCwTy3FmmnI+p
	kshUuQFzeuabnNfQUqZujoCyUXkPHrZEk/B3t3gF1YHKnzY9PiMBm/3mOmw4XiTmLzHg1d
	TpCIWOOUOrygkCUmI0A+FVzEWZHrCWCGOptTorkjqUGEY+rwi7777NqNZikZDku53GELp/
	94+I3cu41+cMhLxbvYzft6pI45s+vjkE5xXZJK8dv6TnXJVH4fm9PjCi4YrFZCOMh9I0Bl
	XYMUt1r0qiFz/Oe7dyZKk0u6f283t85SO7bpUBeD1AqOHyK8YENka44jAUXEpA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Benjamin Robin <benjamin.robin@bootlin.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] variables: add precision about special characters in CVE_PRODUCT
Date: Fri, 24 Apr 2026 10:42:38 +0200
Message-ID: <177702011521.92831.10864075063156598746.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420-cve-product-v2-1-3396c3e22042@bootlin.com>
References: <20260420-cve-product-v2-1-3396c3e22042@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:44:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9361

Applied, thanks!

[1/1] variables: add precision about special characters in CVE_PRODUCT
      commit: 4e3b46d0013d214abeaf6a7ef5e2e3a9086fadf4

