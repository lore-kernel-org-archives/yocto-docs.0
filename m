Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.142.1623936019516545481
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 06:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B259F1BF209;
	Thu, 17 Jun 2021 13:20:17 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: fix issues related to trailing docs
Date: Thu, 17 Jun 2021 15:20:05 +0200
Message-Id: <20210617132005.250956-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix missing reference and styling issues found thanks
to trailing dots (only non black character in a line)

Matches (and multiple false positives) found with the below command:
git grep "\s\.$"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst        | 7 ++-----
 documentation/overview-manual/yp-intro.rst        | 3 +--
 documentation/ref-manual/release-process.rst      | 5 ++---
 documentation/sdk-manual/appendix-customizing.rst | 5 +----
 4 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index ab882ff778..642ef15fe5 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1462,12 +1462,9 @@ cross-compiler that is used internally within BitBake only.
 
 .. note::
 
-   The extensible SDK does not use
-   gcc-cross-canadian
+   The extensible SDK does not use ``gcc-cross-canadian``
    since this SDK ships a copy of the OpenEmbedded build system and the
-   sysroot within it contains
-   gcc-cross
-   .
+   sysroot within it contains ``gcc-cross``.
 
 The chain of events that occurs when the standard toolchain is bootstrapped::
 
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 28ed07994a..d20a4ab09f 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -248,8 +248,7 @@ accomplish this through a recipe that is a BitBake append
 .. note::
 
    For general information on BSP layer structure, see the
-   :doc:`/bsp-guide/index`
-   .
+   :doc:`/bsp-guide/index`.
 
 The :term:`Source Directory`
 contains both general layers and BSP layers right out of the box. You
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 64adc1e389..ab143f7df0 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -166,9 +166,8 @@ repository.
 
 .. note::
 
-   You can find all these branches in the Yocto Project
-   Source Repositories
-   .
+   You can find all these branches in the
+   :ref:`overview-manual/development-environment:yocto project source repositories`.
 
 Testing within these public branches ensures in a publicly visible way
 that all of the main supposed architectures and recipes in OE-Core
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 8c635d1662..78d668b8bb 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -78,8 +78,6 @@ adjustments:
       ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:basic syntax`"
       section of the BitBake User Manual.
 
-   .
-
 -  If you have classes or recipes that add additional tasks to the
    standard build flow (i.e. the tasks execute as the recipe builds as
    opposed to being called explicitly), then you need to do one of the
@@ -294,8 +292,7 @@ source, you need to do a number of things:
 
          This second option is the safest option should you have any
          doubts as to which method to use when setting
-         SSTATE_MIRRORS
-         .
+         :term:``SSTATE_MIRRORS``
 
 Minimizing the Size of the Extensible SDK Installer Download
 ============================================================
-- 
2.25.1

