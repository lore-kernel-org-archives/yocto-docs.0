Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06FDC44532
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 12:18:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21230.1784636289730993548
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 05:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Umo8TXW7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 141A71A1137
	for <docs@lists.yoctoproject.org>; Tue, 21 Jul 2026 12:18:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD0EF60368
	for <docs@lists.yoctoproject.org>; Tue, 21 Jul 2026 12:18:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0E1C11BD1850;
	Tue, 21 Jul 2026 14:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784636287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A52xOjAbnVstIf0vkTQwuxoaUwfL/tPvAcZB+01MrX4=;
	b=Umo8TXW7XicOVTaay6VRXjgsFWwe7IKwzakYAFXrrdzVIPjlmOwyglWkjmKFqdG1epSj8S
	XrLySLKV3qV/CTLxiPfH6WuUVc2YmYXwyRP0m2hxcJbNoYCqz/+5tQXhqd2opLa2O6zK6d
	CKQVG9x8IHN3iPHdtAMkQJGN1hz8+VNo5FxICArrtU27dzdqFpzhTWkKgV0k6+whYQUF7b
	Dm9B3rM25FoEg1ntKsiWDiMyi/L5A2bu3YoLZdsXtx7BZKEPMOqy9FusKtCR41RlcOFCLg
	M2316L2AOfhycstxrz9ha21gIWvvECipRqDyi0r4dMXVuwfO2Ly53LZ6M5D9Iw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 21 Jul 2026 14:17:54 +0200
Subject: [PATCH v2 2/3] migration-guides/migration-3.4.rst: replace rlbl
 broken link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-linkcheck-v2-2-32d93e054c50@bootlin.com>
References: <20260721-linkcheck-v2-0-32d93e054c50@bootlin.com>
In-Reply-To: <20260721-linkcheck-v2-0-32d93e054c50@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KaAto5dC6XM3NcchOItW0y4kl3MvFJkQDxeVL1+VaEg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqX2N8351ii6Uj+cTZkcoisoNiIdiTW8987Ss3/
 fO6sXDX3lqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCal9jfAAKCRDRgEFAKaOo
 NsmoD/oCqTOpQO0jZERcA0KaznMGdidgKzQU5Tk6+btNJAEG2Qd2v3Fj7LIsdrzzYYEs7nsQcP4
 SvtRjsN0Jgdp3ZTMXTNINE/HoQDgh8nOLrVW9K76Xnam7BQc19/4olazpQd4lOqne9fwva7+emX
 jIxKctz9iSlclBe/No8A9YGaJp/MeeQd74IvL1p10cy4s+8YNsA2Ynbu666XXg1kRSLrqnl8dQN
 fycPbVjpAZH51d0/m4v3yLe7ykxQo4Pp+Ebu8XY+EB1W6ytdl6ywx2RCk+jBHJnGvuRif1uieA6
 xRO2u3zjbVkQ8EqJf722oV3q8VAj1Y5kCW+T4dFGQucbWwc40blmQF/4pzN30PIwRCMf9Spvy8g
 6czh/QhUBSN1lu1TvECBR8hZttVZNdPgZ9AYfFHz6jV+bFmUUIPGeLozOeoZdWu2k/uSkRh4h/7
 C1/cxZqnFteJwszs/L1FvdJKG7l+syPGXGd4QrQYpRDi0CbH0ss6ljs3sjY6myee+6+RLmgeEnr
 GXT3wZqgjgD+yWP+SkD1Y6YsQaaGcqqhdYIyc4PWyOs8cKci0LBQ1W3B2bXxJfv5GuLTpBNtq5c
 vVmFckg/AigVycGMNYAspMus7wmJKNOvDaMz+Fxk9ZPtK0eozWJ9p6gGvBAHl8R/5H8wguN7Je0
 6hg1P4zqasW5wMg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Jul 2026 12:18:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10103

I could not find an archive link for prelink-2 but I did manage to find
an archive of the first one, so link to the existing one only. The new
link does not match the original one but this is where you are suppose
to be redirected when opening the archived original one.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-3.4.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index a9b105720..e9cb3a109 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -132,7 +132,7 @@ Prelinking disabled by default
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Recent tests have shown that prelinking works only when PIE is not
-enabled (see `here <https://rlbl.me/prelink-1>`__ and `here <https://rlbl.me/prelink-2>`__),
+enabled (see `here <https://web.archive.org/web/20211129050029/https://embed.endfa.net/yocto-cross-prelink-1/>`__),
 and as PIE is both a desirable security feature, and the only
 configuration provided and tested by the Yocto Project, there is
 simply no sense in continuing to enable prelink.

-- 
2.55.0


