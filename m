Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.7804.1623317726240204063
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 02:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5CE32100008;
	Thu, 10 Jun 2021 09:35:23 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: move release notes to separate document
Date: Thu, 10 Jun 2021 11:35:21 +0200
Message-Id: <20210610093521.130973-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1675A932C413C877.8243@lists.yoctoproject.org>
References: <1675A932C413C877.8243@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the reference manual much lighter by moving
the release notes to a separate document.

The release notes are also reordered from last to first,
and they appear directly in the left bar, making them easier
to find in the documentation.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/index.rst                       |  1 +
 documentation/ref-manual/index.rst            |  1 -
 documentation/ref-manual/release-process.rst  |  6 ++-
 .../migration.rst => release-notes/index.rst} | 48 ++++++++++---------
 .../migration-1.3.rst                         |  4 +-
 .../migration-1.4.rst                         |  6 +--
 .../migration-1.5.rst                         |  4 +-
 .../migration-1.6.rst                         |  4 +-
 .../migration-1.7.rst                         |  4 +-
 .../migration-1.8.rst                         |  4 +-
 .../migration-2.0.rst                         |  4 +-
 .../migration-2.1.rst                         |  6 +--
 .../migration-2.2.rst                         |  8 ++--
 .../migration-2.3.rst                         |  4 +-
 .../migration-2.4.rst                         |  4 +-
 .../migration-2.5.rst                         |  4 +-
 .../migration-2.6.rst                         |  6 +--
 .../migration-2.7.rst                         |  4 +-
 .../migration-3.0.rst                         |  4 +-
 .../migration-3.1.rst                         |  4 +-
 .../migration-3.2.rst                         |  4 +-
 .../migration-3.3.rst                         |  4 +-
 .../migration-general.rst                     |  0
 23 files changed, 71 insertions(+), 67 deletions(-)
 rename documentation/{ref-manual/migration.rst => release-notes/index.rst} (56%)
 rename documentation/{ref-manual => release-notes}/migration-1.3.rst (98%)
 rename documentation/{ref-manual => release-notes}/migration-1.4.rst (98%)
 rename documentation/{ref-manual => release-notes}/migration-1.5.rst (99%)
 rename documentation/{ref-manual => release-notes}/migration-1.6.rst (99%)
 rename documentation/{ref-manual => release-notes}/migration-1.7.rst (98%)
 rename documentation/{ref-manual => release-notes}/migration-1.8.rst (98%)
 rename documentation/{ref-manual => release-notes}/migration-2.0.rst (98%)
 rename documentation/{ref-manual => release-notes}/migration-2.1.rst (99%)
 rename documentation/{ref-manual => release-notes}/migration-2.2.rst (98%)
 rename documentation/{ref-manual => release-notes}/migration-2.3.rst (99%)
 rename documentation/{ref-manual => release-notes}/migration-2.4.rst (99%)
 rename documentation/{ref-manual => release-notes}/migration-2.5.rst (99%)
 rename documentation/{ref-manual => release-notes}/migration-2.6.rst (99%)
 rename documentation/{ref-manual => release-notes}/migration-2.7.rst (98%)
 rename documentation/{ref-manual => release-notes}/migration-3.0.rst (99%)
 rename documentation/{ref-manual => release-notes}/migration-3.1.rst (98%)
 rename documentation/{ref-manual => release-notes}/migration-3.2.rst (99%)
 rename documentation/{ref-manual => release-notes}/migration-3.3.rst (98%)
 rename documentation/{ref-manual => release-notes}/migration-general.rst (100%)

diff --git a/documentation/index.rst b/documentation/index.rst
index ee9fe055ad..d16099c011 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -41,6 +41,7 @@ Welcome to the Yocto Project Documentation
    :caption: Releases manual
    :hidden:
 
+   Release Notes <release-notes/index>
    releases
 
 .. toctree::
