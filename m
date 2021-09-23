Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web12.1814.1632386072080064782
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Sep 2021 01:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id AB90E63E04
	for <docs@lists.yoctoproject.org>; Thu, 23 Sep 2021 10:34:13 +0200 (CEST)
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] ref-manual: add note about license implications of bundled initramfs
Date: Thu, 23 Sep 2021 10:34:12 +0200
Message-Id: <20210923083412.1500103-3-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923083412.1500103-1-dwagenknecht@emlix.com>
References: <20210923083412.1500103-1-dwagenknecht@emlix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ensure users are aware that usage of INITRAMFS_IMAGE_BUNDLE is only
appropiate for use with GPLv2 compatible software.

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 28eb5f233..4496e2f46 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3587,6 +3587,12 @@ system and gives an overview of their function and=
 contents.
       :term:`CONFIG_INITRAMFS_SOURCE` kernel
       feature.
=20
+      .. note::
+
+         Bundling the initramfs with the kernel conflates the code in th=
e
+         initramfs with the GPLv2 licensed Linux kernel binary. Thus onl=
y GPLv2
+         compatible software may be part of a bundled initramfs.
+
       .. note::
=20
          Using an extra compilation pass to bundle the initramfs avoids =
a
--=20
2.25.1

