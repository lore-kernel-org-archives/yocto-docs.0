Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF02CCD19E
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:54:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.3547.1760604889542666915
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Su4jnpMl;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3FA3E1A1417
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10CCA6062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6259A102F22FB;
	Thu, 16 Oct 2025 10:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604887; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PfEC4FVmQyUP3v9dBv/aKgtxtEKRTDKs9F8xptDprZ4=;
	b=Su4jnpMlDWgb5rjV8at5+oWqVTZHQYQtqTo/+f+dr05cRmBgCWxjtJrApvj9xFbkmvl5rA
	wD6lV14mdXGzFAFQm0FFYSIZu82DZbFop++I/WuFk7LuRKq1p237MB4W5CkO1CfuELCfsn
	/gpAigFyQmOfuWtYuuKZokldQMPUkVd1T9ZmKigtFWgJqdLXH0ZjzAo23JcLn20G9ZCvhg
	QTVJcFuvXrhuyeuPSr07ySopM5Q1F9seWOy7KWQ+vcnqRnYjc8DuX58EAFngnMJET8p01W
	Sez+T0inbAMJ0tg1KQfkQb0giHGGo8t5IZydO6q2bX/3BOkuyUtrRQVh/idpXg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:53:59 +0200
Subject: [PATCH 09/17] ref-manual/variables.rst: document the
 REQUIRED_IMAGE_FEATURES variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-9-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1500;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=E22RK6rCGxK+V/f7lcF1Bq/deLTKPlZf6+iiFLdNAPM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLQHJZWXA3N53arMP6Q/6b+2GrrGmrE4ztXs
 aKeqoIHcAWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCy0AAKCRDRgEFAKaOo
 NtzyD/4s2pSDAZBNrjHVGRZcvTkdNebR0bZoTZzD7SU0ulAPSObXHIOe3McSopoRrewDc53qRPu
 ykFSBygDT3am38P1igi3yn2yy5Qp6y3QGtF/DiSSQ9vQ7GhRTDd+GiZvz3C8T9/Pxl6Fn+fro5v
 Fd/7hEK3NUMfSmUbeAjx7D4Nuo3L9o94x363GRiV5o7dylzwYR0PWx2sXwWmIDXZB4p4CrFUoHa
 JdfgYzbJjirRxMROQPK7tXkodPVCKmXlBsQ0yGzhTGi92bX/iZAGghyFHyoutQoVWtt4zjXvDt3
 27FElSE5CB/tGDPYxF7X7KwdQeYEZGEe8beJV2HAMdN/2gURQBfk/FewQMpC0QSMrW0AAeJaQ/4
 rdIMryfF0EQ9h2psdV+IzbxuAgB8GvGXEAmySY53LHW+JAr1HefsPv8o/eQqhZyoPdN4zgsKwF3
 vF4FSDL1WSMOksO2g/aZs8ZBmhqcOW/xcCd6yKohKeLnMdDUQqv4BFT1uhgSXvK3MEfEDkTkGv2
 55yjq47pg7zMdR+YMFn/QvzAarkENI0dIjjpr2oJuniUiUgvXIzeOMKPUSyCqic8d+cALqw7rtE
 IfA0qup9olpOIY5E0lPoFOJcvnQidV91hTRdP29Ly/F1TGbgOYXLowVlkJ0yx0og4x36h21XqCi
 X4PshoegonloERA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7719

Added by commit 96a9702a24a7 ("distro_features_check: expand with
IMAGE_FEATURES") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6c94b0d10..bb24f2583 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7946,6 +7946,15 @@ system and gives an overview of their function and contents.
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
+   :term:`REQUIRED_IMAGE_FEATURES`
+      When inheriting the :ref:`ref-classes-features_check` class, this variable
+      identifies image features that must exist in the current
+      configuration in order for the :term:`OpenEmbedded Build System` to build
+      the recipe. In other words, if the :term:`REQUIRED_IMAGE_FEATURES` variable
+      lists a feature that does not appear in :term:`IMAGE_FEATURES` within the
+      current configuration, then the recipe will be skipped, and if the build
+      system attempts to build the recipe then an error will be triggered.
+
    :term:`REQUIRED_MACHINE_FEATURES`
       When inheriting the :ref:`ref-classes-features_check` class, this variable
       identifies :term:`MACHINE` features that must exist in the current

-- 
2.51.0


