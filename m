Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.7380.1601801887885179382
 for <docs@lists.yoctoproject.org>;
 Sun, 04 Oct 2020 01:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230, mailfrom: foss@0leil.net)
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPA id 2F45C240003;
	Sun,  4 Oct 2020 08:58:05 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 7/8] docs: ref-manual: ref-classes: remove dropped tinderclient class
Date: Sun,  4 Oct 2020 10:57:27 +0200
Message-Id: <20201004085728.8015-7-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004085728.8015-1-foss@0leil.net>
References: <20201004085728.8015-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tinderclient class was dropped in dunfell.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/ref-classes.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index a0f48b152..691dbafeb 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -2668,18 +2668,6 @@ host system.
    you can remove "texinfo-native" from :term:`ASSUME_PROVIDED` and makeinfo
    from :term:`SANITY_REQUIRED_UTILITIES`.
 
-.. _ref-classes-tinderclient:
-
-``tinderclient.bbclass``
-========================
-
-The ``tinderclient`` class submits build results to an external
-Tinderbox instance.
-
-.. note::
-
-   This class is currently unmaintained.
-
 .. _ref-classes-toaster:
 
 ``toaster.bbclass``
-- 
2.26.2

