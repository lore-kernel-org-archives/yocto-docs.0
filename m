Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.1543.1601923084859927078
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 11:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPA id EF9B6C000A;
	Mon,  5 Oct 2020 18:38:02 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2 8/8] docs: ref-manual: ref-classes: remove dropped tinderclient class
Date: Mon,  5 Oct 2020 20:37:28 +0200
Message-Id: <20201005183728.9832-8-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201005183728.9832-1-foss@0leil.net>
References: <20201005183728.9832-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tinderclient class was dropped in dunfell.

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
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

