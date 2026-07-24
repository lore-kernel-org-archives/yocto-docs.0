Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B5DC531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:45:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15801.1784886346334882095
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 02:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OhQZkV+g;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0D1391A11E0
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 09:45:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D691A60395
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 09:45:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7532F11C11DFB;
	Fri, 24 Jul 2026 11:45:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784886343; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=wJFgzHLktn87okdHsfmPdK69mym1fon7R7qkzxOMKxI=;
	b=OhQZkV+gXFaKctF6YXLutoaXActcbJjPy5OBBgi2hVyBs4aq9kLMcqtLnDYp0NAIZnWmKk
	D9mI4VgJqidn7JXr0VMwk9J0q7r+Fges7Eyz/WMM+J14khXi0jvxGIuW6eIgKshsi4BK9k
	3Yi+x5Q//g3Wq3TQGUvyDRpZTJpKuX3YGndJg2fxJVOnIplK4I2m9/hbWClZMSDEyVI7eK
	DVhu7c+MBXZap3bRLBvhYLLC+f9ys8X4YWthEyCLQFV+G31dIKtYDLDHg9g1sykbYj5lqk
	nAyE8xEtKdJW6t1fgAgfozKf+3glov172woJ3ReLh8PeLm+08OzO2JS5WKVV7g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Jul 2026 11:45:25 +0200
Subject: [PATCH] kernel-dev/common.rst: remove taskhash mismatch note
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-remove-obsolete-taskhash-mismatch-note-v1-1-47a91133b3ed@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBCF4auUWTtQY2LBq4iLaTqaUZNIJi1C6
 d2Nuvze4n8rKBdhhVO3QuFFVHJq2O868IHSjVGmZjC9OfaDsVg45oUxj5qfXBkr6SOQBoyikao
 PmHKbnR0O1jljaPLQYq/CV3n/js6Xv3Ue7+zrtw7b9gFtXUykigAAAA==
X-Change-ID: 20260724-remove-obsolete-taskhash-mismatch-note-547345522adc
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1415;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=m3y9ZqpflXDkIFQR3Jb4QnsXj8AhPw9MZEkdg9GS7sU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqYzRF9SkbVaVOm8C5wgsMxrqIN1rcdsFL2epFP
 Qrd5C20jNCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamM0RQAKCRDRgEFAKaOo
 NgPiD/91OsLobo3PvLnjnjpBfTxa/RGANut8NdIvUc46bRj76NuTB4OQsUlAqPj3/Swdne/HF+L
 P33xgEDvf3a0ctsEVtH6q6QW02dMYE6YAflHfkcgyGfW5yP+o8ncBKW1oUJ2H1CurEv6kEtSFff
 etRRyOhFi2fcPcdZPvcgUiE1u0azAVfdMbeFri6XLiIkjb3fcGvPdcrubCgDd/LIm+plpQtZXn3
 QQq/Pl4aOq0ZFlljm2GQFuQhLa4+uJUu8kxZpDDor67vuFL/PMlIbCaVyMoWiQMC6kRZzEa88FO
 C+vXPFqmnSviWim9qz2rs6PR3EV8kGwns08qqNl4K++rADkG0QBkydL1jD+lfLwCmrjHJue7I+K
 1DqrbWMQfpMIgQfpUt0pGZbMLWo+gT9ApMFzfmFced1MkD7qJhaZ9G74/RqQWbYwbu6Qk2O4d69
 HfUvYLCWzmbuu93wg3GLQOY6CA2maasWF8/kGs+F2r5bHCsuxDYIKFP70+F/1EITzjwjENCvvJx
 MCz0FsGmm4XrEmjX2wpJkjWwoW9J5G25HOeEIucfv12WPv6UMSDOHG1pIdd0lclJdZMyYc1S0jm
 QTTlvDUSp80273ExznhIzGalcb684/dx6LwVnOvkxeFrEteGMvInou7ATNkWAqCBZCNSjfkB86E
 DWEYDOIm81jwAgQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 09:45:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10125

Running 'devtool modify linux-yocto' with latest version of OE-Core and
linux-yocto did not prompt the error, so remove the note.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/kernel-dev/common.rst | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index c2fc3e1fa..51e819699 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -654,21 +654,6 @@ the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Sectio
 
       $ devtool modify linux-yocto
 
-   .. note::
-
-      During the checkout operation, there is a bug that could cause
-      errors such as the following:
-
-      .. code-block:: none
-
-              ERROR: Taskhash mismatch 2c793438c2d9f8c3681fd5f7bc819efa versus
-                     be3a89ce7c47178880ba7bf6293d7404 for
-                     /path/to/esdk/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb.do_unpack
-
-
-      You can safely ignore these messages. The source code is correctly
-      checked out.
-
 #. *Edit the Source Files* Follow these steps to make some simple
    changes to the source files:
 

---
base-commit: 3f02e87accfdded9c5343fa48e5f57f0b6d49aa5
change-id: 20260724-remove-obsolete-taskhash-mismatch-note-547345522adc


