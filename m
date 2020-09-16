Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.3956.1600300771670812677
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id EC34D60006;
	Wed, 16 Sep 2020 23:59:29 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 04/16] sphinx: overview-manual: add link to AUH how-to section
Date: Thu, 17 Sep 2020 01:58:54 +0200
Message-Id: <20200916235906.243174-4-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/overview-manual/overview-manual-yp-intro.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index 13ff7e9f0..93f5b506a 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -365,7 +365,9 @@ activities using the Yocto Project:
    :term:`OpenEmbedded Build System`
    (BitBake and
    OE-Core) automatically generates upgrades for recipes that are based
-   on new versions of the recipes published upstream.
+   on new versions of the recipes published upstream. See
+   :ref:`dev-manual/dev-manual-common-tasks:using the auto upgrade helper (auh)`
+   for how to set it up.
 
 -  *Recipe Reporting System:* The Recipe Reporting System tracks recipe
    versions available for Yocto Project. The main purpose of the system
-- 
2.26.2

