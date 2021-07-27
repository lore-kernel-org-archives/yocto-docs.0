Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.1724.1627395144344274730
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 07:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 937922000A;
	Tue, 27 Jul 2021 14:12:22 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] manuals: simplify references to BitBake manual
Date: Tue, 27 Jul 2021 16:12:00 +0200
Message-Id: <20210727141200.128209-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727141200.128209-1-michael.opdenacker@bootlin.com>
References: <20210727141200.128209-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst     |  4 ++--
 documentation/dev-manual/common-tasks.rst        |  2 +-
 documentation/migration-guides/migration-2.4.rst |  4 ++--
 documentation/overview-manual/concepts.rst       |  6 +++---
 documentation/ref-manual/tasks.rst               |  4 ++--
 documentation/ref-manual/variables.rst           | 12 ++++++------
 documentation/sdk-manual/extensible.rst          |  2 +-
 7 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 8e2f2d423c..e999d925b8 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -267,8 +267,8 @@ an entire Linux distribution, including the toolchain, from source.
 
    For information on using the ``bitbake`` command, see the
    :ref:`overview-manual/concepts:bitbake` section in the Yocto Project Overview and
-   Concepts Manual, or see the ":ref:`BitBake Command
-   <bitbake:bitbake-user-manual/bitbake-user-manual-intro:the bitbake command>`" section in the BitBake User Manual.
+   Concepts Manual, or see the
+   :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-intro:the bitbake command` section in the BitBake User Manual.
 
 #. **Simulate Your Image Using QEMU:** Once this particular image is
    built, you can start QEMU, which is a Quick EMUlator that ships with
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 2af2896171..e46f6a84a7 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -9358,7 +9358,7 @@ log to ``${T}/log.do_``\ `task`, and can also log to standard output
 
 -  ``bb.debug(level, msg)``: Writes "DEBUG: msg" to the
    log. Also logs to stdout if the log level is greater than or equal to
-   level. See the ":ref:`-D <bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax>`" option
+   level. See the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax`" option
    in the BitBake User Manual for more information.
 
 -  ``bb.warn(msg)``: Writes "WARNING: msg" to the log while also
diff --git a/documentation/migration-guides/migration-2.4.rst b/documentation/migration-guides/migration-2.4.rst
index cab81356d8..ae1a212b5d 100644
--- a/documentation/migration-guides/migration-2.4.rst
+++ b/documentation/migration-guides/migration-2.4.rst
@@ -286,8 +286,8 @@ The following are additional changes:
 
 -  BitBake fires multiple "BuildStarted" events when multiconfig is
    enabled (one per configuration). For more information, see the
-   ":ref:`Events <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:events>`" section in the BitBake User
-   Manual.
+   ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:events`"
+   section in the BitBake User Manual.
 
 -  By default, the ``security_flags.inc`` file sets a
    :term:`GCCPIE` variable with an option to enable
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 1e5f0f9039..6377ebc000 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -74,7 +74,7 @@ versions of ``matchbox-desktop`` might exist. BitBake chooses the one
 selected by the distribution configuration. You can get more details
 about how BitBake chooses between different target versions and
 providers in the
-":ref:`Preferences <bitbake:bitbake-user-manual/bitbake-user-manual-execution:preferences>`" section
+":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:preferences`" section
 of the BitBake User Manual.
 
 BitBake also tries to execute any dependent tasks first. So for example,
@@ -584,7 +584,7 @@ Source Control Managers (Optional)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Another place from which the build system can get source files is with
-:ref:`fetchers <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>` employing various Source
+:ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers` employing various Source
 Control Managers (SCMs) such as Git or Subversion. In such cases, a
 repository is cloned or checked out. The
 :ref:`ref-tasks-fetch` task inside
@@ -1863,7 +1863,7 @@ The following list explains the previous example:
   through the shared state cache if possible. If the task was
   accelerated, ``sstate_setscene()`` returns True. Otherwise, it
   returns False, and the normal ``do_deploy`` task runs. For more
-  information, see the ":ref:`setscene <bitbake:bitbake-user-manual/bitbake-user-manual-execution:setscene>`"
+  information, see the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:setscene`"
   section in the BitBake User Manual.
 
 -  The ``do_deploy[dirs] = "${DEPLOYDIR} ${B}"`` line creates
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 970b083942..ecc701856c 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -14,8 +14,8 @@ Normal Recipe Build Tasks
 
 The following sections describe normal tasks associated with building a
 recipe. For more information on tasks and dependencies, see the
-":ref:`Tasks <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:tasks>`" and
-":ref:`Dependencies <bitbake:bitbake-user-manual/bitbake-user-manual-execution:dependencies>`" sections in the
+":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:tasks`" and
+":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:dependencies`" sections in the
 BitBake User Manual.
 
 .. _ref-tasks-build:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3de37a1ab5..55121f2c5a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -256,7 +256,7 @@ system and gives an overview of their function and contents.
       To add a tune to the list, be sure to append it with spaces using the
       "+=" BitBake operator. Do not simply replace the list by using the
       "=" operator. See the
-      ":ref:`Basic Syntax <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:basic syntax>`" section in the BitBake
+      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:basic syntax`" section in the BitBake
       User Manual for more information.
 
    :term:`AZ_SAS`
@@ -1638,8 +1638,8 @@ system and gives an overview of their function and contents.
 
       For information on runtime dependencies, see the
       :term:`RDEPENDS` variable. You can also see the
-      ":ref:`Tasks <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:tasks>`" and
-      ":ref:`Dependencies <bitbake:bitbake-user-manual/bitbake-user-manual-execution:dependencies>`" sections in the
+      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:tasks`" and
+      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:dependencies`" sections in the
       BitBake User Manual for additional information on tasks and
       dependencies.
 
@@ -6105,8 +6105,8 @@ system and gives an overview of their function and contents.
 
       For information on build-time dependencies, see the
       :term:`DEPENDS` variable. You can also see the
-      ":ref:`Tasks <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:tasks>`" and
-      ":ref:`Dependencies <bitbake:bitbake-user-manual/bitbake-user-manual-execution:dependencies>`" sections in the
+      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:tasks`" and
+      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:dependencies`" sections in the
       BitBake User Manual for additional information on tasks and
       dependencies.
 
@@ -6951,7 +6951,7 @@ system and gives an overview of their function and contents.
       protocols are highly dependent on particular BitBake Fetcher
       submodules. Depending on the fetcher BitBake uses, various URL
       parameters are employed. For specifics on the supported Fetchers, see
-      the ":ref:`Fetchers <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`" section in the
+      the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers`" section in the
       BitBake User Manual.
 
       -  ``file://`` - Fetches files, which are usually files shipped
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 5520a07184..2cdb06d65c 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -614,7 +614,7 @@ specify source code revision and versioning schemes, extract code into
 or out of the ``devtool``
 :ref:`devtool-the-workspace-layer-structure`,
 and work with any source file forms that the
-:ref:`fetchers <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>` support.
+:ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers` support.
 
 The following diagram shows the common development flow used with the
 ``devtool upgrade`` command:
-- 
2.25.1

