Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69E9CCF9F0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.31569.1761569076654309690
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fWDbW85n;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5B2661A16BB
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3207F6062C
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AF21102F24FC;
	Mon, 27 Oct 2025 13:44:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569074; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=227XCwD+7DLXpT9xUYhiaJIYS4xQLVhSPceYbtST7cc=;
	b=fWDbW85njHSsEUXPtZxmcMoAtviyDeCEifBQ7XOdTEpeuOx27S1VbVqYRuT1QMi8lH3xzq
	vPLlzA7mlrLwDXV1bylh7nw8JbL0BvRQs9/LOOvT5AvAgFcUWATDw/tjVHX+Qsdw9e16U8
	mlZYJ5zheW3TP2MLiAGu8ZutTFEJ96cnvPgbkRuQtPosioPK20PLIN0asgrfl7R96cFzf1
	6UpDpMQIq+X5MRLv2C0ZBLRTIu7g0eUwfGZ6KlQZUkN0jY4U6LJTKttW6zGRi7JxOhKOc8
	BdQ8S3DPAXyjXaSAXbhSVMQvDGuPaWW9Gg//gGHe+e1i0rONq38bMkFPvI+V2w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:44 +0100
Subject: [PATCH v3 12/16] ref-manual/classes.rst: document the
 rust-target-config class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-12-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Gi0g82s/LYgh27giLGRlyl2HtYnhAhb+QQo2y+Ugz0Y=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kG7/Ka8F2vNYRZye9oLL0hcb/KFwWolnmqX
 akWktrAG1KJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBgAKCRDRgEFAKaOo
 NgA5D/4lPzKOn3lexCXYI0DhbUaVXlbE7vUgnwS7laAVFYq1TYzQoVEjDI53SEj0bP7od1YC+mV
 JeyNfuP9dgl4Wu3Q0HlxrKHcOMTTPUJ+QcBVaaLwUDr26qQkbgcNWzbUBUshq6uYGYZ8UEY2m/V
 2wD7aN49lqXfXtqEiYWzzijRdU0BjFzOlFXcqjvsCCrdjF9RWqcnHumaJWime+l3R+Tr3brDiq6
 XxdKM8YHWiPpPeqjEy59pWRRyY9EUUdAhQ6TZLYMQaxx6O05xC84qyofqzSFFOL0c9fofxGFip+
 MTq21McDm17PqX+mEPU83xylM8AeGfKBnwekNe5YIAmSd6FIXsx0AiqqgoAhljXp0568DzrhQ1n
 zIO8S2EUKPNVcFZlDyb04y9yElms9OI+20u9QTwmZAnHGU4zzO3/4SKc/3+JdAcDe1+kbdMcCpK
 JAwRMOcijX3IuKjf6ME/Ny5npHfdDC6Sl/00z0OCYUGWCWt3Xc6MTJoszt2EFiDeksmg76Al03P
 FidMbX6iR+p0SqlKX/JmxKhXoqNUjzYqq5s2YjhQFHrIXBf24WcJyN6oB8zxn/wslYnr7OjJzSb
 6TgFVpi3wvBxM1J36ZSf1fDwCiUDhJu4x3kLziQR41V51OeW3CQPOSRwt2GhqpUciZCRurxY6OG
 4hvl5O7Pdu9jdsQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7861

Document the rust-target-config class.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 5903a4b9a..0e616420c 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2638,6 +2638,19 @@ The :ref:`ref-classes-rust-common` class is an internal class to the
 :ref:`ref-classes-cargo_common` and :ref:`ref-classes-rust` classes and is not
 intended to be used directly.
 
+.. _ref-classes-rust-target-config:
+
+``rust-target-config``
+======================
+
+The :ref:`ref-classes-rust-target-config` class is an internal class to the
+:ref:`ref-classes-cargo_common` and :ref:`ref-classes-rust` classes and is not
+intended to be used directly.
+
+It is used to generate a JSON specification file from the features listed in
+:term:`TUNE_FEATURES`, which is used for cross-compiling. The logic is done in a
+``do_rust_gen_targets`` task.
+
 .. _ref-classes-sanity:
 
 ``sanity``

-- 
2.51.0


