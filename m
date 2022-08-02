Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6E1C3F6B0
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 08:38:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.3851.1659429506648180731
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Aug 2022 01:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Plbueht7;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id a11so6875241wmq.3
        for <docs@lists.yoctoproject.org>;
 Tue, 02 Aug 2022 01:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6efmuAW+w2eYvsD+YmBqaQOGbDAX8hFzzrYvSI9kBps=;
        b=Plbueht7BycumguY44QkSvs0lZ/IaUlI6WbbL8d3/LWgvoDCsFZx3AT08avqaD/8Bq
         sXWof/JljiZTkNEQhwFXZWawqOWWHAZjHdpLYfdzn0kPh7tEHZv+iQXzVanP+TuTKiAF
         hR9Jm+kQEYeupAXTLRkAZvtC90l2lKxBXnMibDDIrQTRKZ3W3vo+ojjgAT9LnbpVFEvB
         hp4klnG0/v7nRTh3Bu7CYZzb7TQzM69gWSCl86B93LrCam7xOdfqtZZ0mx4JNw665154
         CW3rlXQRWht2GcBroj1rSCbU4ePaWP4xkDl4NvbxMXy1SnWlRQ3fC0N6FOCpcl4D/0e7
         K3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6efmuAW+w2eYvsD+YmBqaQOGbDAX8hFzzrYvSI9kBps=;
        b=wCxWZIjP3o2g1fhInqnuXP0cafnxQmiLiqJQ3D5PTuvfYgQdkx5k9rfGviWF8wpf6L
         vlQ94YIyhjGV6dHnTRHRor9RATUCZIQOHqw/XWGQTWPke2RekWQdnElnDScKj4O8rZM5
         9eTZEOxZF0WvPfXgVirUyEHFLD5YmrA0A1UUWc5V+54rlawFrst4CHJBljb75WwdA88W
         J6y14OhQgEii26pq2kI8RDXtj/Um6F8vgHWqNW9KuWZqnjIb66MGZNYyuQl7tX8jqbre
         3pH0G+dgUzd8mC5C23x9MPiRE8BUh29h3WCz0WOiJ7YW/4QVzMmMassgsmqdzNdvBylA
         qqzg==
X-Gm-Message-State: AJIora90jJYiSDaeHS0UFqFWZrrUfTmaZyvzxuRzxSlNIWpopJuBfc6B
	04nhJ5JjK1K0pgbCEunmGke4dgHkcM8=
X-Google-Smtp-Source: 
 AGRyM1uM0i/ntO1/koRHbd9ark80JpJqvB8jscOyvhKLDpuLNqR5s3YkpQZSLN9dnf3ffqZbYRk3eA==
X-Received: by 2002:a05:600c:3d09:b0:3a3:1969:b0e with SMTP id
 bh9-20020a05600c3d0900b003a319690b0emr13389561wmb.72.1659429504697;
        Tue, 02 Aug 2022 01:38:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c19cd00b003a2e1883a27sm28092350wmq.18.2022.08.02.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 01:38:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] sdk-manual: describe how to use extensible SDK
 functionality directly in a Yocto build
Date: Tue,  2 Aug 2022 10:38:03 +0200
Message-Id: <20220802083803.2773818-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802083803.2773818-1-alex@linutronix.de>
References: <20220802083803.2773818-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Aug 2022 08:38:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3102

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sdk-manual/appendix-customizing.rst       | 14 ++--
 documentation/sdk-manual/appendix-obtain.rst  | 18 +++++-
 documentation/sdk-manual/extensible.rst       | 64 ++++++++++++++++++-
 documentation/sdk-manual/working-projects.rst |  8 +++
 4 files changed, 96 insertions(+), 8 deletions(-)

diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 9a76cc59d..23a437eb9 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -1,11 +1,17 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-******************************
-Customizing the Extensible SDK
-******************************
+***************************************************
+Customizing the Extensible SDK standalone installer
+***************************************************
 
 This appendix describes customizations you can apply to the extensible
-SDK.
+SDK when using in the standalone installer version.
+
+.. note::
+
+   It is also possible to use the Extensible SDK functionality directly in a
+   Yocto build, avoiding separate installer artefacts. Please refer to
+   ":ref:`sdk-manual/extensible:Installing the Extensible SDK`"
 
 Configuring the Extensible SDK
 ==============================
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index ece378c75..9b7717a4c 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -4,8 +4,22 @@
 Obtaining the SDK
 *****************
 
+Working with the SDK components directly in a Yocto build
+=========================================================
+
+Please refer to section
+":ref:`sdk-manual/extensible:Setting up the Extensible SDK environment directly in a Yocto build`"
+
+Note that to use this feature effectively either a powerful build
+machine, or a well-functioning sstate cache infrastructure is required:
+otherwise significant time could be spent waiting for components to be built
+by bitbake from source code.
+
+Working with standalone SDK Installers
+======================================
+
 Locating Pre-Built SDK Installers
