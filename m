Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.347.1626458259792413542
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Jul 2021 10:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DF7E4E0008;
	Fri, 16 Jul 2021 17:57:37 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org,
	tonyb@cybernetics.com
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] test-manual: document LTO related reproducibility bug
Date: Fri, 16 Jul 2021 19:57:25 +0200
Message-Id: <20210716175725.99486-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/reproducible-builds.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index e13583c0bf..1938041b2d 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -68,6 +68,17 @@ things we do within the build system to ensure reproducibility include:
 -  Filtering the tools available from the host's ``PATH`` to only a specific set
    of tools, set using the :term:`HOSTTOOLS` variable.
 
+.. note::
+
+   Because of an open bug in GCC, using ``DISTRO_FEATURES_append = " lto"`` or
+   adding ``-flto`` (Link Time Optimization) to a Makefile makes the resulting
+   binary non-reproducible, in that it depends on the full absolute build path
+   to ``recipe-sysroot-native``, so installing the Yocto Project in a different
+   directory results in a different binary.
+
+   This issue is addressed by
+   :yocto_bugs:`bug 14481 -  Programs built with -flto are not reproducible</show_bug.cgi?id=14481>`.
+
 =========================================
 Can we prove the project is reproducible?
 =========================================
-- 
2.25.1

