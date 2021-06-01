Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.91.1622564587009755206
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jun 2021 09:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E304101E
	for <docs@lists.yoctoproject.org>; Tue,  1 Jun 2021 09:23:06 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25B673F719
	for <docs@lists.yoctoproject.org>; Tue,  1 Jun 2021 09:23:06 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] Remove Clutter references
Date: Tue,  1 Jun 2021 17:23:02 +0100
Message-Id: <20210601162302.2379983-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The clutter class and image have been moved to meta-gnome before it
is finally obsoleted for good, so remove mentions from the documentation.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/classes.rst | 15 ---------------
 documentation/ref-manual/images.rst  |  4 ----
 2 files changed, 19 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index 6dd0cbbd41..2314added7 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -289,21 +289,6 @@ is used during the build process for ``nativesdk``, =
``cross``, and
 ``cross-canadian`` recipes to change ``RPATH`` records within binaries
 in order to make them relocatable.
=20
-.. _ref-classes-clutter:
-
-``clutter.bbclass``
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-The ``clutter`` class consolidates the major and minor version naming
-and other common items used by Clutter and related recipes.
-
-.. note::
-
-   Unlike some other classes related to specific libraries, recipes
-   building other software that uses Clutter do not need to inherit this
-   class unless they use the same recipe versioning scheme that the
-   Clutter and related recipes do.
-
 .. _ref-classes-cmake:
=20
 ``cmake.bbclass``
diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manu=
al/images.rst
index b2db1a7734..c6a7239c7e 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -46,10 +46,6 @@ Following is a list of supported recipes:
 -  ``core-image-base``: A console-only image that fully supports the
    target device hardware.
=20
--  ``core-image-clutter``: An image with support for the Open GL-based
-   toolkit Clutter, which enables development of rich and animated
-   graphical user interfaces.
-
 -  ``core-image-full-cmdline``: A console-only image with more
    full-featured Linux system functionality installed.
=20
--=20
2.25.1