-=================================
+---------------------------------
 
 You can use existing, pre-built toolchains by locating and running an
 SDK installer script that ships with the Yocto Project. Using this
@@ -72,7 +86,7 @@ Follow these steps to locate and hand-install the toolchain:
    section for more information.
 
 Building an SDK Installer
-=========================
+-------------------------
 
 As an alternative to locating and downloading an SDK installer, you can
 build the SDK installer. Follow these steps:
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index ed9e43a2d..ae0587fec 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -41,6 +41,42 @@ functionality.
 Installing the Extensible SDK
 =============================
 
+Two ways to install the Extensible SDK
+--------------------------------------
+
+Extensible SDK can be installed in two different ways, and both have
+their own pros and cons:
+
+1. *Setting up the Extensible SDK environment directly in a Yocto build*. This
+avoids having to produce, test, distribute and maintain separate SDK installer
+archives, which can get very large. There is only one environment for the regular
+yocto build and the SDK and less code paths where things can go not according to plan.
+It's easier to update the SDK: it simply means updating the yocto layers with
+git fetch or layer management tooling. The SDK extensibility is better than in the
+second option: just run ``bitbake`` again to add more things to the sysroot, or add layers
+if even more things are required.
+
+2. *Setting up the Extensible SDK from a standalone installer*. This has the benefit of
+having a single, self-contained archive that includes all the needed binary artifacts.
+So nothing needs to be rebuild, and there is no need to provide a well-functioning
+binary artefact cache over the network for developers with underpowered laptops.
+
+Setting up the Extensible SDK environment directly in a Yocto build
+-------------------------------------------------------------------
+
+1. Set up all the needed layers and a yocto build directory, e.g. a regular yocto
+   build where ``bitbake`` can be executed.
+
+2. Run:
+    $ bitbake meta-ide-support
+    $ bitbake -c populate_sysroot gtk+3
+    (or any other target or native item that the application developer would need)
+    $ bitbake populate-sysroots
+
+
+Setting up the Extensible SDK from a standalone installer
+---------------------------------------------------------
+
 The first thing you need to do is install the SDK on your :term:`Build
 Host` by running the ``*.sh`` installation script.
 
@@ -136,7 +172,12 @@ Running the Extensible SDK Environment Setup Script
 ===================================================
 
 Once you have the SDK installed, you must run the SDK environment setup
-script before you can actually use the SDK. This setup script resides in
+script before you can actually use the SDK.
+
+When using a SDK directly in a Yocto build, you will find the script in
+``tmp/deploy/images/qemux86-64/`` in your build directory.
+
+When using a standalone SDK installer, this setup script resides in
 the directory you chose when you installed the SDK, which is either the
 default ``poky_sdk`` directory or the directory you chose during
 installation.
@@ -154,6 +195,11 @@ script is for an IA-based target machine using i586 tuning::
    SDK environment now set up; additionally you may now run devtool to perform development tasks.
    Run devtool --help for further details.
 
+When using the environment script directly in a Yocto build, it can
+be run similarly:
+
+   $ source tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux
+
 Running the setup script defines many environment variables needed in
 order to use the SDK (e.g. ``PATH``,
 :term:`CC`,
@@ -1215,10 +1261,24 @@ need to link to libGL but you are not sure which recipe provides libGL.
 You can use the following command to find out::
 
    $ devtool search libGL mesa
+   A free implementation of the OpenGL API
 
-A free implementation of the OpenGL API Once you know the recipe
+Once you know the recipe
 (i.e. ``mesa`` in this example), you can install it::
 
+When using the extensible SDK directly in a Yocto build
+-------------------------------------------------------
+
+In this scenario, the Yocto build tooling, e.g. ``bitbake``
+is directly accessible to build additional items, and it
+can simply be executed directly:
+
+   $ bitbake mesa
+   $ bitbake populate-sysroots
+
+When using a standalone installer for the Extensible SDK
+--------------------------------------------------------
+
    $ devtool sdk-install mesa
 
 By default, the ``devtool sdk-install`` command assumes
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index 7f8d9b849..12cb2efee 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -88,6 +88,10 @@ project:
 
       $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
+   Another example is sourcing the environment setup directly in a yocto
+   build::
+      $ source tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux
+
 3. *Create the configure Script:* Use the ``autoreconf`` command to
    generate the ``configure`` script.
    ::
@@ -279,6 +283,10 @@ example:
 
       $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
+   Another example is sourcing the environment setup directly in a yocto
+   build::
+      $ source tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux
+
 3. *Create the Makefile:* For this example, the Makefile contains
    two lines that can be used to set the :term:`CC` variable. One line is
    identical to the value that is set when you run the SDK environment
-- 
2.30.2


