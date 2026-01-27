Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AFCCA6CAC
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5822.1769501993364638573
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lv8KSoXy;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D8BA34E422CD
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0056606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FC77119A8686;
	Tue, 27 Jan 2026 09:19:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501991; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yo83wQacKCZeEuudTJd4SsKFItaXQv/N1qRVjspbC4I=;
	b=lv8KSoXykaS2asCJ4chwlz1Uc3OPLH4rOiHlbk3RdyDX2FtX2F6r9ap2nHduqwOJYeTKKe
	TGbKM9Td451bQYkSfBZTmEfvQ7Ys4PTY3TUIqV54rIHWfZiscTOHiwFZclGaxSM8f0LCL6
	WarFptsQms+SinxdosgAbnYLbRD9eU8tU3abEXAiE1YnyPauJMJASP+IvS8p9BlG51H/Lz
	B63krV2pYssaoUowtaYbVPE3LjRXtxmWXhZbUXr4v7/xi+P7lZKsmbVZwMylKVV09mKn9Z
	MFkbj7sZPvTek1Go/43cYQOXNvtFn/qoxJ1/Js53pINOYMaRpv1RXqI/NvBhrg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:38 +0100
Subject: [PATCH v2 43/56] dev-manual/qemu.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-43-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1324;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=XuTnRqelezwL/g+cykSRvm5yAQygV+npZg7w6+FeFbw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUF+3xufA6SWLG5jRCPYAsbrfc96459y3Szo
 4rrkE5j/f2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BQAKCRDRgEFAKaOo
 Nu6xD/wP26qHSGrbVNucRbGP10ZvjJBrVjJFWmRqhgg0BuuMepyWIdJuuIKy3P4IU9vLzpjv17p
 Yp3cft8SZKMvwcx5XzFDS9iCHwgjpas81pwzDuTZF0A0Q/D9UFZXZfaW6hbEkLdKUoDPnWLY8Ep
 IyN8mENh4pzP4WckKxg00RE+uzO2bKbYsMmnrNlwBi770KRZ3DaNHJiH+wkMstgsfSRX8lAybBy
 pZLeJu2NhNQEv4YNrVxHhReGpicHmjWQgEAV7qOdAEy+L2cbE8QxJrj9OVu0vtJT70wmDAcY2d/
 /mwzrs+IAff7DtzIfaRje6rXukwoYodYto6tO3zm9DBYkSf/6IoKDkfL4ubq/gwCy06h7dOQgb9
 n/xynp0AoPd57trUzEO+hK4u+Q0vqKUdkCTQfoOdpSyWgl5q0q4mijafUEZL00/i4ib9xRu2mwd
 zCH8zGolwtFkSgoM3HLkxj5/+SF2pcJaIf0c77vk/rS8ZTwcbGuO7J6LEJhJakBANeCcaYhS3/9
 xUktdGZtwtxN+dFpOFZP3d2rNGf9c9DJh6cjhvKyr6LLG7PCZbQKofIhwwlb1sgbYT/BxrgmIxl
 r6ez3fUy2cgolIb7NxJyZnvjf3No+mtsOg427TB6xwnFKTdGKHTC3wAu2ZjUDURnAM+siCSFuqh
 cCmPodPPg7np59A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8704

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/qemu.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 442fdced3..e40660a96 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -53,12 +53,13 @@ available. Follow these general steps to run QEMU:
 #. *Setting Up the Environment:* How you set up the QEMU environment
    depends on how you installed QEMU:
 
-   -  If you cloned the ``poky`` repository or you downloaded and
-      unpacked a Yocto Project release tarball, you can source the build
-      environment script (i.e. :ref:`structure-core-script`)::
+   -  If you followed :doc:`/dev-manual/start`, either use ``bitbake-setup`` or source
+      the environment setup script manually::
 
-         $ cd poky
-         $ source oe-init-build-env
+      .. code-block:: console
+
+         $ cd bitbake-builds
+         $ source layers/openembedded-core/oe-init-build-env
 
    -  If you installed a cross-toolchain, you can run the script that
       initializes the toolchain. For example, the following commands run

-- 
2.52.0


