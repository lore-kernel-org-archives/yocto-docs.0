Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.1041.1603734652209948195
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 10:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.200, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.8
Received: from localhost.localdomain (80-110-110-8.cgn.dynamic.surfer.at [80.110.110.8])
	(Authenticated sender: foss@0leil.net)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPA id 704FA20010;
	Mon, 26 Oct 2020 17:50:50 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 3/3] docs: kernel-dev-faq: update outdated RDEPENDS_kernel-base
Date: Mon, 26 Oct 2020 18:50:29 +0100
Message-Id: <20201026175029.22352-3-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026175029.22352-1-foss@0leil.net>
References: <20201026175029.22352-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since 2.5 (sumo), RDEPENDS_kernel-base has been replaced by
RDEPENDS_${KERNEL_PACKAGE_NAME}-base, so let's use this one instead.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/kernel-dev/kernel-dev-faq.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/kernel-dev/kernel-dev-faq.rst b/documentation/kernel-dev/kernel-dev-faq.rst
index c9f2102c7..d6be98a0a 100644
--- a/documentation/kernel-dev/kernel-dev-faq.rst
+++ b/documentation/kernel-dev/kernel-dev-faq.rst
@@ -38,7 +38,7 @@ How do I install/not-install the kernel image on the rootfs?
 The kernel image (e.g. ``vmlinuz``) is provided by the
 ``kernel-image`` package. Image recipes depend on ``kernel-base``. To
 specify whether or not the kernel image is installed in the generated
-root filesystem, override ``RDEPENDS_kernel-base`` to include or not
+root filesystem, override ``RDEPENDS_${KERNEL_PACKAGE_NAME}-base`` to include or not
 include "kernel-image". See the
 ":ref:`dev-manual/dev-manual-common-tasks:using .bbappend files in your layer`"
 section in the
-- 
2.26.2

