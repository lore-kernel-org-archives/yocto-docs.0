Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4FEFA3745
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 11:39:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.5366.1666870790628025125
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 04:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jOgqQRYh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3B52FFF805;
	Thu, 27 Oct 2022 11:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666870788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dv60TlF5fNp0Kvt4A9qh/LGOCXNVmzPR2/YxBH3U/4Q=;
	b=jOgqQRYhxCKktbdZtzMB1+fEDupL5VmFIELLciPb/8Iq8+SC7FjncMxe1RSovRbItwi0Lm
	rnbGOSRRUDPWJ6WA3kK2HRgnwtO0ht6oPN4CjGO9JflgYcZVU2kyA3tnzzFZENOGqQOeEw
	1f66AI5cZZ3/Nwzsnz11kzfeZDe/J7a4tvYsk3rpdB83qywD4XN+Mb/IN/gTyJ1p6pspfP
	giX1d29etOfNv7G1e7M4rwJEYfnhrMukBhnM9Y/vGtwuz9AmflI56+FF5B+ZaQeOIdWzji
	Aw8kRoanGiQ2N9ZrOktXJ53EZKvszyWoHtAjxyANsgZPD/pNI/5uA7r33upFrA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/3] manuals: replace "_" by "__" in external links
Date: Thu, 27 Oct 2022 13:39:40 +0200
Message-Id: <20221027113941.34972-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027113941.34972-1-michael.opdenacker@bootlin.com>
References: <20221027113941.34972-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Oct 2022 11:39:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3426

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/boilerplate.rst                     | 2 +-
 documentation/dev-manual/common-tasks.rst         | 5 ++---
 documentation/ref-manual/classes.rst              | 4 ++--
 documentation/ref-manual/terms.rst                | 6 +++---
 documentation/ref-manual/variables.rst            | 6 +++---
 documentation/test-manual/reproducible-builds.rst | 2 +-
 6 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/documentation/boilerplate.rst b/documentation/boilerplate.rst
index 9b64d91efd..ad7bb64956 100644
--- a/documentation/boilerplate.rst
+++ b/documentation/boilerplate.rst
@@ -8,7 +8,7 @@
 
 Permission is granted to copy, distribute and/or modify this document under the
 terms of the `Creative Commons Attribution-Share Alike 2.0 UK: England & Wales
-<https://creativecommons.org/licenses/by-sa/2.0/uk/>`_ as published by Creative
+<https://creativecommons.org/licenses/by-sa/2.0/uk/>`__ as published by Creative
 Commons.
 
 To report any inaccuracies or problems with this (or any other Yocto Project)
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 53e7686633..c3defa0766 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -7547,9 +7547,8 @@ NPM packages:
 -  Of the two methods that you can use ``devtool`` to create NPM
    packages, the registry approach is slightly simpler. However, you
    might consider the project approach because you do not have to
-   publish your module in the NPM registry
-   (`npm-registry <https://docs.npmjs.com/misc/registry>`_), which
-   is NPM's public registry.
+   publish your module in the `NPM registry <https://docs.npmjs.com/misc/registry>`__,
+   which is NPM's public registry.
 
 -  Be familiar with
    :doc:`devtool </ref-manual/devtool-reference>`.
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 1880e44486..a1c563f308 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1738,7 +1738,7 @@ is supported by ``overlayfs``. This has to be done in your machine configuration
   * QA checks fail to catch file existence if you redefine this variable in your recipe!
   * Only the existence of the systemd mount unit file is checked, not its contents.
   * To get more details on ``overlayfs``, its internals and supported operations, please refer
-    to the official documentation of the `Linux kernel <https://www.kernel.org/doc/html/latest/filesystems/overlayfs.html>`_.
+    to the official documentation of the `Linux kernel <https://www.kernel.org/doc/html/latest/filesystems/overlayfs.html>`__.
 
 The class assumes you have a ``data.mount`` systemd unit defined elsewhere in your BSP
 (e.g. in ``systemd-machine-units`` recipe) and it's installed into the image.
@@ -2485,7 +2485,7 @@ build systems based on ``setuptools`` (e.g. only have a ``setup.py`` and have
 not migrated to the official ``pyproject.toml`` format). Unlike
 ``setuptools3.bbclass``, this uses the traditional ``setup.py`` ``build`` and
 ``install`` commands and not wheels. This use of ``setuptools`` like this is
-`deprecated <https://github.com/pypa/setuptools/blob/main/CHANGES.rst#v5830>`_
+`deprecated <https://github.com/pypa/setuptools/blob/main/CHANGES.rst#v5830>`__
 but still relatively common.
 
 .. _ref-classes-setuptools3-base:
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 1e3f718a8f..1a2c055591 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -139,12 +139,12 @@ universal, the list includes them just in case:
       be included independently in your project's ``bblayers.conf`` file.
 
       In some cases, such as with OpenEmbedded's
-      `meta-openembedded <https://github.com/openembedded/meta-openembedded>`_
+      `meta-openembedded <https://github.com/openembedded/meta-openembedded>`__
       layer, the top level ``meta-openembedded/`` directory is not itself an actual layer,
       so you would never explicitly include it in a ``bblayers.conf`` file;
       rather, you would include any number of its layer subdirectories, such as
-      `meta-openembedded/meta-oe <https://github.com/openembedded/meta-openembedded/tree/master/meta-oe>`_,
-      `meta-openembedded/meta-python <https://github.com/openembedded/meta-openembedded/tree/master/meta-python>`_
+      `meta-openembedded/meta-oe <https://github.com/openembedded/meta-openembedded/tree/master/meta-oe>`__,
+      `meta-openembedded/meta-python <https://github.com/openembedded/meta-openembedded/tree/master/meta-python>`__
       and so on.
 
       On the other hand, some container layers (such as
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 71e8c272a7..59882fb158 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -615,7 +615,7 @@ system and gives an overview of their function and contents.
       software.
 
       When specifying recipe files, you can pattern match using Python's
-      `glob <https://docs.python.org/3/library/glob.html>`_ syntax.
+      `glob <https://docs.python.org/3/library/glob.html>`__ syntax.
       For details on the syntax, see the documentation by following the
       previous link.
 
@@ -2481,7 +2481,7 @@ system and gives an overview of their function and contents.
 
          -  When specifying files or paths, you can pattern match using
             Python's
-            `glob <https://docs.python.org/3/library/glob.html>`_
+            `glob <https://docs.python.org/3/library/glob.html>`__
             syntax. For details on the syntax, see the documentation by
             following the previous link.
 
@@ -4943,7 +4943,7 @@ system and gives an overview of their function and contents.
       See the :term:`KERNEL_MODULE_AUTOLOAD` variable for more information.
 
    :term:`module_conf`
-      Specifies `modprobe.d <https://linux.die.net/man/5/modprobe.d>`_
+      Specifies `modprobe.d <https://linux.die.net/man/5/modprobe.d>`__
       syntax lines for inclusion in the ``/etc/modprobe.d/modname.conf``
       file.
 
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 5977366c9e..61127de23c 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -19,7 +19,7 @@ Why it matters
 ==============
 
 The project aligns with the `Reproducible Builds project
-<https://reproducible-builds.org/>`_, which shares information about why
+<https://reproducible-builds.org/>`__, which shares information about why
 reproducibility matters. The primary focus of the project is the ability to
 detect security issues being introduced. However, from a Yocto Project
 perspective, it is also hugely important that our builds are deterministic. When
-- 
2.34.1


