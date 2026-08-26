Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AFDC61DCD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:35:32 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3410.1787708130371395563
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MOvv1yAu;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93738ebbffaso18814585a.3
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787708129; x=1788312929; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fS/1OV4fdZSl2PLqyxVSTNSK7b7Z05if4PVmnbK+i2s=;
        b=MOvv1yAuPuVVRJ1IS1v1KmUFn5hSDfOb4IVISTpIm7KPT6l6EqnXEhI9TmjIaj/wYR
         PD2J+Wfze8tAYg+el22m+QlYDmzKdoXS/tjpugyC962z8DDPF5xiuT9C6/Z4jnBRlibq
         BbqHIbGYta9m4nfkQy90huznZCpkPKe+j7IMbVJxCgvW5KgSYo0ZPw4h7oyjrVy8Vxf8
         MJPPeDxrBCoQ1SP/Dh936g4KoRtSIeiIoETZGxil1RO3ySU0ihHCdnPvsbPXnQDElqhB
         KhSc7MZunc97QOTva6gdexORHfmmTot2B7514XOoyKXhcFZuiAmrgcGx6VSJwc/lUqF1
         Qvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708129; x=1788312929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fS/1OV4fdZSl2PLqyxVSTNSK7b7Z05if4PVmnbK+i2s=;
        b=G98vcD9EkNbnAd8430PySEFepcbAp6zyBu4RpZDClwGa4qb0TPS24zVCR9EuvmHynA
         tg1DYiU79432Jm1ncUuEOQJnqNt6i2R9+GDFrNfb4zdpznUaJ0WI9VIuQYF40vJdWe1A
         qQ751dwmCMKJzfOSDGpV/GdTT5TelWfRwzpKIaGyqZN+JH64FF2c9mkZeet210BT42w0
         kjacmzgFOgass6F+WvSo21BwPDltYX7JRU2RBOUz2hnuNMUq2VFrJSrezBqKIsy0Hdq2
         7Z4SorYYA8Zeb2E1LMYguzTozzGvHkvGiU6bjVhZMLaplpCUAkMQseehQYtZbQoWhM5h
         OUaA==
X-Gm-Message-State: AFuF++lF2Aq0UUT78Fh+ELtatPxp0auxm2xS1WtsWXJpIvS3yaw+UiV2
	6lLzMo+B+wLg/xnYJrNCTWjCkF/P1gZkZrD7Y3Icb+ISYaJr+Ypj0LP4vtWnRuRv
X-Gm-Gg: AR+sD107lniySGlSVcmq8RYSKJmzk4t1tlktM86jYYcX4jXYYjHzRO7s7iDLYmHYbf9
	t/YrjrT4+r+eQlA87jOlXfwUTRCWxQ4WEZYvm2DRSn4O8G7WQOyk+Si4n04OlwkmhpZLkdpLsVd
	Ko/K7//d3nkRtDXmqEk3H+ijrn/JA/ArMK4fYB9zoQuTAkgBOu0jS8E0DNidwxMJSx8RSxiYtPA
	7U6g55K0BErYIHidx/FUVf8LJqJz3xI4E5uPZ4WMIxP9ZgMmZS8OLOA7N6OHIfLbUFo8AtMyhp4
	FNfQIZxwoG+L/X5uSp7wAWCD+J0iwC4RCcXp84Ov4EauGHrVvu4FM37UWkG5rKAk0ElVW05zlib
	kDusI//LB5po8lH0nhEylY3vHQwxu/o3LH2a9UeZAm82sVG6l8VPaR1FEkAz1XFev4L7AhXondV
	RfAhkY86svNgE6mqva8P2R0iOQJ5I/4awG/TYCdUJYQ9zz3tzxTWi2E3vX/S1Ah4uhxqjy3AhHM
	1P1SL1tZQ6GLgveOEgyEIfZlHI8QgQ=
X-Received: by 2002:a05:620a:346:b0:936:9525:e952 with SMTP id af79cd13be357-9378045c672mr244263985a.41.1787708129149;
        Tue, 25 Aug 2026 18:35:29 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e68053dsm104323785a.39.2026.08.25.18.35.26
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:35:26 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 10/10] docs-wide: use the bitbake code-block language
Date: Tue, 25 Aug 2026 21:34:55 -0400
Message-ID: <20260826013502.2674000-11-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260826013502.2674000-1-twoerner@gmail.com>
References: <20260826013502.2674000-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:35:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10355

