Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EFCC44506
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:46:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93798.1782744381614393157
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 07:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=S1i+SM3M;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F1CB81A0D1F
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C77ED5FF96
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8DE9106F18B0;
	Mon, 29 Jun 2026 16:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744379; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=npB2lQICip3riF/nasSm8f77ncV93tqwzOIfsNePYp8=;
	b=S1i+SM3MuUUHqk2z0ckAj4YsJWvugUE2KjL1h9d4yCK5URU9hqzeLRz7qNjT3gaHZG/wy7
	nxdhl7XtuHRnGYgJUFHQMBb3688vguS0Jn1rcanTIaRxD1TfPVMlH7pbyZhMfoaFjokmSB
	OkYIhB4aqkM+H/sq9KTTkt2e3aakBwIp4txWzunFQsnT4fqVDe5FiyE6d8nVYpeD+a7Ajj
	PMp0KDn4Drw6MY1TTw1EVLDcGgT0EmKkNgb6kwvFmgiVMs97giz5g9PUTApQlTPqwSZlep
	i3DfJsH0ufl2eFkm2PSuX8Ult07S9mjx77SX7+2jo1wNnWAS1JnfOI9/Hwm53Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 29 Jun 2026 16:46:11 +0200
Subject: [PATCH 2/7] migration-guides/migration-6.1.rst: add USERMOD_PARAMS
 note
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-master-updates-1-v1-2-ad9b047f9ff0@bootlin.com>
References: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
In-Reply-To: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=2Z0GVHuPIzClPqS+EsYqSkhp07QTLuCGoVD1ZY/nV3A=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQoU3WulUom8Pvamp88p43kfCd5adjCXSqruKn
 NRnv6V4aIiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakKFNwAKCRDRgEFAKaOo
 Nh18D/4vYtixrIyXzCNrhtFcXOobPwe1O8FKNLAnAodb9kRrIwquLYai0LmtnU6ZlPbxdVuy/IU
 gqXT7fZH2oEUlKc14JheLnE0He5JT2Jvm/wF1qGW4CXzjdztUeRELkwGizUt7WvOgePuocGXS5V
 XhFghKkrARq0V6CW5tJHd5lf4AfthoQdPLdZk0+eMU6bB5phakowOXWiiOEHeehqW7Ag42RwHEn
 IHOzLEbbi4OpHBpLEqe5TEnc3cSzEXotKLP13zy4KQP5sBa5ez5q9Je7t/F7VZGbNfS+jG0iNWz
 aDn6iWyIrxqm3hDQtdktDol/ymv4qfRKOcJsrqSknJvGS/QLwVPerYm9bFnUDx/Me7b/8UTcoS9
 wpwAwU4ZDC1o2/8fPqtRFO9Ktwskv1bx0V15BI16EZ6NTiQh10VJUeyUcwDuOSUmpyIxVeBikf9
 NHJjcahtxvnaxQu03bSFclZ4Vdwt78onHAWKiQOKOLbIJ4dI3zRFAGUvf4JR2cK8ed7+CDpxE++
 E/FtpCwioDXBH3YLGVwoMbK9KjgQnmDgY8edUnSFBsDI3l4RG8FoHia04GE8VW63oQvGlc7W6bR
 tM2KPrez02sxFUPCxbaPlfbdZDL4I1F1YlbyIU6P4ofRb799VjdFG6ASupNGCaYp1ZyO9YQTZOS
 +4PQhXaAD03jLmA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9975

After commit b8da733ab12c ("useradd.bbclass: Add support for
USERMOD_PARAM") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.1.rst | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/documentation/migration-guides/migration-6.1.rst b/documentation/migration-guides/migration-6.1.rst
index 2e103f0b7..a73c4e34a 100644
--- a/documentation/migration-guides/migration-6.1.rst
+++ b/documentation/migration-guides/migration-6.1.rst
@@ -34,6 +34,32 @@ On the other hand, some earlier distributions are no longer supported:
 
 See :ref:`all supported distributions <system-requirements-supported-distros>`.
 
+.. _ref-migration-6-1-groupmems:
+
+useradd: replace :term:`GROUPMEMS_PARAM` assignments to :term:`USERMOD_PARAMS`
+------------------------------------------------------------------------------
+
+The ``groupmems`` command is removed from the ``shadow`` recipe starting from
+version 4.20. The same functionality provided by ``groupmems`` can be achieved
+with the ``usermod`` command.
+
+Assignments made to the :term:`GROUPMEMS_PARAM` variable can be converted to use
+:term:`USERMOD_PARAMS`, by replacing::
+
+   GROUPMEMS_PARAM:${PN} = "--add user --group group1; \
+                            --add user --group group2"
+
+With::
+
+   USERMOD_PARAM:${PN} = "--append --groups group1 user; \
+                          --append --groups group2 user"
+
+Or written more simply as::
+
+   USERMOD_PARAM:${PN} = "--append --groups group1,group2 user"
+
+See (:oecore_rev:`b8da733ab12c64503a353d5ceb2eb63fed95d851`) for more details.
+
 Removed recipes
 ---------------
 

-- 
2.54.0