diff --git a/documentation/ref-manual/index.rst b/documentation/ref-manual/index.rst
index deb0383cfc..5cf10c5c2f 100644
--- a/documentation/ref-manual/index.rst
+++ b/documentation/ref-manual/index.rst
@@ -13,7 +13,6 @@ Yocto Project Reference Manual
    system-requirements
    terms
    release-process
-   migration
    structure
    classes
    tasks
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 935a2e39bb..1888049b24 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -62,8 +62,10 @@ codename are likely to be compatible and thus work together.
 
 Releases are given a nominal release version as well but the codename is
 used in repositories for this reason. You can find information on Yocto
-Project releases and codenames at
-:yocto_wiki:`/Releases`.
+Project releases and codenames at :yocto_wiki:`/Releases`.
+
+Our :doc:`/release-notes/index` detail how to migrate from one release of
+the Yocto Project to the next.
 
 Stable Release Process
 ======================
diff --git a/documentation/ref-manual/migration.rst b/documentation/release-notes/index.rst
similarity index 56%
rename from documentation/ref-manual/migration.rst
rename to documentation/release-notes/index.rst
index a01d4ee143..8c5154184c 100644
--- a/documentation/ref-manual/migration.rst
+++ b/documentation/release-notes/index.rst
@@ -1,32 +1,34 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-******************************************
-Migrating to a Newer Yocto Project Release
-******************************************
+===============
+ Release Notes
+===============
 
-This chapter provides information you can use to migrate work to a newer
-Yocto Project release. You can find the same information in the release
-notes for a given release.
+|
+
+This chapter provides release notes and information about how to move to
+a more recent release of the Yocto Project.
 
 .. toctree::
 
    migration-general
-   migration-1.3
-   migration-1.4
-   migration-1.5
-   migration-1.6
-   migration-1.7
-   migration-1.8
-   migration-2.0
-   migration-2.1
-   migration-2.2
-   migration-2.3
-   migration-2.4
-   migration-2.5
-   migration-2.6
-   migration-2.7
-   migration-3.0
-   migration-3.1
-   migration-3.2
    migration-3.3
+   migration-3.2
+   migration-3.1
+   migration-3.0
+   migration-2.7
+   migration-2.6
+   migration-2.5
+   migration-2.4
+   migration-2.3
+   migration-2.2
+   migration-2.1
+   migration-2.0
+   migration-1.8
+   migration-1.7
+   migration-1.6
+   migration-1.5
+   migration-1.4
+   migration-1.3
 
+.. include:: /boilerplate.rst
diff --git a/documentation/ref-manual/migration-1.3.rst b/documentation/release-notes/migration-1.3.rst
similarity index 98%
rename from documentation/ref-manual/migration-1.3.rst
rename to documentation/release-notes/migration-1.3.rst
index b90767ff90..db5333ccd7 100644
--- a/documentation/ref-manual/migration-1.3.rst
+++ b/documentation/release-notes/migration-1.3.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-Moving to the Yocto Project 1.3 Release (danny)
-===============================================
+Release 1.3 (danny)
+===================
 
 This section provides migration information for moving to the Yocto
 Project 1.3 Release (codename "danny") from the prior release.
diff --git a/documentation/ref-manual/migration-1.4.rst b/documentation/release-notes/migration-1.4.rst
similarity index 98%
rename from documentation/ref-manual/migration-1.4.rst
rename to documentation/release-notes/migration-1.4.rst
index deb848749c..c5e2791b75 100644
--- a/documentation/ref-manual/migration-1.4.rst
+++ b/documentation/release-notes/migration-1.4.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 1.4 Release (dylan)
-===============================================
+Release 1.4 (dylan)
+===================
 
 This section provides migration information for moving to the Yocto
 Project 1.4 Release (codename "dylan") from the prior release.
@@ -60,7 +60,7 @@ Differences include the following:
    the :term:`MACHINEOVERRIDES` or
    :term:`DISTROOVERRIDES` variables, as
    appropriate. For more related changes, see the
