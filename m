Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119BCCCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.5041.1761294041845284444
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Vdez5a3Z;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 810024E41268
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5911B60703
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33543102F248B;
	Fri, 24 Oct 2025 10:20:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294039; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VLPWWiRTVtL9il0jJFPm/4r7I+gIArmpwe2wJEe9448=;
	b=Vdez5a3ZaApkW1b7aJLG5iJcuWX5Gk1/8hfa6DsCeNp8Vh5se43P347MIMhSYUO63jtZyo
	P9ndEWN3nlM66EWBNA2QRFK1TGsRA7kxncfNmRYZhPN2n7hD/fkwFq1x+CvfN/RoCxNtam
	nwX91b8aE91nANNKZT1Vl377FIBVLyAanDNLGczleG0Y0xXMjUB1ZhslaIwdkmBni4cKYC
	jEHDk5j4kEyJnGTfnRiNRoo4cJBWWk13pALhTeEpjr56Zs4MXkg5blB/bbkKt6v/0pPTes
	IrnMvrLdrz+mHzI0m6MMzYotvvUFy65M1aG69vCCMpafacOtGISXMDLjr+p9jg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:20:03 +0200
Subject: [PATCH v2 14/16] ref-manual/classes.rst: document the
 relative_symlinks class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-14-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=35d6ksizHqAIkyE5O70WpN5OP3rXi6azpoki4FwthfA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbKPnK5rdodY/b6I9EYpsOu3UnlIXXwzeQ2E
 jJ0fVj4/6WJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2ygAKCRDRgEFAKaOo
 NhopD/9vBP2sjSih7OYcoZB8lQg+MFq0fO4GIzehN5FTQwOOB9uqizKLpfSFORlcW3bS5H3KXt3
 S5YUGrkODLEYVml9GOcEK6WIEJi1UI1ovzuLGhCvahLTA91evYMMpdXGJdgk5i9W0eDcgHyhHit
 sSsR8WPm6jeDE08Scv8yvCYBWOrOJnazawvDwqEivlpIsqXOu/+/ZbDWYA47mMp7SAVSfMWVYTn
 Xq4W2ZmrHeVDdvLtOdQTkktQ+Pj2/Zoc1EYkrWPtX0izu6MVMNyG+bxIHVfbv9CGQwEaRgR8+6v
 Ii0gfxVAcXGQ1PGOhjJFIgl/zrJ9UID392V8BtLeN5GDyr2ekuugw1J2GIdYFCKKlS/eL7fXD1u
 FiyYvg4rP7z48rdaL+qQ+yRvLVdM45xuw7Qd2gOT69mQYspUFJvVliESPbEdp37wrUey4lp8HU5
 ASf86ZQ3eluj3vx8bYrjzsYJhwECTkWDYbOFUW++naeVFYjrnCf6qg327ffIXlzhhUHM7EE/eAV
 y0VUHa9kHUnv5lusUB+9SaQ9A3Ah5YuIRzPr9fmSh7bL3GvsYBGCHe1X4TxvNckuszPLfBHb7Ct
 DwkaKHLpga/3i2qWer8KAJ+cHN8PvOtKV4cVYGusmN/3BW3HX2B9dYPMKS9BwGz07zXtLTzATf4
 x1xB0jweAlYUswQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7803

Added by commit e478550c8cd8 ("openssl/fontconfig/bzip2: Use relative
symlinks instead of absolute ones (using a new class)") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index d29feb6c6..60529ef9f 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2497,6 +2497,25 @@ The :ref:`ref-classes-recipe_sanity` class checks for the presence of any host s
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


