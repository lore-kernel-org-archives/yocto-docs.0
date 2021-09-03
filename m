Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.1812.1630659091855370127
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Sep 2021 01:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 97AEF1BF204;
	Fri,  3 Sep 2021 08:51:29 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: font fixes
Date: Fri,  3 Sep 2021 10:51:25 +0200
Message-Id: <20210903085125.2033899-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes font inconsistencies, mixing a ``text`` string
with another string with the regular font, where the whole string
makes more sense with a single font.

The result is also much simpler and will make future
searches easiers.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst        | 4 ++--
 documentation/migration-guides/migration-2.7.rst | 4 ++--
 documentation/overview-manual/concepts.rst       | 2 +-
 documentation/ref-manual/classes.rst             | 4 ++--
 documentation/ref-manual/faq.rst                 | 2 +-
 documentation/ref-manual/terms.rst               | 2 +-
 documentation/ref-manual/variables.rst           | 6 +++---
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index ec43ea4a70..d57ee1a25e 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -9383,8 +9383,8 @@ log to ``${T}/log.do_``\ `task`, and can also log to standard output
 
       Calling this function does not cause the task to fail.
 
--  ``bb.fatal(``\ msg\ ``)``: This logging function is similar to
-   ``bb.error(``\ msg\ ``)`` but also causes the calling task to fail.
+-  ``bb.fatal(msg)``: This logging function is similar to
+   ``bb.error(msg)`` but also causes the calling task to fail.
 
    .. note::
 
diff --git a/documentation/migration-guides/migration-2.7.rst b/documentation/migration-guides/migration-2.7.rst
index 69bd390603..ae70353bf7 100644
--- a/documentation/migration-guides/migration-2.7.rst
+++ b/documentation/migration-guides/migration-2.7.rst
@@ -87,8 +87,8 @@ This section provides information about packaging changes.
    ``bind-utils`` package.
 
 -  Debug split: The default debug split has been changed to create
-   separate source packages (i.e. package_name\ ``-dbg`` and
-   package_name\ ``-src``). If you are currently using ``dbg-pkgs`` in
+   separate source packages (i.e. ``package_name-dbg`` and
+   ``package_name-src``). If you are currently using ``dbg-pkgs`` in
    :term:`IMAGE_FEATURES` to bring in debug
    symbols and you still need the sources, you must now also add
    ``src-pkgs`` to :term:`IMAGE_FEATURES`. Source packages remain in the
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index c8b89885e3..1137010eff 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1200,7 +1200,7 @@ usually made available in the form of a shared state (sstate) cache.
    :term:`SSTATE_MIRRORS`
    variables.
 
-The idea of a setscene task (i.e ``do_``\ taskname\ ``_setscene``) is a
+The idea of a setscene task (i.e ``do_taskname_setscene``) is a
 version of the task where instead of building something, BitBake can
 skip to the end result and simply place a set of files into specific
 locations as needed. In some cases, it makes sense to have a setscene
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3af023895e..aa8fd637f4 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1600,7 +1600,7 @@ or other tools from the build host).
 You can create a recipe that builds tools that run natively on the host
 a couple different ways:
 
--  Create a myrecipe\ ``-native.bb`` recipe that inherits the ``native``
+-  Create a ``myrecipe-native.bb`` recipe that inherits the ``native``
    class. If you use this method, you must order the inherit statement
    in the recipe after all other inherit statements so that the
    ``native`` class is inherited last.
@@ -1642,7 +1642,7 @@ wish to build tools to run as part of an SDK (i.e. tools that run on
 You can create a recipe that builds tools that run on the SDK machine a
 couple different ways:
 
--  Create a ``nativesdk-``\ myrecipe\ ``.bb`` recipe that inherits the
+-  Create a ``nativesdk-myrecipe.bb`` recipe that inherits the
    ``nativesdk`` class. If you use this method, you must order the
    inherit statement in the recipe after all other inherit statements so
    that the ``nativesdk`` class is inherited last.
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index d3a603d4a4..f40367bd58 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -143,7 +143,7 @@ various proxy types and configuring proxy servers, see the
 ":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Network_Proxy>`"
 Wiki page.
 
-**Q:** What's the difference between target and target\ ``-native``?
+**Q:** What's the difference between ``target`` and ``target-native``?
 
 **A:** The ``*-native`` targets are designed to run on the system being
 used for the build. These are usually tools that are needed to assist
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 32658051a5..6663b8603e 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -31,7 +31,7 @@ universal, the list includes them just in case:
          busybox_1.21.%.bbappend
 
       That append file
-      would match any ``busybox_1.21.``\ x\ ``.bb`` version of the recipe. So,
+      would match any ``busybox_1.21.x.bb`` version of the recipe. So,
       the append file would match any of the following recipe names:
 
       .. code-block:: shell
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3a090354e0..9c6d2a51e8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -730,7 +730,7 @@ system and gives an overview of their function and contents.
       Each configuration file you
       use must reside in the :term:`Build Directory`
       ``conf/multiconfig`` directory (e.g.
-      build_directory\ ``/conf/multiconfig/configA.conf``).
+      ``build_directory/conf/multiconfig/configA.conf``).
 
       For information on how to use :term:`BBMULTICONFIG` in an environment
       that supports building targets with multiple configurations, see the
@@ -5347,7 +5347,7 @@ system and gives an overview of their function and contents.
       so one of two ways:
 
       -  *Append file:* Create an append file named
-         recipename\ ``.bbappend`` in your layer and override the value of
+         ``recipename.bbappend`` in your layer and override the value of
          :term:`PACKAGECONFIG`. You can either completely override the
          variable::
 
@@ -8690,7 +8690,7 @@ system and gives an overview of their function and contents.
    :term:`WKS_FILE`
       Specifies the location of the Wic kickstart file that is used by the
       OpenEmbedded build system to create a partitioned image
-      (image\ ``.wic``). For information on how to create a partitioned
+      (``image.wic``). For information on how to create a partitioned
       image, see the
       ":ref:`dev-manual/common-tasks:creating partitioned images using wic`"
       section in the Yocto Project Development Tasks Manual. For details on
-- 
2.25.1

