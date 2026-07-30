Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA79C54FDF
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 09:35:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7878.1785404103613407518
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Jul 2026 02:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Mo7hMW/4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 56A434E41003
	for <docs@lists.yoctoproject.org>; Thu, 30 Jul 2026 09:35:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C9D2602B8
	for <docs@lists.yoctoproject.org>; Thu, 30 Jul 2026 09:35:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79D1B11C1592E;
	Thu, 30 Jul 2026 11:34:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785404100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=x7+mDdejDLP+k+5i2kQ1qS7gVRJeAzzwrJimiy+z6vg=;
	b=Mo7hMW/4GjkSHB8EE3AiH5EBZAAqUp6NwUqRpecrzrhobwzPFe4xfOj6EST6ecCnBCywDm
	51BzTtckLA+VIBk+X1GKfOkxAFh+1Ro64Jh9Xl6Yl2TNSZngjseKqu6bQfD//7yceWsCLs
	bdj610TewZQE+BzYwfH3QW/4FXNmExBzFnHS182qKh2/0l1Kr2Rire4/JWOvy1QyMFvuCB
	bsO1gAoyzY/aQW31nFhbZ6O2zQ5lM1hwqSvVLEamWDSKRYBcI7up4NX7FkXZ/Ssenw9vRO
	K/iAGXXiE2Q07JNQ2fCV+zKleLKApRZKi0xwzOf+N/uZPPzA9ZtD83le8foSAw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 30 Jul 2026 11:34:52 +0200
Subject: [scarthgap][PATCH RESEND] dev-manual/sbom.rst: refresh for SPDX3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-backport-spdx3-scarthgap-v1-1-b7ffb55a6604@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2656;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=QbfJ3JF2Ovmy27IbdgyBZMnEbaDdzjUT0a9uj+m8krQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqaxrDnxeu55GTRbfi5wer3TDRpCpAgwx4Ojt3b
 2bNa6HsVj2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamsawwAKCRDRgEFAKaOo
 Nk/QEACdIpN7QjL7/vrlrZfnpkyF9Bqpabvdv5vsenCYenCt+KqyOFVffQoHnEVAJCQku3cLYZ3
 ZEFRsJnQtQ0B2HvHERT1E7Xhaa/xzBRdtmJsxPqpcIdXhxMpevSMB2aJgGhWRVn+ErnBW7TeV4g
 8qVyawoNrrHCPIGuN1MjmIkPE0NRYsdEENlK9AiFMsxDyl2TBTuaJCWk8p86729P0/kKdsGY0GK
 jeOfCwBXczklVTxWCfkElKtN4jF+xwY+ZWpAdmdqZ/vlrzXLCrGvy22D3pyyA/19deR7jEfFOdK
 8Es4MMfOpw/j9vKpFZoad5na/qBnwqlaFjuVJZEvIAHnY5ePJc0BXNg2nsfohcMTiV8wTkslYO2
 FdQ9KXjr00MepvVj04dDaz8QmxkKHohcOwDUyhNB91g9z3z3QPk1qeRxOy96l1bRlkn1UyHTtZ3
 aexaTMA5MOy9/DpE9GbOotsM35PBvu7gerjrsUTH9XlO8/zkmB7tAo68chhKK4sXKT3kdQWfH2P
 85bN3kiPRw+PZEUFpTzYVSGGfA1ufMu6OdGCdTMeWGPhc8mtnW7B+WRRQqSRyTTkRcdzeWNVdxE
 nlqwNJDVKJfRzxYDGilm6Q+V6oBYAdkVfdHZTx9FVUdQaD+DZ2//rewVWDQN5ABno9ipF5bUJu+
 9mrfXUi+amQLqNg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Jul 2026 09:35:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10191

SPDX3 support was backported to scarthgap with 9c9b9545049a ("backport:
SPDX 3.0 fixes and tasks from upstream version Walnascar") in OE-Core,
but the Scarthgap documentation doesn't reflect it. Update the
documentation to show how to enable and remove SPDX2 statements.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/sbom.rst | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index 9157cbba5..1be4239c7 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -31,9 +31,18 @@ If needed, it can be disabled from a :term:`configuration file`::
 
    INHERIT_DISTRO:remove = "create-spdx"
 
+SPDX version 3 support is available on Yocto &DISTRO_NAME;, but disabled by
+default. To enable it, add the following statements from a :term:`configuration
+file`::
+
+   INHERIT_DISTRO:remove = "create-spdx"
+   INHERIT_DISTRO:append = " create-spdx-3.0"
+
+The following documentation will make the assumption that SPDX3 is used.
+
 Upon building an image, you will then get the compressed archive
-``IMAGE-MACHINE.spdx.tar.zst`` contains the index and the files for the single
-recipes.
+``IMAGE-MACHINE.spdx.json`` file in ``tmp/deploy/images/MACHINE/`` inside
+the :term:`Build Directory`.
 
 The :ref:`ref-classes-create-spdx` class offers options to include
 more information in the output :term:`SPDX` data:
@@ -50,19 +59,7 @@ more information in the output :term:`SPDX` data:
 
 Though the toplevel :term:`SPDX` output is available in
 ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`, ancillary
-generated files are available in ``tmp/deploy/spdx`` too, such as:
-
--  The individual :term:`SPDX` JSON files in the ``IMAGE-MACHINE.spdx.tar.zst``
-   archive.
-
--  Compressed archives of the files in the generated target packages,
-   in ``packages/packagename.tar.zst`` (when :term:`SPDX_ARCHIVE_PACKAGED`
-   is set).
-
--  Compressed archives of the source files used to build the host tools
-   and the target packages in ``recipes/recipe-packagename.tar.zst``
-   (when :term:`SPDX_ARCHIVE_SOURCES` is set). Those are needed to fulfill
-   "source code access" license requirements.
+generated files are available in ``tmp/deploy/spdx`` too.
 
 See also the :term:`SPDX_CUSTOM_ANNOTATION_VARS` variable which allows
 to associate custom notes to a recipe.

---
base-commit: 5f708a1bc31ae94dd3513615b0ce079aa7897628
change-id: 20260730-backport-spdx3-scarthgap-97088b9e930a
-- 


