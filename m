Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC33C41535
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:29:59 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.50730.1699266597581887923
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:29:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id EF8A428476;
	Mon,  6 Nov 2023 05:29:56 -0500 (EST)
Received: from linc.fritz.box (unknown [161.29.74.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 20AB12827D;
	Mon,  6 Nov 2023 05:29:55 -0500 (EST)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 05/12] release-notes-4.3: tweaks to existing text
Date: Mon,  6 Nov 2023 23:29:35 +1300
Message-Id: <d4318080dc94fe426323c4505f93617c235d1f6e.1699266393.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699266393.git.bluelightning@bluelightning.org>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:29:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4591

A few grammar tweaks.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/migration-guides/release-notes-4.3.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/docum=
entation/migration-guides/release-notes-4.3.rst
index 2f20fcb6946..dd61a9c8e41 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -92,7 +92,7 @@ New Features / Enhancements in 4.3
=20
    -  `ttyrun <https://github.com/ibm-s390-linux/s390-tools>`__, starts
       ``getty`` programs only when a terminal exists, preventing respawn=
s
-      through the ``init`` program. This allowed to remove the
+      through the ``init`` program. This enabled removing the
       ``SERIAL_CONSOLES_CHECK`` variable.
=20
 -  New classes:
@@ -180,7 +180,8 @@ New Features / Enhancements in 4.3
=20
 -  Packaging changes:
=20
-   -  :term:`FILES` now accepts ``**``, which matches zero or more subdi=
rectories.
+   -  :term:`FILES` now accepts a ``**`` wildcard, which matches zero or=
 more
+      subdirectories.
=20
    -  The X server packagegroup now defaults to using the ``modesetting`=
` X
       driver, which obsoletes the ``fbdev`` driver.
@@ -208,7 +209,7 @@ New Features / Enhancements in 4.3
    -  New :doc:`../dev-manual/security-subjects` chapter in the Developm=
ent
       Tasks Manual.
=20
-   -  Long due documentation for the :ref:`ref-classes-devicetree` class=
.
+   -  Long overdue documentation for the :ref:`ref-classes-devicetree` c=
lass.
=20
    -  New :ref:`summary about available init systems
       <dev-manual/init-manager:summary>`.
--=20
2.34.1


