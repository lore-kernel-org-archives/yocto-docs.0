Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.460.1623776463038485914
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jun 2021 10:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 46B1C60005;
	Tue, 15 Jun 2021 17:01:00 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] sdk-manual: fix broken references
Date: Tue, 15 Jun 2021 19:00:56 +0200
Message-Id: <20210615170056.211711-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Detected by running:
git grep "^[\ ]*\" section" | grep -v "\`"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../sdk-manual/appendix-customizing.rst         | 12 ++++++------
 documentation/sdk-manual/extensible.rst         | 17 ++++++++---------
 documentation/sdk-manual/working-projects.rst   |  5 ++---
 3 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 67b49d9f49..c122fb5836 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -74,9 +74,9 @@ adjustments:
       is set using the "?=" operator. Consequently, you will need to
       either define the entire list by using the "=" operator, or you
       will need to append a value using either "_append" or the "+="
-      operator. You can learn more about these operators in the "
-      Basic Syntax
-      " section of the BitBake User Manual.
+      operator. You can learn more about these operators in the
+      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:basic syntax`"
+      section of the BitBake User Manual.
 
    .
 
@@ -350,9 +350,9 @@ in most cases.
    If you set
    SDK_EXT_TYPE
    to "minimal", then providing a shared state mirror is mandatory so
-   that items can be installed as needed. See the "
-   Providing Additional Installable Extensible SDK Content
-   " section for more information.
+   that items can be installed as needed. See the
+   :ref:`sdk-manual/appendix-customizing:providing additional installable extensible sdk content`
+   section for more information.
 
 You can explicitly control whether or not to include the toolchain when
 you build an SDK by setting the
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 55bd7f6ebf..d444cad6ea 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -15,9 +15,8 @@ hardware, and ease integration into the rest of the
 .. note::
 
    For a side-by-side comparison of main features supported for an
-   extensible SDK as compared to a standard SDK, see the "
-   Introduction
-   " section.
+   extensible SDK as compared to a standard SDK, see the
+   :ref:`sdk-manual/intro:introduction` section.
 
 In addition to the functionality available through ``devtool``, you can
 alternatively make use of the toolchain directly, for example from
@@ -89,9 +88,9 @@ the SDK for ``core-image-sato`` and using the current &DISTRO; snapshot::
 .. note::
 
    As an alternative to downloading an SDK, you can build the SDK
-   installer. For information on building the installer, see the "
-   Building an SDK Installer
-   " section.
+   installer. For information on building the installer, see the
+   :ref:`sdk-manual/appendix-obtain:building an sdk installer`
+   section.
 
 The SDK and toolchains are self-contained and by default are installed
 into the ``poky_sdk`` folder in your home directory. You can choose to
@@ -606,9 +605,9 @@ counterparts.
    Several methods exist by which you can upgrade recipes -
    devtool upgrade
    happens to be one. You can read about all the methods by which you
-   can upgrade recipes in the "
-   Upgrading Recipes
-   " section of the Yocto Project Development Tasks Manual.
+   can upgrade recipes in the
+   :ref:`dev-manual/common-tasks:upgrading recipes` section
+   of the Yocto Project Development Tasks Manual.
 
 The ``devtool upgrade`` command is flexible enough to allow you to
 specify source code revision and versioning schemes, extract code into
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index ad84ce2b87..c482c38c70 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -135,9 +135,8 @@ project:
 
       To learn about environment variables established when you run the
       cross-toolchain environment setup script and how they are used or
-      overridden when the Makefile, see the "
-      Makefile-Based Projects
-      " section.
+      overridden when the Makefile, see the
+      :ref:`sdk-manual/working-projects:makefile-based projects` section.
 
    This next command is a simple way to verify the installation of your
    project. Running the command prints the architecture on which the
-- 
2.25.1