-   ":ref:`ref-manual/migration-1.4:variables`" section.
+   ":ref:`release-notes/migration-1.4:variables`" section.
 
 .. _migration-1.4-proxies-and-fetching-source:
 
diff --git a/documentation/ref-manual/migration-1.5.rst b/documentation/release-notes/migration-1.5.rst
similarity index 99%
rename from documentation/ref-manual/migration-1.5.rst
rename to documentation/release-notes/migration-1.5.rst
index c772e51b54..f6bd118c9d 100644
--- a/documentation/ref-manual/migration-1.5.rst
+++ b/documentation/release-notes/migration-1.5.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 1.5 Release (dora)
-==============================================
+Release 1.5 (dora)
+==================
 
 This section provides migration information for moving to the Yocto
 Project 1.5 Release (codename "dora") from the prior release.
diff --git a/documentation/ref-manual/migration-1.6.rst b/documentation/release-notes/migration-1.6.rst
similarity index 99%
rename from documentation/ref-manual/migration-1.6.rst
rename to documentation/release-notes/migration-1.6.rst
index 5a18d63103..1408e12c23 100644
--- a/documentation/ref-manual/migration-1.6.rst
+++ b/documentation/release-notes/migration-1.6.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 1.6 Release (daisy)
-===============================================
+Release 1.6 (daisy)
+===================
 
 This section provides migration information for moving to the Yocto
 Project 1.6 Release (codename "daisy") from the prior release.
diff --git a/documentation/ref-manual/migration-1.7.rst b/documentation/release-notes/migration-1.7.rst
similarity index 98%
rename from documentation/ref-manual/migration-1.7.rst
rename to documentation/release-notes/migration-1.7.rst
index 46bf126583..999f11a12b 100644
--- a/documentation/ref-manual/migration-1.7.rst
+++ b/documentation/release-notes/migration-1.7.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 1.7 Release (dizzy)
-===============================================
+Release 1.7 (dizzy)
+===================
 
 This section provides migration information for moving to the Yocto
 Project 1.7 Release (codename "dizzy") from the prior release.
diff --git a/documentation/ref-manual/migration-1.8.rst b/documentation/release-notes/migration-1.8.rst
similarity index 98%
rename from documentation/ref-manual/migration-1.8.rst
rename to documentation/release-notes/migration-1.8.rst
index 68d5dcf859..971bd33f40 100644
--- a/documentation/ref-manual/migration-1.8.rst
+++ b/documentation/release-notes/migration-1.8.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 1.8 Release (fido)
-==============================================
+Release 1.8 (fido)
+==================
 
 This section provides migration information for moving to the Yocto
 Project 1.8 Release (codename "fido") from the prior release.
diff --git a/documentation/ref-manual/migration-2.0.rst b/documentation/release-notes/migration-2.0.rst
similarity index 98%
rename from documentation/ref-manual/migration-2.0.rst
rename to documentation/release-notes/migration-2.0.rst
index 8319b0ee36..22d0752226 100644
--- a/documentation/ref-manual/migration-2.0.rst
+++ b/documentation/release-notes/migration-2.0.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 2.0 Release (jethro)
-================================================
+Release 2.0 (jethro)
+====================
 
 This section provides migration information for moving to the Yocto
 Project 2.0 Release (codename "jethro") from the prior release.
diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/release-notes/migration-2.1.rst
similarity index 99%
rename from documentation/ref-manual/migration-2.1.rst
rename to documentation/release-notes/migration-2.1.rst
index 32d193f0ff..24342f1192 100644
--- a/documentation/ref-manual/migration-2.1.rst
+++ b/documentation/release-notes/migration-2.1.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 2.1 Release (krogoth)
-=================================================
+Release 2.1 (krogoth)
+=====================
 
 This section provides migration information for moving to the Yocto
 Project 2.1 Release (codename "krogoth") from the prior release.
@@ -179,7 +179,7 @@ The following recipes have been removed in the 2.1 release:
 -  ``python-pygtk``: Recipe became obsolete.
 
 -  ``adt-installer``: Recipe became obsolete. See the
