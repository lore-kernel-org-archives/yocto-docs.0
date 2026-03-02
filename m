Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F668E9B368
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 11:05:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157969.1772449502195462173
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 03:05:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=AtNVnBsN;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A69DF4E424F0
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 11:05:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D6E15FE89
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 11:05:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DEF1A10369333;
	Mon,  2 Mar 2026 12:04:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772449500; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jBfzA5pYl2ydhQDUWqiitZu4N3d+wEwil6nZerRVa0Q=;
	b=AtNVnBsNT3XIopQM0Vgl80OR3tW3ilXMLgZLtPPzoVaoXtRpxB9WSo9UbmozNkLdwMl7MN
	UqAJP4ygI2g21RuLKXU/t53+Ojr45iXEIR5JOsk73U7snHroz+rkTsCPVVnCnCwG57pXyX
	5XE3o9AP9GyiAGNdCDRlf5r5jYWnN+d/pwrcFuhs8kZwtvhKsl/sQSwuH2AWaK546/GoIY
	Y5NCos0WPQ5r2aqsX/EN9KTs9ZUowU4bnI9FOKVi7/DSzUSFUK0We5i4TRnkovDFPNde1H
	Urtn5fhxMfPICx3hQtPF1cRYZd0Ihf+WTN3ftvAz+KKyC2TFMCjGEFI+Ceq2GA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: [kirkstone][PATCH] ref-manual/system-requirements.rst: update end-of-life distros
Date: Mon,  2 Mar 2026 12:04:32 +0100
Message-ID: <20260302110446.132075-3-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260302110446.132075-1-antonin.godard@bootlin.com>
References: <20260302110446.132075-1-antonin.godard@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 11:05:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9038

Fedora 41 was made obsolete on 2025-12-15 [1].

[1]: https://docs.fedoraproject.org/en-US/releases/eol/

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documenta=
tion/ref-manual/system-requirements.rst
index 852f6b9b3..db38f5441 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -84,6 +84,7 @@ organizations publishing them no longer make updates pu=
blicly available:
=20
 -  Fedora 39
 -  Fedora 40
+-  Fedora 41
=20
 Note that the Yocto Project doesn't have access to private updates
 that some of these versions may have. Therefore, our testing has

