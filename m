Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF75FC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 14:18:36 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.10346.1634653115595479714
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 07:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 602F3FF813;
	Tue, 19 Oct 2021 14:18:33 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/3] ref-manual: document "reproducible_build" class and
 SOURCE_DATE_EPOCH
Date: Tue, 19 Oct 2021 16:18:23 +0200
Message-Id: <20211019141824.1980728-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019141824.1980728-1-michael.opdenacker@bootlin.com>
References: <20211019141824.1980728-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Oct 2021 14:18:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2001

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/migration-3.1.rst          |  5 +++--
 documentation/ref-manual/classes.rst            | 12 ++++++++++++
 documentation/ref-manual/variables.rst          | 17 +++++++++++++++++
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-3.1.rst b/documentation/migration-guides/migration-3.1.rst
index 80b8f6baa5..a7614e5da4 100644
--- a/documentation/migration-guides/migration-3.1.rst
+++ b/documentation/migration-guides/migration-3.1.rst
@@ -55,8 +55,9 @@ Reproducible builds now enabled by default
 
 In order to avoid unnecessary differences in output files (aiding binary
 reproducibility), the Poky distribution configuration
-(``DISTRO = "poky"``) now inherits the ``reproducible_build`` class by
-default.
+(``DISTRO = "poky"``) now inherits the
+:ref:`reproducible-build <ref-classes-reproducible-build>` class
+by default.
 
 .. _migration-3.1-ptest-feature-impact:
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 79af45ada5..381c5d1dd7 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2209,6 +2209,18 @@ commit, and log. From the information, report files using a JSON format
 are created and stored in
 ``${``\ :term:`LOG_DIR`\ ``}/error-report``.
 
+.. _ref-classes-reproducible-build:
+
+``reproducible_build.bbclass``
+==============================
+
+The ``reproducible_build.bbclass`` class enables
+:ref:`test-manual/reproducible-builds:reproducible builds` by computing
+a :term:`SOURCE_DATE_EPOCH` value in each component's build environment, so
+that the build is independent from the time when the component was built.
+
+Poky inherits this class by default since version 3.1.
+
 .. _ref-classes-rm-work:
 
 ``rm_work.bbclass``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9daf230a59..241d5aa2d5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6938,6 +6938,23 @@ system and gives an overview of their function and contents.
       You will see this variable referenced in the default values of
       ``FILES:${PN}-dev``.
 
+   :term:`SOURCE_DATE_EPOCH`
+      This defines a date expressed in number of seconds since
+      the UNIX EPOCH (01 Jan 1970 00:00:00 UTC), which is used by
+      multiple build systems to force a timestamp in built binaries.
+      Many upstream projects already support this variable.
+
+      You will find more details in the `official specifications
+      <https://reproducible-builds.org/specs/source-date-epoch/>`__.
+
+      A value for each recipe is computed from the sources by
+      the :ref:`reproducible-build <ref-classes-reproducible-build>` class.
+
+      If a recipe wishes to override the default behavior, it should set its
+      own :term:`SOURCE_DATE_EPOCH` value::
+
+          SOURCE_DATE_EPOCH = "1613559011"
+
    :term:`SOURCE_MIRROR_FETCH`
       When you are fetching files to create a mirror of sources (i.e.
       creating a source mirror), setting :term:`SOURCE_MIRROR_FETCH` to "1" in
-- 
2.25.1