-   ":ref:`ref-manual/migration-2.1:adt removed`" section for more information.
+   ":ref:`release-notes/migration-2.1:adt removed`" section for more information.
 
 .. _migration-2.1-class-changes:
 
diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/release-notes/migration-2.2.rst
similarity index 98%
rename from documentation/ref-manual/migration-2.2.rst
rename to documentation/release-notes/migration-2.2.rst
index a60ce8d52b..455a78cb3c 100644
--- a/documentation/ref-manual/migration-2.2.rst
+++ b/documentation/release-notes/migration-2.2.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 2.2 Release (morty)
-===============================================
+Release 2.2 (morty)
+===================
 
 This section provides migration information for moving to the Yocto
 Project 2.2 Release (codename "morty") from the prior release.
@@ -364,7 +364,7 @@ The following recipes have been removed:
 -  ``sato-icon-theme``: Became obsolete.
 
 -  ``swabber-native``: Swabber has been removed. See the :ref:`entry on
-   Swabber <ref-manual/migration-2.2:swabber has been removed>`.
+   Swabber <release-notes/migration-2.2:swabber has been removed>`.
 
 -  ``tslib``: No longer needed and has been moved to ``meta-oe``.
 
@@ -390,7 +390,7 @@ The following classes have been removed:
 -  ``sip``: Mostly unused.
 
 -  ``swabber``: See the :ref:`entry on
-   Swabber <ref-manual/migration-2.2:swabber has been removed>`.
+   Swabber <release-notes/migration-2.2:swabber has been removed>`.
 
 .. _migration-2.2-minor-packaging-changes:
 
diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation/release-notes/migration-2.3.rst
similarity index 99%
rename from documentation/ref-manual/migration-2.3.rst
rename to documentation/release-notes/migration-2.3.rst
index dfbda612ae..6cdc209e35 100644
--- a/documentation/ref-manual/migration-2.3.rst
+++ b/documentation/release-notes/migration-2.3.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 2.3 Release (pyro)
-==============================================
+Release 2.3 (pyro)
+==================
 
 This section provides migration information for moving to the Yocto
 Project 2.3 Release (codename "pyro") from the prior release.
diff --git a/documentation/ref-manual/migration-2.4.rst b/documentation/release-notes/migration-2.4.rst
similarity index 99%
rename from documentation/ref-manual/migration-2.4.rst
rename to documentation/release-notes/migration-2.4.rst
index 2ba17e0ed5..44f31dc8a9 100644
--- a/documentation/ref-manual/migration-2.4.rst
+++ b/documentation/release-notes/migration-2.4.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 2.4 Release (rocko)
-===============================================
+Release 2.4 (rocko)
+===================
 
 This section provides migration information for moving to the Yocto
 Project 2.4 Release (codename "rocko") from the prior release.
diff --git a/documentation/ref-manual/migration-2.5.rst b/documentation/release-notes/migration-2.5.rst
similarity index 99%
rename from documentation/ref-manual/migration-2.5.rst
rename to documentation/release-notes/migration-2.5.rst
index 86a0da9c40..c7e0760463 100644
--- a/documentation/ref-manual/migration-2.5.rst
+++ b/documentation/release-notes/migration-2.5.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 2.5 Release (sumo)
-==============================================
+Release 2.5 (sumo)
+==================
 
 This section provides migration information for moving to the Yocto
 Project 2.5 Release (codename "sumo") from the prior release.
diff --git a/documentation/ref-manual/migration-2.6.rst b/documentation/release-notes/migration-2.6.rst
similarity index 99%
rename from documentation/ref-manual/migration-2.6.rst
rename to documentation/release-notes/migration-2.6.rst
index d1c6c0c5f5..b29748fcdd 100644
--- a/documentation/ref-manual/migration-2.6.rst
+++ b/documentation/release-notes/migration-2.6.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 2.6 Release (thud)
-==============================================
+Release 2.6 (thud)
+==================
 
 This section provides migration information for moving to the Yocto
 Project 2.6 Release (codename "thud") from the prior release.
