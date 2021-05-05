Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.8331.1620221652411790050
 for <docs@lists.yoctoproject.org>;
 Wed, 05 May 2021 06:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from localhost (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 824E760004;
	Wed,  5 May 2021 13:34:10 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: reduce verbosity with "worry about" expression
Date: Wed,  5 May 2021 15:34:08 +0200
Message-Id: <20210505133408.61293-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst  | 4 ++--
 documentation/kernel-dev/common.rst        | 4 ++--
 documentation/ref-manual/classes.rst       | 4 ++--
 documentation/ref-manual/structure.rst     | 2 +-
 documentation/toaster-manual/reference.rst | 5 ++---
 5 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 37c7a19bfa..713ed8d64e 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -1589,7 +1589,7 @@ your software is built:
 
 -  *Autotools:* If your source files have a ``configure.ac`` file, then
    your software is built using Autotools. If this is the case, you just
-   need to worry about modifying the configuration.
+   to modify the configuration.
 
    When using Autotools, your recipe needs to inherit the
    :ref:`autotools <ref-classes-autotools>` class
@@ -1603,7 +1603,7 @@ your software is built:
 
 -  *CMake:* If your source files have a ``CMakeLists.txt`` file, then
    your software is built using CMake. If this is the case, you just
-   need to worry about modifying the configuration.
+   need to modify the configuration.
 
    When you use CMake, your recipe needs to inherit the
    :ref:`cmake <ref-classes-cmake>` class and your
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 3f35d8412f..54ea1e2ef3 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -589,8 +589,8 @@ recipe is processed.
 
    In general, however, the Yocto Project maintainers take care of
    moving the ``SRC_URI``-specified configuration options to the
-   kernel's ``meta`` branch. Not only is it easier for BSP developers to
-   not have to worry about putting those configurations in the branch,
+   kernel's ``meta`` branch. Not only is it easier for BSP developers
+   not to have to put those configurations in the branch,
    but having the maintainers do it allows them to apply 'global'
    knowledge about the kinds of common configuration options multiple
    BSPs in the tree are typically using. This allows for promotion of
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 9a1fc2c93f..a6347449f1 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1260,8 +1260,8 @@ The following list shows the tests you can list with the ``WARN_QA`` and
 
    .. note::
 
-      If you are not using runtime package management on your target
-      system, then you do not need to worry about this situation.
+      This is only relevant when you are using runtime package management
+      on your target system.
 
 -  ``xorg-driver-abi:`` Checks that all packages containing Xorg
    drivers have ABI dependencies. The ``xserver-xorg`` recipe provides
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index f8dc7d2821..d28af6affd 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -38,7 +38,7 @@ usually matches the current stable BitBake release from the BitBake
 project. BitBake, a :term:`Metadata` interpreter, reads the
 Yocto Project Metadata and runs the tasks defined by that data. Failures
 are usually caused by errors in your Metadata and not from BitBake
-itself; consequently, most users do not need to worry about BitBake.
+itself.
 
 When you run the ``bitbake`` command, the main BitBake executable (which
 resides in the ``bitbake/bin/`` directory) starts. Sourcing the
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index 3d4efe92d6..5d52c449cd 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -32,9 +32,8 @@ through a
 `REST <https://en.wikipedia.org/wiki/Representational_state_transfer>`__
 API, store the information about the layers in the Toaster database, and
 then show the information to users. Users are then able to view that
-information and build layers from Toaster itself without worrying about
-cloning or editing the BitBake layers configuration file
-``bblayers.conf``.
+information and build layers from Toaster itself without having to
+clone or edit the BitBake layers configuration file ``bblayers.conf``.
 
 Tying a layer source into Toaster is convenient when you have many
 custom layers that need to be built on a regular basis by a community of
-- 
2.25.1

