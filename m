Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887C4C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 08:43:28 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.43721.1747989798093294947
 for <docs@lists.yoctoproject.org>;
 Fri, 23 May 2025 01:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 May
 2025 16:43:14 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 May 2025 16:43:14 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <docs@lists.yoctoproject.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v2] ref-manual: uboot-sign: Support firmware property in FIT config
Date: Fri, 23 May 2025 16:43:14 +0800
Message-ID: <20250523084314.775497-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 May 2025 08:43:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6885

Add documentation for the UBOOT_FIT_CONF_FIRMWARE variable, which allows
users to specify an image to be assigned to the "firmware" property of
the FIT configuration node. This explicitly defines the primary image
to boot, instead of relying on the first entry in the "loadables" list.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 documentation/ref-manual/classes.rst   | 2 ++
 documentation/ref-manual/variables.rst | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index 5187033f7..54a98bf24 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3426,6 +3426,8 @@ The variables used by this class are:
 -  :term:`UBOOT_FIT_USER_SETTINGS`: adds a user-specific snippet to the U-=
Boot
    Image Tree Source (ITS). Users can include their custom U-Boot Image Tr=
ee
    Source (ITS) snippet in this variable.
+-  :term:`UBOOT_FIT_CONF_FIRMWARE`: adds one image to the ``firmware`` pro=
perty
+   of the configuration node.
 -  :term:`UBOOT_FIT_CONF_USER_LOADABLES`: adds one or more user-defined im=
ages
    to the ``loadables`` property of the configuration node.
=20
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 643a3e7ae..b382e2281 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10327,6 +10327,14 @@ system and gives an overview of their function and=
 contents.
=20
          do_compile[depends] +=3D "trusted-firmware-a:do_deploy"
=20
+   :term:`UBOOT_FIT_CONF_FIRMWARE`
+      Adds one image to the ``firmware`` property of the configuration nod=
e
+      of the U-Boot Image Tree Source (ITS). Sets the firmware property to=
 select
+      the image to boot first. If not set, the first entry in "loadables" =
is used
+      to boot instead::
+
+         UBOOT_FIT_CONF_FIRMWARE =3D "fwa"
+
    :term:`UBOOT_FIT_CONF_USER_LOADABLES`
       Adds one or more user-defined images to the ``loadables`` property o=
f the
       configuration node of the U-Boot Image Tree Source (ITS). This varia=
ble
--=20
2.43.0


