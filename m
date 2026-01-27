Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DD9D2F023
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:06:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10277.1769519219041579159
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 05:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oUAM/uMw;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 87B941A2A87
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:06:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5EDA6606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:06:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9627119A867D;
	Tue, 27 Jan 2026 14:06:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769519217; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OYyS5CJIyuMHUk9gExiPx69m3cFoJsORHmO/YEwCnIY=;
	b=oUAM/uMwqKKWVjGMINAKjUrsL2CgUEc0Bba2FB6/PNG/GexeNN0sQAzm/zP4mMA+EZ+0m4
	gw3zunJS9jjVkil+4FDdH5Ceqzzttzj0RlJHMqTucHZB2n3pmMNqUelnD7IvawBckB60vY
	87ajdpsWw9tXQXbE5t3VjKgvZbVAFwzIAiYLug9v4A/vwYh7dpkJ01lgyByPUVnV+nUOPk
	KieiP7RloXvQ3L0r2QIsPgmJ5JsrI7S7Jo9k8Ps5VFDoQQSOIsQONAAys6n1rMIsjFY+Jh
	4ltMatPHfarKfP0PmgkoXWDns/4McI5hdSUhO8NTc47N3Mo4vc9m4HWvhjY3Vg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 14:06:46 +0100
Subject: [PATCH v2 3/3] dev-manual/packages.rst: fix example recipe version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-pr-server-increment-details-v2-3-b46f91df002b@bootlin.com>
References: <20260127-pr-server-increment-details-v2-0-b46f91df002b@bootlin.com>
In-Reply-To: <20260127-pr-server-increment-details-v2-0-b46f91df002b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=W1qDyypz3MsP4eZA6R4497hzdDpnCQmcFdYtlkltjts=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeLhtAGeNVRRwJ9Zhr2t3PY29klxSjW+BTyoJN
 c6sWrvSGmCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXi4bQAKCRDRgEFAKaOo
 NhfSD/4k98dj1AlDtv3SFsfKbShTJ6ym+9nAbOCvyVoBo6pFQ10Xdf6H1CtVDC61bb5GTDwQWwT
 0PO0HL2645deGfvlCuoS7KzgIciGXDulHOc3y/l5vsc+qzYuC7SxawJySt6d3F64LKgzd+OBYLN
 JIyvUjcy48mCQjArwhXiV/Vvb+mkfldkpXRjafKglbM6brX2U5L62ErxebRC31UrL7xJtOwrFCT
 R3qzoFh/X4dssdH1gS7Ea/X7EzM/7lbxug0bgD8uzfUJmc9UKgq9d9UIQywdz6qNf6BJGYLGoW3
 WkawZn48byIb7Vkn5U2OGEshuP475m08sl5AlF1hmsWydtF6/0R5asrSEvTdrhsueehliY5IOqH
 fv5swDVlayyPrPtZ4jS/LV8eP4GzBb1wFv4NM5VqdlaTidDEymxvG/j+Xt+I1cGeivID6QN0qW3
 p73BDbQjuSKUrF9DAES2CMakOr+/vlnLBIOeGREd5Mjv7+3pM9xWh38XTJCtjuy0icT6K5ZzCrc
 GgkWkaaKH0+fQy1jLNiQEqR3Dfd66w3aTTMHVEBrGZmJs/3ZAi5lQRS/8xLTRStYZh82sKFkIAV
 5pzVtbAYNHuTVNyGIdQAiWhoYeoqcrMUoB0o17oK/dFgqM/UQeMXS7mfrSjPAW/Kmoge57F5XkW
 9sofKTT/6tCrRhw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:06:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8735

The example recipe taken above is hello-world on version 1.0 (because
PV equals "1.0+git". Fix this issue.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/packages.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 383c93131..6b4a3b81a 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -274,8 +274,8 @@ with a number. The number used depends on the state of the PR Service:
 
    .. code-block:: none
 
-      hello-world-git_0.0+git0+b6558dd387-r0.0_armv7a-neon.ipk
-      hello-world-git_0.0+git1+dd2f5c3565-r0.1_armv7a-neon.ipk
+      hello-world-git_1.0+git0+b6558dd387-r0.0_armv7a-neon.ipk
+      hello-world-git_1.0+git1+dd2f5c3565-r0.1_armv7a-neon.ipk
 
    Two numbers got incremented here:
 
@@ -300,8 +300,8 @@ with a number. The number used depends on the state of the PR Service:
 
    .. code-block:: none
 
-      hello-world-git_0.0+git0+b6558dd387-r0_armv7a-neon.ipk
-      hello-world-git_0.0+git0+dd2f5c3565-r0_armv7a-neon.ipk
+      hello-world-git_1.0+git0+b6558dd387-r0_armv7a-neon.ipk
+      hello-world-git_1.0+git0+dd2f5c3565-r0_armv7a-neon.ipk
 
 In summary, the OpenEmbedded build system does not track the history of
 binary package versions for this purpose. ``AUTOINC``, in this case, is

-- 
2.52.0


