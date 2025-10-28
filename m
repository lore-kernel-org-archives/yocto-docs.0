Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1C8CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 08:13:06 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.3489.1761639179019805180
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 01:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1vDep7-0001O3-IC; Tue, 28 Oct 2025 09:12:57 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1vDep7-005qMo-0t;
	Tue, 28 Oct 2025 09:12:57 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1vDep7-00000005ufM-0tbH;
	Tue, 28 Oct 2025 09:12:57 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de
Subject: [PATCH] dev-manual/sbom.rst: reflect that create-spdx is enabled by default
Date: Tue, 28 Oct 2025 09:12:22 +0100
Message-ID: <20251028081249.1378992-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Oct 2025 08:13:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7874

Since nanbield (b34032ec "defaultsetup: Inherit create-spdx by
default"), the create-spdx class is pulled in by default, not only by
poky.

Adapt the text to reflect this and also change INHERIT to INHERIT_DISTRO
since this is the more concrete variable to modify for disabling
create-spdx.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 documentation/dev-manual/sbom.rst | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index ca0fc8b9d..d54a33a47 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -24,19 +24,12 @@ users can read in standardized format.
 :term:`SBOM` information is also critical to performing vulnerability exposure
 assessments, as all the components used in the Software Supply Chain are listed.
 
-The OpenEmbedded build system doesn't generate such information by default,
-though the :term:`Poky` reference distribution has it enabled out of the box.
+The OpenEmbedded build system generates such information by default (by
+inheriting the :ref:`ref-classes-create-spdx` class in :term:`INHERIT_DISTRO`).
 
-To enable it, inherit the :ref:`ref-classes-create-spdx` class from a
-configuration file::
+If needed, it can be disabled from a :term:`configuration file`::
 
-   INHERIT += "create-spdx"
-
-In the :term:`Poky` reference distribution, :term:`SPDX` generation does
-consume some build time resources and thus if needed it can be disabled from a
-:term:`configuration file`::
-
-   INHERIT:remove = "create-spdx"
+   INHERIT_DISTRO:remove = "create-spdx"
 
 Upon building an image, you will then get:
 
-- 
2.47.3


