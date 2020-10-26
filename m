Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.1083.1603734651475937783
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 10:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.200, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.8
Received: from localhost.localdomain (80-110-110-8.cgn.dynamic.surfer.at [80.110.110.8])
	(Authenticated sender: foss@0leil.net)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPA id CD0732000C;
	Mon, 26 Oct 2020 17:50:49 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 2/3] docs: kernel-dev-common: add .patch file extension to SRC_URI files
Date: Mon, 26 Oct 2020 18:50:28 +0100
Message-Id: <20201026175029.22352-2-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026175029.22352-1-foss@0leil.net>
References: <20201026175029.22352-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patches provided in SRC_URI are only applied if their extension is .diff or
.patch. The examples do not use those extensions and would probably result
in user confusion as to why the patches aren't being applied to the
sources.

Let's fix this by giving them a .patch file extension.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/kernel-dev/kernel-dev-common.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/kernel-dev/kernel-dev-common.rst b/documentation/kernel-dev/kernel-dev-common.rst
index 370acf138..830b3e88c 100644
--- a/documentation/kernel-dev/kernel-dev-common.rst
+++ b/documentation/kernel-dev/kernel-dev-common.rst
@@ -436,9 +436,9 @@ home directory:
 
       FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-      SRC_URI_append = " file://patch-file-one"
-      SRC_URI_append = " file://patch-file-two"
-      SRC_URI_append = " file://patch-file-three"
+      SRC_URI_append = " file://patch-file-one.patch"
+      SRC_URI_append = " file://patch-file-two.patch"
+      SRC_URI_append = " file://patch-file-three.patch"
 
    The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
    enable the OpenEmbedded build system to find patch files. For more
-- 
2.26.2

