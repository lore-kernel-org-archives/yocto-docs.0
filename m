Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1420FCE9D61
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:34:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92475.1767713683901183274
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 07:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=l9IgVmLd;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 18F49C1E4BA
	for <docs@lists.yoctoproject.org>; Tue,  6 Jan 2026 15:34:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C08F60739
	for <docs@lists.yoctoproject.org>; Tue,  6 Jan 2026 15:34:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83098103C86E0;
	Tue,  6 Jan 2026 16:34:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767713681; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9r3MjcAU8tD3c/iKoT9UmsKkLv4yhK23N7UrS707y1k=;
	b=l9IgVmLdUO3ul/3tvc8tjxyXSjGg+Ya5ftt0ZOBT7/WvtwPcWlH2HINMPH78ptXf9APzZd
	HjHVk2haHITZK/mW7orVnkDHD1r9xnA6OIH9a3T9yMd0P8SsvZdxhSGVEDhAWOdO/E8k7t
	2ltrR292K3s9XllR8LBsVLKEykF2yAWSqSzmzcAfxs4PSxJmGOtcG7SatpnXPgPCK6cqP+
	I4SSoC8VsfhIZl6uyNMTCjc9JJK3yNEaX92yXSTaLwa7oa0Me7dIqwTE0PJ8rU9sncwnUf
	i58P4MIHJP/00E58+20dFwMsdJO7nX+8CAWGFlYXJ2ZhNdUbPCJiyc5c7hoI0A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 06 Jan 2026 16:34:33 +0100
Subject: [PATCH 3/3] security-manual/securing-images.rst: remove old links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-security-manual-v1-3-500fe611a4d0@bootlin.com>
References: <20260106-security-manual-v1-0-500fe611a4d0@bootlin.com>
In-Reply-To: <20260106-security-manual-v1-0-500fe611a4d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1450;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vrKFdNW950+xj9R7rnMaVIBAUjN9C2K2Q2oYQJSzhDo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpXSuPPANYapOAIy2XYLeXmbIOOxE9dR5hnGiv9
 fUmQhYWRdOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaV0rjwAKCRDRgEFAKaOo
 Nrf6EACS4+cbLq20WTLxZUsjxJOriNndwXX/T9bN69P00mZcKIgv/7osTPJOdZfuv8AY1f0uZ6f
 z/Ryy+Jkbli9doTW30kGIkaVXyIXilByoH/fnloGMGLdfZJCIMyaFRVuXUlKZHu9vBV6bWdIyiE
 +FVku+EMcH1rMOlvlNrNdYZLP3q9oo5j+nriQojE5+dsNGQgkeIORWFuE6VFMwTeyKZL0QmKXhx
 nfE2kOLXzbJglR1rTv8uIilHCBERp4TI5wDPLBcnGOtMo5mxWMsKm92GJeV7EmAB/r2UPq+yk6r
 n1nd51YbsyKjGl4jI0HLnZIhIPxNccXat4RQe9MC0bOft0/ydfJX2swOV7A5LJLiAGyGqgNL5Xy
 O9jLa8l6NJdPvkDXDCbHkAehJvzRz0DKfIoWMyAEC6KBx7mT9/uG+3UxbQkNE7QpDZzO6/u2cdW
 2A6ir7ZGMKwHAnHiBioc8HEXHP7m6StNuwmNUYgHkH/imQJNuIM13BBfcWuazXSxNA6qZhReEUc
 EQzcgaHNYdzVIVZwOEJcsJpLk4WXePXoC+6s/SyPU+txbxq+Tw8HmSXxJrlgILjam+zjoPhNHeb
 VIsW+GcGaBlaqmeXGZX43FC7wqJuc3EeaXk9fV+FMdYoHih2Y0GTb/WxYrtO4EjTxWGiSMXuMJ0
 uhU7uR21fayo3tg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Jan 2026 15:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8400

Remove links to the start of the securing-images section, as these are
old now and not really related to the Yocto Project.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/security-manual/securing-images.rst | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/documentation/security-manual/securing-images.rst b/documentation/security-manual/securing-images.rst
index c66dde7f7..cc6f95003 100644
--- a/documentation/security-manual/securing-images.rst
+++ b/documentation/security-manual/securing-images.rst
@@ -3,22 +3,6 @@
 Making Images More Secure
 *************************
 
-Security is of increasing concern for embedded devices. Consider the
-issues and problems discussed in just this sampling of work found across
-the Internet:
-
--  *"*\ `Security Risks of Embedded
-   Systems <https://www.schneier.com/blog/archives/2014/01/security_risks_9.html>`__\ *"*
-   by Bruce Schneier
-
--  *"*\ `Internet Census
-   2012 <http://census2012.sourceforge.net/paper.html>`__\ *"* by Carna
-   Botnet
-
--  *"*\ `Security Issues for Embedded
-   Devices <https://elinux.org/images/6/6f/Security-issues.pdf>`__\ *"*
-   by Jake Edge
-
 When securing your image is of concern, there are steps, tools, and
 variables that you can consider to help you reach the security goals you
 need for your particular device. Not all situations are identical when

-- 
2.52.0


