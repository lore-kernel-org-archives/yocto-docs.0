Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68ED6C61DCB
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:47:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30971.1787816853691160258
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 00:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RLKkxfm0;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0C9761A185C
	for <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE8B8602B8
	for <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1EA7D11C787AC;
	Thu, 27 Aug 2026 09:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787816847; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zYxDNXE1rAwIbMKCAgJHgXJb1qwW//kWJ/VQ8RvJbCI=;
	b=RLKkxfm0EfW5WO2DfoXLCudXYSXamcowA51u571l4pO8jP8zOYKiaxQeJXWKV29NHPwJrz
	vFGEoUwcmc79A7909s4naF25GIpgpAKGQ6a0ipeYO3tsnuoEp2K4TYDBU/9TiwAKFHTc3C
	Q9FpbCj7xJSha/ChaA6ABwehevDBXfaxRwbOVZja0f6sLiNWZ+nd5XyGwhKWoqY8P9oroA
	ZicLJUvAoFB2R6JpCCmLSlRJfUStIOuTtHNNc8SLGwejovgchnytx5zCuQR5ntgaN9DYY0
	aiUyUgty5koI/9owp/naHuERo+wvG31h6BPlQy/CZl6r2eaUu2CNoFPNfNzDRw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 27 Aug 2026 09:46:59 +0200
Subject: [PATCH 3/4] ref-manual/variables.rst: remove CVSDIR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-missing-variables-v1-3-7ec8b525b23b@bootlin.com>
References: <20260827-missing-variables-v1-0-7ec8b525b23b@bootlin.com>
In-Reply-To: <20260827-missing-variables-v1-0-7ec8b525b23b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=861;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wzRD6F7qmSTV9lLsAWwJRgU+ooup2PDeP/bR82vgcc8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqj+uAAKxSdaPChP6Hp+Rmk6L5LLy/A+EuzmHld
 thUb9sTcx2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCao/rgAAKCRDRgEFAKaOo
 NmNED/9aGZ/b0NS6QOD++FvAOZNIYkTQAL1Xeg3UoiQNz1eRhANElPan8zaY8Fg3pPZ/fMmKo+P
 SIpVNH7XX13kV+HzNO/r0b5KnxkQ05P1R3S0r8E8JZnUcQFzVl2V7B27rRSrbtRW/nyotNOjBZp
 qDD3v/qweeVfkLUgWx2XceluxdFyeQK4FdwjjtCwXUcZCo4EY/157GI8CeLPzwa2JldPe/YOAS1
 FWKJailvqM2c+1FattW8A82CEWJ+3330yFKXJW+fPth8N+Qp5Vtro7v6+GIMu2qdLQVx0p+ow7I
 S9IgVLSGxWa0RWcte5R22uipQMwzyZbuS7TJ/8wPgrD/xMr1kdEw5Bdzx/QwRD884MKSqM3c76C
 15yeVHUQptefzD6NyNXsEVnH4SSe95O19cOl9o952dGKhJE3E6ZYz5wjVoXd4Ps+jLQS7YMWJhN
 aIELQus/EiVD2+9JH31ENxxlVNu53vM/snqr19pf7FtmA3fzA490LvR9oIEUYKN7KJqIe+LXsDD
 ilw1soUTsMByn8p4SzWMRh6U0c6ULJ0o9ddOXJD0QjkhOmW03SveSvpO78iW+jT2w1cLJ0ZX2SH
 vyc2isRUXPmMggaVq/EZkq6nX5FbbdKmGTO/HKOH1KkVH2PxNESU7RIuLyv4My9T4ci9SFpCNuf
 JqL6gCgDGI6RMSA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10375

The CVS fetcher was removed with 5427500e4f23 ("fetch: Drop CVS fetcher
module") in BitBake. Remove documentation for this obsolete variable.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a806f907e..d1bbc437f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2110,10 +2110,6 @@ system and gives an overview of their function and contents.
 
           CVE_VERSION = "2.39"
 
-   :term:`CVSDIR`
-      The directory in which files checked out under the CVS system are
-      stored.
-
    :term:`CXX`
       The minimal command and arguments used to run the C++ compiler.
 

-- 
2.55.0


