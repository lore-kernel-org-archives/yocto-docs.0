Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web12.1813.1632386064374156789
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Sep 2021 01:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 83DCB63DF5
	for <docs@lists.yoctoproject.org>; Thu, 23 Sep 2021 10:34:13 +0200 (CEST)
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/2] common-tasks: add note about license implications of bundled initramfs
Date: Thu, 23 Sep 2021 10:34:11 +0200
Message-Id: <20210923083412.1500103-2-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923083412.1500103-1-dwagenknecht@emlix.com>
References: <20210923083412.1500103-1-dwagenknecht@emlix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ensure users are aware that usage of INITRAMFS_IMAGE_BUNDLE is only
appropiate for use with GPLv2 compatible software.

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---
 documentation/dev-manual/common-tasks.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/de=
v-manual/common-tasks.rst
index bd8bbecb3..b81f51bf8 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -3886,6 +3886,12 @@ Follow these steps to create an initramfs image:
    variable, allowing the initramfs image to be built into the kernel
    normally.
=20
+   .. note::
+
+      Bundling the initramfs with the kernel conflates the code in the i=
nitramfs
+      with the GPLv2 licensed Linux kernel binary. Thus only GPLv2 compa=
tible
+      software may be part of a bundled initramfs.
+
    .. note::
=20
       If you choose to not bundle the initramfs image with the kernel
--=20
2.25.1