@@ -110,7 +110,7 @@ upon the older ``*proto`` recipes need to be changed to depend on the
 newer ``xorgproto`` recipe instead.
 
 For names of recipes removed because of this repository change, see the
-:ref:`ref-manual/migration-2.6:removed recipes` section.
+:ref:`release-notes/migration-2.6:removed recipes` section.
 
 .. _migration-2.6-distutils-distutils3-fetching-dependencies:
 
diff --git a/documentation/ref-manual/migration-2.7.rst b/documentation/release-notes/migration-2.7.rst
similarity index 98%
rename from documentation/ref-manual/migration-2.7.rst
rename to documentation/release-notes/migration-2.7.rst
index 1be4d5d5b9..66cb84584f 100644
--- a/documentation/ref-manual/migration-2.7.rst
+++ b/documentation/release-notes/migration-2.7.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 2.7 Release (warrior)
-=================================================
+Release 2.7 (warrior)
+=====================
 
 This section provides migration information for moving to the Yocto
 Project 2.7 Release (codename "warrior") from the prior release.
diff --git a/documentation/ref-manual/migration-3.0.rst b/documentation/release-notes/migration-3.0.rst
similarity index 99%
rename from documentation/ref-manual/migration-3.0.rst
rename to documentation/release-notes/migration-3.0.rst
index a3da850150..163c6201c5 100644
--- a/documentation/ref-manual/migration-3.0.rst
+++ b/documentation/release-notes/migration-3.0.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 3.0 Release (zeus)
-==============================================
+Release 3.0 (zeus)
+==================
 
 This section provides migration information for moving to the Yocto
 Project 3.0 Release (codename "zeus") from the prior release.
diff --git a/documentation/ref-manual/migration-3.1.rst b/documentation/release-notes/migration-3.1.rst
similarity index 98%
rename from documentation/ref-manual/migration-3.1.rst
rename to documentation/release-notes/migration-3.1.rst
index 7822285a87..d6a30dc274 100644
--- a/documentation/ref-manual/migration-3.1.rst
+++ b/documentation/release-notes/migration-3.1.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 3.1 Release (dunfell)
-=================================================
+Release 3.1 (dunfell)
+=====================
 
 This section provides migration information for moving to the Yocto
 Project 3.1 Release (codename "dunfell") from the prior release.
diff --git a/documentation/ref-manual/migration-3.2.rst b/documentation/release-notes/migration-3.2.rst
similarity index 99%
rename from documentation/ref-manual/migration-3.2.rst
rename to documentation/release-notes/migration-3.2.rst
index 956a56f626..dd316a70ff 100644
--- a/documentation/ref-manual/migration-3.2.rst
+++ b/documentation/release-notes/migration-3.2.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 3.2 Release (gatesgarth)
-====================================================
+Release 3.2 (gatesgarth)
+========================
 
 This section provides migration information for moving to the Yocto
 Project 3.2 Release (codename "gatesgarth") from the prior release.
diff --git a/documentation/ref-manual/migration-3.3.rst b/documentation/release-notes/migration-3.3.rst
similarity index 98%
rename from documentation/ref-manual/migration-3.3.rst
rename to documentation/release-notes/migration-3.3.rst
index 4fb51a39dc..28857e820b 100644
--- a/documentation/ref-manual/migration-3.3.rst
+++ b/documentation/release-notes/migration-3.3.rst
@@ -1,5 +1,5 @@
-Moving to the Yocto Project 3.3 Release (hardknott)
-===================================================
+Release 3.3 (hardknott)
+=======================
 
 This section provides migration information for moving to the Yocto
 Project 3.3 Release (codename "hardknott") from the prior release.
diff --git a/documentation/ref-manual/migration-general.rst b/documentation/release-notes/migration-general.rst
similarity index 100%
rename from documentation/ref-manual/migration-general.rst
rename to documentation/release-notes/migration-general.rst
-- 
2.25.1

