Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F50CCF9F2
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.31559.1761569067108770076
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nuhnM0kj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C35064E4136B
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A7A06062C
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD740102F24FC;
	Mon, 27 Oct 2025 13:44:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569064; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tgB1il0xLLZDY6ol2VX9HToe467CCcRxMnBCb1P4Xic=;
	b=nuhnM0kjC8ohc3zSgTQP+DWnG4kQu6qBBAECxEApjq9qoYSyBe+cAjCDgmnepmIKjm6GA/
	O6u3rbVWMS8SAHvsr/+hAhSaiIc6h96Zqd1TrFD5PWzpCOQJrgYBcpAqPcRZrlpQGqHBVB
	StoceLsBbgPeajFMe0A2bmZ3Qbv/vMeYc4m4VsJuDK2Y0cqv2QNm2GS1g93CP1w6urM7Io
	oIND4W9fr86UvdHIupEVWWlDrU23+URdEZR5nmbrD4QKQNmcZX1UUXojb+WNIlE8iWuFH4
	FmT30TUllItdgjsDGNrYR7oKrhzmNdjNt7w8+2mXp/FTFmGg+MAAHrjGitB7QA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:35 +0100
Subject: [PATCH v3 03/16] ref-manual/classes.rst: document the python_pdm
 class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-3-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=uM5iMwfiRC7P95W8kfNAjIDDEV15PnUKqHAIGr2kv/E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kEeeF6++MzYBSxG9s/01+/vzC8NV3H/x6Oq
 zzXrS3XQIyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBAAKCRDRgEFAKaOo
 NoPZEAChyn/hx+lM2Z/khEg0QFes5zMOs3hsa22di6A7t2fb7lTr88fo07kVmqu1XRkM3rCH4Tn
 iAMN/o7futu1OAfgzstZotKKyfjLqruYbpyqrO4LVYw1u/agxic4XLAcqtJid9abm7htZGHpPW4
 rcAmHuZ7c+n48sfevHDJRJKZiLPDQpT/g73Zbdj5ytiKpUhSE+pA4PjXSbFXX6R1sPJt8vIGsUo
 MUuDkh8fz+OTxB4GP4Ok/SH93OF+NbtB9BrgQ8A4MREkzRKGBrwIjXtK2TAs6dqJzwyDgklEvuA
 Q0yjlICNkO7d5z7iGW09Rjodq7rgvZNY6zt5eplPIKOvgG9eldQq139sqOAzxddU8e83BPG0bBW
 LK4xcm9+c692meIFlCO+FsGThtHmGlir04JLLcsWAS4EXt4CirxhgN4KXo97e91lb6mhPhPmeeY
 Yi1zTJIS5pq0ndc3NlQPV/ZGT8Z92n9zSTtgXwMlPH9H+I4PKFjv8aj4QO6Ymx3Y7cblBXgC8wC
 386dhlV66UDvYPSnlF5Kott2AKkjFwecL1KeXQ6UUk7D8r8E4rXsVOh604zKa+DJlDiTj7bUIfF
 6hioWsJJWVGBhgt1rBUCrDiThxPeyAr+7meRygTpA8IzPCYgzMkSVsVfDuSxmDEmS5cHaSwf3+N
 hFiu7XujaU7cg3Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7852

This class was added by commit 20758865e9e0 ("classes/python_pdm: add
PEP517 build class for PDM") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b92b9e28b..638906353 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2174,6 +2174,19 @@ meson-python build system.
 
 Internally this uses the :ref:`ref-classes-python_pep517` class.
 
+.. _ref-classes-python_pdm:
+
+``python_pdm``
+=================
+
+The :ref:`ref-classes-python_pdm` class adds support for building Python
+packages with the `PDM <https://pdm-project.org/>`__ package and dependency manager.
+
+This class adds  ``python3-pdm-backend-native`` to the recipe's build-time
+dependencies.
+
+Internally this uses the :ref:`ref-classes-python_pep517` class.
+
 .. _ref-classes-python_pep517:
 
 ``python_pep517``

-- 
2.51.0


