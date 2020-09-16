Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.3963.1600300779894951391
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id 2C88460004;
	Wed, 16 Sep 2020 23:59:37 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 16/16] ref-manual: examples: libxpm: add relative path to .inc
Date: Thu, 17 Sep 2020 01:59:06 +0200
Message-Id: <20200916235906.243174-16-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to be able to build this example from anywhere, one needs
to give the relative path from LAYERDIR to the .inc file.

The path is the one for the inc file from openembedded-core.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb b/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
index b58d4d7bd..c0c898640 100644
--- a/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
+++ b/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
@@ -1,4 +1,4 @@
-require xorg-lib-common.inc
+require recipes-graphics/xorg-lib/xorg-lib-common.inc
 
 DESCRIPTION = "X11 Pixmap library"
 LICENSE = "X-BSD"
-- 
2.26.2

