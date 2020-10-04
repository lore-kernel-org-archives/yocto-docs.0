Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.7376.1601801884682141728
 for <docs@lists.yoctoproject.org>;
 Sun, 04 Oct 2020 01:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230, mailfrom: foss@0leil.net)
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPA id E5ECD240005;
	Sun,  4 Oct 2020 08:58:01 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 2/8] docs: poky.yaml: use HTTPS for links
Date: Sun,  4 Oct 2020 10:57:22 +0200
Message-Id: <20201004085728.8015-2-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004085728.8015-1-foss@0leil.net>
References: <20201004085728.8015-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Manually tested, ran linkcheck on it too.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/poky.yaml | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 7d544b41a..ec21271a3 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -16,17 +16,17 @@ YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 COPYRIGHT_YEAR : "2010-2020"
 ORGNAME : "The Yocto Project"
 ORGEMAIL : "docs@lists.yoctoproject.org"
-YOCTO_DL_URL : "http://downloads.yoctoproject.org"
-YOCTO_HOME_URL : "http://www.yoctoproject.org"
-YOCTO_LISTS_URL : "http://lists.yoctoproject.org"
-YOCTO_BUGZILLA_URL : "http://bugzilla.yoctoproject.org"
+YOCTO_DL_URL : "https://downloads.yoctoproject.org"
+YOCTO_HOME_URL : "https://www.yoctoproject.org"
+YOCTO_LISTS_URL : "https://lists.yoctoproject.org"
+YOCTO_BUGZILLA_URL : "https://bugzilla.yoctoproject.org"
 YOCTO_WIKI_URL : "https://wiki.yoctoproject.org"
-YOCTO_AB_URL : "http://autobuilder.yoctoproject.org"
-YOCTO_GIT_URL : "http://git.yoctoproject.org"
+YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
+YOCTO_GIT_URL : "https://git.yoctoproject.org"
 YOCTO_ADTREPO_URL : "http://adtrepo.yoctoproject.org"
-OE_HOME_URL : "http://www.openembedded.org"
-OE_LISTS_URL : "http://lists.openembedded.org/mailman"
-OE_DOCS_URL : "http://docs.openembedded.org"
+OE_HOME_URL : "https://www.openembedded.org"
+OE_LISTS_URL : "https://lists.openembedded.org"
+OE_DOCS_URL : "https://docs.openembedded.org"
 OH_HOME_URL : "http://o-hand.com"
 BITBAKE_HOME_URL : "http://developer.berlios.de/projects/bitbake/"
 YOCTO_DOCS_URL : "&YOCTO_HOME_URL;/docs"
-- 
2.26.2

