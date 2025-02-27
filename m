Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF38AC19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 13:58:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10915.1740664733469530809
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Feb 2025 05:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FA8F2BCA
	for <docs@lists.yoctoproject.org>; Thu, 27 Feb 2025 05:59:08 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9CE4C3F673
	for <docs@lists.yoctoproject.org>; Thu, 27 Feb 2025 05:58:52 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual: remove OE_IMPORTS
Date: Thu, 27 Feb 2025 13:58:47 +0000
Message-ID: <20250227135847.3439559-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Feb 2025 13:58:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6465

oe-core no longer supports OE_IMPORTS[1], so remove the documentation.

[1] oe-core 1f56155e ("base: Switch to use addpylib directive and
    BB_GLOBAL_PYMODULES")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/variables.rst | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 60984cc8f34..a504387c156 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5773,14 +5773,6 @@ system and gives an overview of their function and=
 contents.
=20
          OECMAKE_GENERATOR =3D "Unix Makefiles"
=20
-   :term:`OE_IMPORTS`
-      An internal variable used to tell the OpenEmbedded build system wh=
at
-      Python modules to import for every Python function run by the syst=
em.
-
-      .. note::
-
-         Do not set this variable. It is for internal use only.
-
    :term:`OE_INIT_ENV_SCRIPT`
       The name of the build environment setup script for the purposes of
       setting up the environment within the extensible SDK. The default
--=20
2.43.0


