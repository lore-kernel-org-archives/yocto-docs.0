Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BC5C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:10:51 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.38072.1634569849520128319
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 08:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id C9F1420000D;
	Mon, 18 Oct 2021 15:10:47 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: rename "devpyshell" to "pydevshell"
Date: Mon, 18 Oct 2021 17:10:42 +0200
Message-Id: <20211018151042.22885-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Oct 2021 15:10:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1996

This addresses [YOCTO #14531] after the "devpyshell" task was renamed
to "pydevshell" in OE core.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 12 ++++++------
 documentation/ref-manual/tasks.rst        |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 4683b1c045..3eead147a3 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -3531,14 +3531,14 @@ terminal window.
    -  It is also worth noting that ``devshell`` still works over X11
       forwarding and similar situations.
 
-Using a Development Python Shell
+Using a Python Development Shell
 ================================
 
 Similar to working within a development shell as described in the
 previous section, you can also spawn and work within an interactive
 Python development shell. When debugging certain commands or even when
-just editing packages, ``devpyshell`` can be a useful tool. When you
-invoke the ``devpyshell`` task, all tasks up to and including
+just editing packages, ``pydevshell`` can be a useful tool. When you
+invoke the ``pydevshell`` task, all tasks up to and including
 :ref:`ref-tasks-patch` are run for the
 specified target. Then a new terminal is opened. Additionally, key
 Python objects and code are available in the same way they are to
@@ -3563,17 +3563,17 @@ system were executing them. Consequently, working this way can be
 helpful when debugging a build or preparing software to be used with the
 OpenEmbedded build system.
 
-Following is an example that uses ``devpyshell`` on a target named
+Following is an example that uses ``pydevshell`` on a target named
 ``matchbox-desktop``::
 
-   $ bitbake matchbox-desktop -c devpyshell
+   $ bitbake matchbox-desktop -c pydevshell
 
 This command spawns a terminal and places you in an interactive Python
 interpreter within the OpenEmbedded build environment. The
 :term:`OE_TERMINAL` variable
 controls what type of shell is opened.
 
-When you are finished using ``devpyshell``, you can exit the shell
+When you are finished using ``pydevshell``, you can exit the shell
 either by using Ctrl+d or closing the terminal window.
 
 Building
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 4edae33392..299969dea4 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -516,17 +516,17 @@ scratch is guaranteed.
       $ bitbake -f -c do_cleansstate target
 
 
-.. _ref-tasks-devpyshell:
+.. _ref-tasks-pydevshell:
 
-``do_devpyshell``
+``do_pydevshell``
 -----------------
 
 Starts a shell in which an interactive Python interpreter allows you to
 interact with the BitBake build environment. From within this shell, you
 can directly examine and set bits from the data store and execute
-functions as if within the BitBake environment. See the ":ref:`dev-manual/common-tasks:using a development python shell`" section in
+functions as if within the BitBake environment. See the ":ref:`dev-manual/common-tasks:using a python development shell`" section in
 the Yocto Project Development Tasks Manual for more information about
-using ``devpyshell``.
+using ``pydevshell``.
 
 .. _ref-tasks-devshell:
 
-- 
2.25.1


