Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DA6CCF9F1
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.31570.1761569077604937374
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=h1vCd3NU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 557411A16B4
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C31E6062C
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0374B102F2503;
	Mon, 27 Oct 2025 13:44:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569075; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1/m284fooksfBMc30lVBUhcnFGaXgJkw/BJfQfSJMaI=;
	b=h1vCd3NUY5+0GW+3hGtQEIz7PkW9zvHpQ+ueHm58eJLMYQXxOYfaj39MRxb4XgX36skaXT
	LdqUW8EAVLhzmwdDq+AmA3srIdj4y0DO2PjtUsnftmhncweEj0f24/rAfzQ3wM6pl3vTJO
	Qg9xGFAqlkIIzK8jJn7LGoGA2PybyWsE8sz2NNr4kumdOncIQRLgyLGjRAJAS2RhlqYzGF
	bbS6UM1M17QqpEBIm6cR0Cte3kNdtelCyx9D8DNxyGTERWJIIAcB8C3xHdbHxgFd8BDGCb
	gk6wj+/OHucWA7B0j5B8bZbCgH9+pJDXT/sYVniU/AUeFll156jPFjEiSK00oQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:45 +0100
Subject: [PATCH v3 13/16] ref-manual/features.rst: add entry for the
 coresight machine feature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-13-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=945;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=OKphqcQoLtRwqv65Bkau1Kc4cOZiyKpwewpg+jQGxwA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kGe0pZMkohyM8MqOYk9WPQkYFnRCLrPR9bl
 pkgQsY4qcqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBgAKCRDRgEFAKaOo
 NtLpEACBfvX+Q4hBUCyviCLhMjd+6BNjEZ1BZh9gyRQWQxLm7kTN32vdrfymT8niMjzcMaffreo
 RsNriYZx26PWDB4hL3q/qZkNHtSbp1/vye7hmM/khKC3S1uKBCYhBq8ijCxLa/W1RmLxBrMjBS6
 8/mKWrQ97ujrvr/qAxe/hip2enqtEmUxpTW2ZwaP82cjnJ/QXtK41x6L4g1g4tBiyomGRuXgnN5
 8+kwBVdnCyT8CqomEwljfEqUoADDUnS4FUDZk1nO/v0RKyGPDTD1szBaFdIy+3JoOGoP0z3Xm7X
 +fH9e67tiZh9rxbDT0niLn5s9iarR5xc5IaAmbKFbdcpvZyMrJV/XHxlJeFvVXgv1d4r6h3HsZX
 VfD1LtBnbOjy4ogH9NTarAkFuEY6hsINc5wG6D9HLOwCEN14IiD4/MOUN1XTKD0IP9CJ6OPJRnE
 pLGPlGClqGexYGltKqX+8GgejOhDosLR1uwgKIhCHDlxf5ubYglC9nklUTTQGxOb1XzV2QJoZr6
 IIgXF+Z5MUjW2aiv+bRXaCxFwFB8yF6mJYslahpR4u/kSrLbskF5b8bEEScwKW20EC5ghyXiEIg
 +gtE4O12zHtTnwg2NBB5iEVrJCsm6FGC9CiUhYHe+slsty+3GtAb3LYzsnek26QvT1qC62DH2FU
 M1Myq6u4Wra5hqw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7862

Added by commit c455bd039104 ("perf: enable coresight if enabled in
MACHINE_FEATURES") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index b295ab44e..40651a4c9 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -54,6 +54,11 @@ Project metadata:
 
 -  *bluetooth:* Hardware has integrated BT
 
+-  *coresight:* Support for the `Coresight
+   <https://docs.kernel.org/trace/coresight/coresight.html>`__ Linux Kernel
+   feature on Arm processors. This feature depends on the ``opencsd`` recipe
+   which is present in the :yocto_git:`meta-arm </meta-arm>` :term:`layer`.
+
 -  *efi:* Support for booting through EFI
 
 -  *ext2:* Hardware HDD or Microdrive

-- 
2.51.0


