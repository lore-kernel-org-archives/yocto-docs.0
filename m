Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.326.1619109584704637328
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 09:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from localhost (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 43A8CFF80A;
	Thu, 22 Apr 2021 16:39:43 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] ref-manual/variables.rst: Add incompatibility warning for SERIAL_CONSOLES_CHECK
Date: Thu, 22 Apr 2021 18:39:40 +0200
Message-Id: <20210422163940.300616-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16783B7361829FC0.16298@lists.yoctoproject.org>
References: <16783B7361829FC0.16298@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

See [YOCTO #13921]

Add details to the SERIAL_CONSOLES_CHECK entry to clarify that it
doesn't work with read-only rootfs.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 64521b89bb..3297a69edf 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6694,7 +6694,11 @@ system and gives an overview of their function and contents.
          SERIAL_CONSOLES_CHECK = "slcp_line0:ttyS0"
 
       This variable is currently only supported with SysVinit (i.e. not
-      with systemd).
+      with systemd). Note that :term:`SERIAL_CONSOLES_CHECK` also requires
+      ``/etc/inittab`` to be writable when used with SysVinit. This makes it
+      incompatible with customizations such as the following::
+
+         EXTRA_IMAGE_FEATURES += "read-only-rootfs"
 
    :term:`SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS`
       A list of recipe dependencies that should not be used to determine
-- 
2.25.1

