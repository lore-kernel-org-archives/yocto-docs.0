Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199CEC47DA6
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 16:53:45 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.12412.1705078419525136611
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 08:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VzrinYNk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11E3A240002;
	Fri, 12 Jan 2024 16:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705078418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r63Xkwzy0/VSVomXLU/Q4TJ7tLWTc+IYfGcXRNHc3Mo=;
	b=VzrinYNkJLhYoOceiJkfslp0o7il+QDFrTgZqaRMDaWs8l2MBc4Y/voqt0TMErQ/Ajhnpn
	hJ7OHx6dytV/KKlqW3wcrS7GpOqxMMJfZVXBIcU1m7ll2WzW9YMZgAHsm1QnsZN2rpbIiB
	3BU/4uY3wk7qcuTHFna5Qbkh3ebsYpTSf4KLw61OqYE4BLO7Qruqw/stqR49hmBsl9Rii6
	iS1cR2Cz9TQGhnpvCTCJDr50A1FpCxbG3Xz73GbJ//4peGKTwmdbYcwJxZHHwAvxTG4p3l
	AKSW2PAMfyiB5w+PN980Rc4tQYbGckA9fjB6IkTDwj/CrP8ZsUpx8Mi3ecwcQQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [kirkstone][PATCH 5/6] manuals: document VSCode extension
Date: Fri, 12 Jan 2024 17:53:10 +0100
Message-Id: <20240112165311.3554201-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112165311.3554201-1-michael.opdenacker@bootlin.com>
References: <20240112165311.3554201-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jan 2024 16:53:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4778

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

The VSCode extension is now officially maintained and published by the
Yocto Project so it should be referenced in the manuals to help users
discover it.

I located the most relevant places to reference the extension by looking
at how the old Eclipse plugin was documented in the 2.6 manuals as well
as the current Toaster references.

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/building.rst         |  4 ++++
 documentation/dev-manual/start.rst            | 15 +++++++++++---
 .../development-environment.rst               |  8 ++++++++
 documentation/overview-manual/yp-intro.rst    | 20 +++++++++++++++++++
 documentation/ref-manual/resources.rst        |  5 +++++
 documentation/what-i-wish-id-known.rst        |  7 +++++++
 6 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index a395793493..e964bd1aee 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -32,6 +32,10 @@ build host running Linux.
       OpenEmbedded build system, see the
       :doc:`/brief-yoctoprojectqs/index` document.
 
+   -  You can also use the `Yocto Project BitBake
+      <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__
+      extension for Visual Studio Code to build images.
+
 The build process creates an entire Linux distribution from source and
 places it in your :term:`Build Directory` under ``tmp/deploy/images``. For
 detailed information on the build process using BitBake, see the
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 5a81506a9b..44503a5183 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -332,7 +332,10 @@ to use the Extensible SDK, see the ":doc:`/sdk-manual/extensible`" Chapter in th
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual. If you want to work on the kernel, see the :doc:`/kernel-dev/index`. If you are going to use
 Toaster, see the ":doc:`/toaster-manual/setup-and-use`"
-section in the Toaster User Manual.
+section in the Toaster User Manual. If you are a VSCode user, you can configure
+the `Yocto Project BitBake
+<https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__
+extension accordingly.
 
 Setting Up to Use CROss PlatformS (CROPS)
 -----------------------------------------
@@ -424,7 +427,10 @@ section. If you are going to use the Extensible SDK container, see the
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual. If you are going to use the Toaster container, see
 the ":doc:`/toaster-manual/setup-and-use`"
-section in the Toaster User Manual.
+section in the Toaster User Manual. If you are a VSCode user, you can configure
+the `Yocto Project BitBake
+<https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__
+extension accordingly.
 
 Setting Up to Use Windows Subsystem For Linux (WSLv2)
 -----------------------------------------------------
@@ -554,7 +560,10 @@ Extensible SDK container, see the ":doc:`/sdk-manual/extensible`" Chapter in the
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual. If you are going to use the Toaster container, see
 the ":doc:`/toaster-manual/setup-and-use`"
-section in the Toaster User Manual.
+section in the Toaster User Manual. If you are a VSCode user, you can configure
+the `Yocto Project BitBake
+<https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__
+extension accordingly.
 
 Locating Yocto Project Source Files
 ===================================
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 332cea836d..30c7af4531 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -132,6 +132,14 @@ are several ways of working in the Yocto Project environment:
    Toaster and on how to use Toaster in general, see the
    :doc:`/toaster-manual/index`.
 
+-  *Using the VSCode Extension:* You can use the `Yocto Project BitBake
+   <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__
+   extension for Visual Studio Code to start your BitBake builds through a
+   graphical user interface.
+
+   Learn more about the VSCode Extension on the `extension's marketplace page
+   <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__.
+
 Yocto Project Source Repositories
 =================================
 
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 25dc08b09d..f7cd2486af 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -340,6 +340,18 @@ the Yocto Project:
    view information about builds. For information on Toaster, see the
    :doc:`/toaster-manual/index`.
 
+-  *VSCode IDE Extension:* The `Yocto Project BitBake
+   <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__
+   extension for Visual Studio Code provides a rich set of features for working
+   with BitBake recipes. The extension provides syntax highlighting,
+   hover tips, and completion for BitBake files as well as embedded Python and
+   Bash languages. Additional views and commands allow you to efficiently
+   browse, build and edit recipes. It also provides SDK integration for
+   cross-compiling and debugging through ``devtool``.
+
+   Learn more about the VSCode Extension on the `extension's frontpage
+   <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__.
+
 Production Tools
 ----------------
 
@@ -610,6 +622,14 @@ Build Host runs, you have several choices.
    For information about and how to use Toaster, see the
    :doc:`/toaster-manual/index`.
 
+-  *Using the VSCode Extension:* You can use the `Yocto Project BitBake
+   <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__
+   extension for Visual Studio Code to start your BitBake builds through a
+   graphical user interface.
+
+   Learn more about the VSCode Extension on the `extension's marketplace page
+   <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__
+
 Reference Embedded Distribution (Poky)
 ======================================
 
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 8c3726e83b..8e54ac87c9 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -169,6 +169,11 @@ Here is a list of resources you might find helpful:
    the :term:`OpenEmbedded Build System`, which uses
    BitBake, that reports build information.
 
+-  `Yocto Project BitBake extension for VSCode
+   <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__:
+   This extension provides a rich feature set when working with BitBake recipes
+   within the Visual Studio Code IDE.
+
 -  :yocto_wiki:`FAQ </FAQ>`: A list of commonly asked
    questions and their answers.
 
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index 4843f02276..c21810d49b 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -213,6 +213,13 @@ contact us with other suggestions.
      OpenEmbedded build system. If you are interested in using this type of
      interface to create images, see the :doc:`/toaster-manual/index`.
 
+   * **Discover the VSCode extension**: The `Yocto Project BitBake
+     <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__
+     extension for the Visual Studio Code IDE provides language features and
+     commands for working with the Yocto Project. If you are interested in using
+     this extension, visit its `marketplace page
+     <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__.
+
    * **Have Available the Yocto Project Reference Manual**: Unlike the rest of
      the Yocto Project manual set, this manual is comprised of material suited
      for reference rather than procedures. You can get build details, a closer
-- 
2.34.1


