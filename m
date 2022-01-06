Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7807C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 16:25:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.11047.1641486337513934404
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Jan 2022 08:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 845FDC0005;
	Thu,  6 Jan 2022 16:25:29 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: add reference to GIR_EXTRA_LIBS_PATH plus minor
 improvements
Date: Thu,  6 Jan 2022 17:25:26 +0100
Message-Id: <20220106162526.2733798-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Jan 2022 16:25:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2350

Fixes [YOCTO #14533]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 7 +++----
 documentation/ref-manual/variables.rst    | 7 +++++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 9d0c8f33d4..e2f74ada9f 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -4947,8 +4947,7 @@ the x32 psABI. Here is an example::
 Enabling GObject Introspection Support
 ======================================
 
-`GObject
-introspection <https://wiki.gnome.org/Projects/GObjectIntrospection>`__
+`GObject introspection <https://gi.readthedocs.io/en/latest/>`__
 is the standard mechanism for accessing GObject-based software from
 runtime environments. GObject is a feature of the GLib library that
 provides an object framework for the GNOME desktop and related software.
@@ -4960,7 +4959,7 @@ introspection is the only way to do it.
 
 This section describes the Yocto Project support for generating and
 packaging GObject introspection data. GObject introspection data is a
-description of the API provided by libraries built on top of GLib
+description of the API provided by libraries built on top of the GLib
 framework, and, in particular, that framework's GObject mechanism.
 GObject Introspection Repository (GIR) files go to ``-dev`` packages,
 ``typelib`` files go to main packages as they are packaged together with
@@ -5006,7 +5005,7 @@ library package involves the following:
    .. note::
 
       See recipes in the ``oe-core`` repository that use that
-      ``GIR_EXTRA_LIBS_PATH`` variable as an example.
+      :term:`GIR_EXTRA_LIBS_PATH` variable as an example.
 
 4. Look for any other errors, which probably mean that introspection
    support in a package is not entirely standard, and thus breaks down
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e81a12030a..be496161bd 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2667,6 +2667,13 @@ system and gives an overview of their function and contents.
    :term:`GDB`
       The minimal command and arguments to run the GNU Debugger.
 
+   :term:`GIR_EXTRA_LIBS_PATH`
+      Allows to specify an extra search path for ``.so`` files
+      in GLib related recipes using GObject introspection,
+      and which do not compile without this setting.
+      See the ":ref:`dev-manual/common-tasks:enabling gobject introspection support`"
+      section for details.
+
    :term:`GITDIR`
       The directory in which a local copy of a Git repository is stored
       when it is cloned.
-- 
2.25.1


