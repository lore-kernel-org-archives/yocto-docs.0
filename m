Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7974CCF9EF
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.31747.1761569078634269986
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FSPq6O8P;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 571D51A16BB
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E4D26062C
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0522D102F2506;
	Mon, 27 Oct 2025 13:44:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569076; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iwUBwwak6NU0sClAXTMyMJ3kgwSp7VWNIqIckpAceSA=;
	b=FSPq6O8PXlvpolOv1Dw/Sxigq65EE0CACt9fnnWtGunf42UExAV1L+icsDOi5WADhaIq80
	u2YSuqLjOz3Bm9DaAyB1rL8M+XMsts4/0LR9WpikoE+0YdQcePT+Az6rIIBGqgcXnvWJaJ
	jwrh5UEVPcF85B/em0E/LHDkiS6tso5gf1LxlfTA0n5FvA8EC09ltBRphLye97nNzq1qeb
	kBRWsQdazyDZQ1nXOPBD3TLdHNNh450z9tJQpZJP/RPelVHJvjeORhR0Fa4UTXcDeNohZq
	ExWSiwewQyIBwRoxfK7cPtmS20mDc3wf5ZB67ylVBwJZtpTYOLwRmcHXOTWEmA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:46 +0100
Subject: [PATCH v3 14/16] ref-manual/classes.rst: document the
 relative_symlinks class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-14-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=TcSndBI18L3+XWrz/mxs7sqQ1jCgixbFIZTME+XTzX4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kG8/Y8thn7HKsqSqk8TWUNxL3MwPNh2auJM
 /634qPhQAmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBgAKCRDRgEFAKaOo
 NoDfEAC1MvSqwhHONrV5IDeE8li6KxR/TA7p92io4TcsVjhoLrbR9HKK5DDebo9nv6lmv4RaS7A
 CTkrG+uDufEXnYIpbFAGNe13iLQr8LzXQ/D+mxFJwwosqJz57lgyJ7q3OF7xRdECOy0fJi7AOoV
 0/wr0VN0bmzNuJIEy88T6BoxttDlkSvRHIKalUaY9Fn4IoN0ykjh/5L1+HswMGCqCuDDTRxKRX7
 GJj6eUNvoHbl+HcdC5d2755u7YPzrd19fROIZQMQe8/wtNLAOAWGVDzhqdeqnG7vRf4nGzl5Rhr
 LSISYOY16oXB7/d5GVtK4JGBSlq6P0zRapj0mfZN8AjJEC4dwqMUv5u1lKRSE+jBlD/j5c5tNvp
 bzw2M98Qw1+BT6hA2VcKtASeBrC0EZdRzarGsBgfTTkdCNJ/4xINhzB+iOYtDzhBwxynxeGuPHD
 fNv0kHu240EVLcQFdxnIU0fMJyjLp1EVHdmhNrAWDrcjZeb41PVtSZUguAZIB9OZHaUEjoYVY53
 RTmkkveHBa9jjrIJn/uC19hsj3+elZttZeyG44bxGTuERRYQQwo/IrFDgXt4xdWLzSzBG0tM8C6
 15lyTkAXke+3akNbLbIFc6yjKmm55hKRoXkZ4vd0HmrKOzaQSfj3xHLx3MDcccZgdG721e2sfP8
 FLB+kYHb2PZioVA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7863

Added by commit e478550c8cd8 ("openssl/fontconfig/bzip2: Use relative
symlinks instead of absolute ones (using a new class)") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 0e616420c..2a69d2d59 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2498,6 +2498,25 @@ The :ref:`ref-classes-recipe_sanity` class checks for the presence of any host s
 recipe prerequisites that might affect the build (e.g. variables that
 are set or software that is present).
 
+.. _ref-classes-relative_symlinks:
+
+``relative_symlinks``
+=====================
+
+The :ref:`ref-classes-relative_symlinks` class walks the symbolic links in the
+:term:`D` directory and replaces links pointing to absolute paths to relative
+paths. This is occasionally used in some recipes that create wrong symbolic
+links when their :ref:`ref-classes-native` version is built, and/or would cause
+breakage in the :ref:`overview-manual/concepts:shared state cache`.
+
+For example, if the following symbolic link is found in :term:`D`::
+
+   /usr/bin/foo -> /sbin/bar
+
+It is replaced by::
+
+   /usr/bin/foo -> ../../sbin/bar
+
 .. _ref-classes-relocatable:
 
 ``relocatable``

-- 
2.51.0


