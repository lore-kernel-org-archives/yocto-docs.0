Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E3CC44525
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 13:32:01 +0000 (UTC)
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11828.1769002319656770844
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 05:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dx4qL0RdRz3hd;
	Wed, 21 Jan 2026 14:31:58 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dx4qK3RqWzxKK;
	Wed, 21 Jan 2026 14:31:57 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 21 Jan 2026 14:31:46 +0100
Subject: [PATCH v2 05/12] sdk-manual: appending-customizing: use none lexer
 for BitBake code blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-code-block-misc-20260114-v2-5-fdd4bb5c2e68@cherry.de>
References: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
In-Reply-To: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Jan 2026 13:32:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8617

From: Quentin Schulz <quentin.schulz@cherry.de>

No lexer exists for BitBake right now, so let's simply disable the lexer
entirely by using the "none" lexer.

I'm using "none" instead of "text" to be able to "easily" replace none
code blocks the day a BitBake lexer exists. I "reserve" "text" for
actual text content (e.g. a filename, or the output of a command line
without the command line).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/sdk-manual/appendix-customizing.rst | 32 +++++++++++++++++------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index e984b86bd..467c5c10c 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -147,7 +147,9 @@ from the :term:`DISTRO` variable.
 The
 :ref:`populate_sdk_base <ref-classes-populate-sdk-*>`
 class defines the default value of the :term:`SDK_TITLE` variable as
-follows::
+follows:
+
+.. code-block:: none
 
    SDK_TITLE ??= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
 
@@ -159,7 +161,9 @@ an example, assume you have your own layer for your distribution named
 does the default "poky" distribution. If so, you could update the
 :term:`SDK_TITLE` variable in the
 ``~/meta-mydistro/conf/distro/mydistro.conf`` file using the following
-form::
+form:
+
+.. code-block:: none
 
    SDK_TITLE = "your_title"
 
@@ -214,7 +218,9 @@ installation directory for the SDK is based on the
 :term:`SDKEXTPATH` variables from
 within the
 :ref:`populate_sdk_base <ref-classes-populate-sdk-*>`
-class as follows::
+class as follows:
+
+.. code-block:: none
 
    SDKEXTPATH ??= "~/${@d.getVar('DISTRO')}_sdk"
 
@@ -231,7 +237,9 @@ assume you have your own layer for your distribution named
 does the default "poky" distribution. If so, you could update the
 :term:`SDKEXTPATH` variable in the
 ``~/meta-mydistro/conf/distro/mydistro.conf`` file using the following
-form::
+form:
+
+.. code-block:: none
 
    SDKEXTPATH = "some_path_for_your_installed_sdk"
 
@@ -265,7 +273,9 @@ source, you need to do a number of things:
 
 #. Set the appropriate configuration so that the produced SDK knows how
    to find the configuration. The variable you need to set is
-   :term:`SSTATE_MIRRORS`::
+   :term:`SSTATE_MIRRORS`:
+
+   .. code-block:: none
 
       SSTATE_MIRRORS = "file://.* https://example.com/some_path/sstate-cache/PATH"
 
@@ -278,7 +288,9 @@ source, you need to do a number of things:
       side, and its contents will not interfere with the build), then
       you can set the variable in your ``local.conf`` or custom distro
       configuration file. You can then pass the variable to the SDK by
-      adding the following::
+      adding the following:
+
+      .. code-block:: none
 
          ESDK_LOCALCONF_ALLOW = "SSTATE_MIRRORS"
 
@@ -301,7 +313,9 @@ everything needed to reconstruct the image for which the SDK was built.
 This bundling can lead to an SDK installer file that is a Gigabyte or
 more in size. If the size of this file causes a problem, you can build
 an SDK that has just enough in it to install and provide access to the
-``devtool command`` by setting the following in your configuration::
+``devtool command`` by setting the following in your configuration:
+
+.. code-block:: none
 
    SDK_EXT_TYPE = "minimal"
 
@@ -323,7 +337,9 @@ information enables the ``devtool search`` command to return useful
 results.
 
 To facilitate this wider range of information, you would need to set the
-following::
+following:
+
+.. code-block:: none
 
    SDK_INCLUDE_PKGDATA = "1"
 

-- 
2.52.0