BitBake snippets here render as unhighlighted text. A reStructuredText
literal block carries no language, and Sphinx falls back to a default
that cannot recognise BitBake metadata.

Pygments 2.21 added a BitBake lexer, so tag these 19 blocks
explicitly. Variable names, assignment operators, override chains,
expansions and shell or Python task bodies are then highlighted.

Blocks that only look like BitBake are left alone, as are blocks
already tagged "none" where the content is deliberately unhighlighted.

This covers the remaining manuals, each with only a handful of snippets.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/brief-yoctoprojectqs/index.rst  |  4 ++-
 documentation/bsp-manual/bsp.rst              | 28 ++++++++++++++-----
 .../contributor-guide/recipe-style-guide.rst  | 24 ++++++++++++----
 documentation/profile-manual/intro.rst        | 16 ++++++++---
 4 files changed, 54 insertions(+), 18 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 4adec9714f2f..2dccff16c995 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -410,7 +410,9 @@ layer>`:
     `Synaptics` license. See the :yocto_git:`ipcompliance.md
     </meta-raspberrypi/tree/docs/ipcompliance.md>` document for more information.
     Add the ``synaptics-killswitch`` value to the :term:`LICENSE_FLAGS_ACCEPTED`
-    variable, in the ``conf/local.conf`` file of your build directory::
+    variable, in the ``conf/local.conf`` file of your build directory:
+
+    .. code-block:: bitbake
 
        LICENSE_FLAGS_ACCEPTED = "synaptics-killswitch"
 
diff --git a/documentation/bsp-manual/bsp.rst b/documentation/bsp-manual/bsp.rst
index 168d64e6ed5a..030464b74283 100644
--- a/documentation/bsp-manual/bsp.rst
+++ b/documentation/bsp-manual/bsp.rst
@@ -84,7 +84,9 @@ established after you run the OpenEmbedded build environment setup
 script (i.e. :ref:`structure-core-script`).
 Adding the root directory allows the :term:`OpenEmbedded Build System`
 to recognize the BSP
-layer and from it build an image. Here is an example::
+layer and from it build an image. Here is an example:
+
+.. code-block:: bitbake
 
    BBLAYERS ?= " \
       /usr/local/src/yocto/meta \
@@ -112,7 +114,9 @@ are known as ":term:`container layers <Container Layer>`". An example of
 this type of layer is OpenEmbedded's :oe_git:`meta-openembedded </meta-openembedded>`
 layer. The ``meta-openembedded`` layer contains many ``meta-*`` layers.
 In cases like this, you need to include the names of the actual layers
-you want to work with, such as::
+you want to work with, such as:
+
+.. code-block:: bitbake
 
    BBLAYERS ?= " \
      /usr/local/src/yocto/meta \
@@ -603,7 +607,9 @@ For example, many ``tune-*`` files (e.g. ``tune-arm1136jf-s.inc``,
 
 To use an include file, you simply include them in the machine
 configuration file. For example, the Raspberry Pi BSP
-``raspberrypi3.conf`` contains the following statement::
+``raspberrypi3.conf`` contains the following statement:
+
+.. code-block:: bitbake
 
    include conf/machine/include/rpi-base.inc
 
@@ -674,7 +680,9 @@ Suppose you are using the ``linux-yocto_6.12.bb`` recipe to build the
 kernel. In other words, you have selected the kernel in your
 ``"bsp_root_name".conf`` file by adding
 :term:`PREFERRED_PROVIDER` and :term:`PREFERRED_VERSION`
-statements as follows::
+statements as follows:
+
+.. code-block:: bitbake
 
    PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
    PREFERRED_VERSION_linux-yocto ?= "6.12%"
@@ -1027,7 +1035,9 @@ BSP-specific configuration file named ``interfaces`` to the
 also supports several other machines:
 
 #. Edit the ``init-ifupdown_1.0.bbappend`` file so that it contains the
-   following::
+   following:
+
+   .. code-block:: bitbake
 
       FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
@@ -1383,7 +1393,9 @@ BSP Kernel Recipe Example
 -------------------------
 
 The kernel recipe used to build the kernel image for the BeagleBone
-device was established in the machine configuration::
+device was established in the machine configuration:
+
+.. code-block:: bitbake
 
    PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
    PREFERRED_VERSION_linux-yocto ?= "6.18%"
@@ -1394,7 +1406,9 @@ metadata used to build the kernel. In this case, a kernel append file
 kernel recipe (i.e. ``linux-yocto_6.18.bb``), which is located in
 :oe_git:`/openembedded-core/tree/meta/recipes-kernel/linux`.
 
-The contents of the append file are::
+The contents of the append file are:
+
+.. code-block:: bitbake
 
    COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
    COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 84c6bb14e8b0..7cd3385787ee 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -48,7 +48,9 @@ Debian policy closely.
 When a recipe references a git revision that does not correspond to a released
 version of software (e.g. is not a tagged version), the :term:`PV` variable
 should include the sign ``+``, so :term:`bitbake` automatically includes package
-version information during the packaging phase::
+version information during the packaging phase:
+
+.. code-block:: bitbake
 
     PV = "<version>+git"
 
@@ -95,13 +97,17 @@ Variable Formatting
 
 -  When splitting a long variable over multiple lines, all continuation lines
    should be indented (with spaces) to align with the start of the quote on the
-   first line::
+   first line:
+
+   .. code-block:: bitbake
 
        FOO = "this line is \
               long \
               "
 
-   Instead of::
+   Instead of:
+
+   .. code-block:: bitbake
 
        FOO = "this line is \
        long \
@@ -190,7 +196,9 @@ used tasks this would be:
 
 Custom tasks should be sorted similarly.
 
-Package specific variables are typically grouped together, e.g.::
+Package specific variables are typically grouped together, e.g.:
+
+.. code-block:: bitbake
 
     RDEPENDS:${PN} = "foo"
     RDEPENDS:${PN}-libs = "bar"
@@ -211,7 +219,9 @@ Recipes need to define both the :term:`LICENSE` and
    include ``COPYING``, :term:`LICENSE`, and ``README`` files. You could
    also find the information near the top of a source file. For example,
    given a piece of software licensed under the GNU General Public
-   License version 2, you would set :term:`LICENSE` as follows::
+   License version 2, you would set :term:`LICENSE` as follows:
+
+   .. code-block:: bitbake
 
       LICENSE = "GPL-2.0-only"
 
@@ -255,7 +265,9 @@ Recipes need to define both the :term:`LICENSE` and
    See the ":ref:`dev-manual/new-recipe:fetching code`" section for
    additional information.
 
-   Here is an example that assumes the software has a ``COPYING`` file::
+   Here is an example that assumes the software has a ``COPYING`` file:
+
+   .. code-block:: bitbake
 
       LIC_FILES_CHKSUM = "file://COPYING;md5=xxx"
 
diff --git a/documentation/profile-manual/intro.rst b/documentation/profile-manual/intro.rst
index 31791255246e..24bbc952c9bd 100644
--- a/documentation/profile-manual/intro.rst
+++ b/documentation/profile-manual/intro.rst
@@ -41,7 +41,9 @@ an ``sdk`` image, perhaps one of::
    $ bitbake core-image-rt-sdk
 
 Alternatively,  you can add ``tools-profile`` to the :term:`EXTRA_IMAGE_FEATURES` line in
-your ``local.conf`` file::
+your ``local.conf`` file:
+
+.. code-block:: bitbake
 
    EXTRA_IMAGE_FEATURES:append = " tools-profile"
 
@@ -57,7 +59,9 @@ the tracing and profiling tools will be included in non-sdk images as well e.g.:
 
    You can prevent that by setting the
    :term:`INHIBIT_PACKAGE_STRIP`
-   variable to "1" in your ``local.conf`` when you build the image::
+   variable to "1" in your ``local.conf`` when you build the image:
+
+   .. code-block:: bitbake
 
       INHIBIT_PACKAGE_STRIP = "1"
 
@@ -67,11 +71,15 @@ If you've already built a stripped image, you can generate debug
 packages (xxx-dbg) which you can manually install as needed.
 
 To generate debug info for packages, you can add ``dbg-pkgs`` to
-:term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example::
+:term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example:
+
+.. code-block:: bitbake
 
    EXTRA_IMAGE_FEATURES:append = " dbg-pkgs"
 
 Additionally, in order to generate the right type of debug info, we also need to
-set :term:`PACKAGE_DEBUG_SPLIT_STYLE` in the ``local.conf`` file::
+set :term:`PACKAGE_DEBUG_SPLIT_STYLE` in the ``local.conf`` file:
+
+.. code-block:: bitbake
 
    PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'

