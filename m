Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A747D74EE2
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 14:58:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69974.1769180305092227973
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 06:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1pcLDWmk;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 73EE64E42221
	for <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 14:58:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 499046070A
	for <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 14:58:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1AC7119A8547;
	Fri, 23 Jan 2026 15:58:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769180302; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KGDL8Tri+XFXdl/FkDG17qOugNyn3OdcXB0ZPdfmBGc=;
	b=1pcLDWmkw4WvUlNlNKTGcYzr7zCwbhgG6DGCDwGhN8kl4mrSI7xrMipJCBYK2o1Ejo80Q1
	4Mxaf/G66bXf4ARYTLk0PPb/RbUYOKptzjgeIHky8D9RTZXoKQXnF67Vj4BDm7gjVTClY+
	9W+ozJf7Ljad9MJd159uLNpLjEDh7t3SQEfXFm1KK3nIgin3ffR/Ov8WBGQj04cv0OWfvH
	DWln+H3SVC28neIpG4jfqqR5OyoNwFu7OXXShMHNz5kYnU8XCQNgH96Yw+l70/YPcdEIdh
	37Va1um8S52ogWcDWn8qQ956ADkpk7+UA6mkasRtEVa6czqVe6WMBS7AfLYJxA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 23 Jan 2026 15:58:11 +0100
Subject: [PATCH v3 1/5] ref-manual/terms.rst: refresh the Build Directory
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-terms-refresh-v3-1-41c35f0a6a13@bootlin.com>
References: <20260123-terms-refresh-v3-0-41c35f0a6a13@bootlin.com>
In-Reply-To: <20260123-terms-refresh-v3-0-41c35f0a6a13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4527;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ybka8j/Wa2/gbPJd80jLUxyeH8JiKn0o2HFMwHy9BHs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpc4yMHK2yaBwx+K9CUWi2PNhZRZb0TviT91RGx
 ki1tVYJgniJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXOMjAAKCRDRgEFAKaOo
 Nk7xD/9uHV5x2knWwFeoGsNISZXRu49Zf1PHJKkkHkcBM2dGES3ESYXbEsZzxfaJqPQI2mhnGzr
 Zr3Txtq16lQNTpKHKgzbPSRxaVTBVlX+mxdK7hSfwsvusbcEdiVubp7vSn3LjkihL9ctAQuuQNJ
 2pBFHT/Iaqylu+4elnvDGr6lPOuEcjOAn8PQCV4TXfrK3gvQyOTcR+qZ6u3lZZLqSVujyc4jhEt
 MicUWS1gXIy3KaKYRh4B3O0tkCjVmjcBN80XLMsnKS+d2kDhZzRA4w8k7boscA8Ee/pE6DRZU2P
 oBambpBpNQQ5P56ZlozWH1Vsg3eAUQdlk12UGM6eZVlPYcUibBbeL8EHxYfWbGd+OE5bQyyY+xF
 ydUq204DfGCgMIAYtZVf1qSlofTXf3QhiJ4WgkoE22r7RJp75x4NTopTGE15jbPrwKLvmObNRyV
 7+8rM8Sk+LhTl2Cc2+NGxtDbk6sOjsyARdU1cRdMBfDiNEd1eNlRKCTqSpcL6ReBhIS2bmynWgr
 tPjtnC1mgcn5T6KYAlHx1scI2PCJPkmc+5431CVRUzyf6FL4+P7XiZSXP7/i8kb4TFKaP8sYGIZ
 9ZXUO0TN5UxE/UBtQ4MmB5oLFOWjayc7VjE8zN34FZwz81aG+X1/cgJ7+2Envvi6CGIhRy3YWpx
 8H5OgCqbn6em7Ww==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 14:58:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8640

After the Poky repository obsolescence, refresh the build directory
definition. Fix the formatting and indenting issues while at it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 46 +++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 6a9f88061..fe68b41af 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -63,36 +63,39 @@ universal, the list includes them just in case:
       This term refers to the area used by the OpenEmbedded build system for
       builds. The area is created when you ``source`` the setup environment
       script that is found in the Source Directory
-      (i.e. :ref:`ref-manual/structure:``oe-init-build-env```). The
+      (i.e. :ref:`ref-manual/structure:``oe-init-build-env```, or
+      ``init-build-env`` when using :doc:`bitbake-setup
+      <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`). The
       :term:`TOPDIR` variable points to the :term:`Build Directory`.
 
-      You have a lot of flexibility when creating the :term:`Build Directory`.
+      When setting up the build manually (see :doc:`/dev-manual/poky-manual-setup`),
+      you have a lot of flexibility when creating the :term:`Build Directory`.
       Here are some examples that show how to create the directory.  The
-      examples assume your :term:`Source Directory` is named ``poky``:
+      examples assume your :term:`Source Directory` is named ``bitbake-builds``:
 
-         -  Create the :term:`Build Directory` inside your Source Directory and let
-            the name of the :term:`Build Directory` default to ``build``:
+      -  Create the :term:`Build Directory` inside your Source Directory and let
+         the name of the :term:`Build Directory` default to ``build``:
 
-            .. code-block:: shell
+         .. code-block:: console
 
-               $ cd poky
-               $ source oe-init-build-env
+            $ cd bitbake-builds
+            $ source layers/openembedded-core/oe-init-build-env
 
-         -  Create the :term:`Build Directory` inside your home directory and
-            specifically name it ``test-builds``:
+      -  Or provide a path to the :term:`Build Directory` when sourcing
+         ``oe-init-build-env``. Any intermediate folders in the pathname must
+         exist. This next example creates a :term:`Build Directory` named
+         ``YP-&DISTRO;`` within the existing directory ``mybuilds``:
 
-            .. code-block:: shell
+         .. code-block:: shell
 
-               $ source poky/oe-init-build-env test-builds
+            $ source bitbake-builds/layers/openembedded-core/oe-init-build-env mybuilds/YP-&DISTRO;
 
-         -  Provide a directory path and specifically name the
-            :term:`Build Directory`. Any intermediate folders in the pathname
-            must exist.  This next example creates a :term:`Build Directory`
-            named ``YP-&DISTRO;`` within the existing directory ``mybuilds``:
+         This path can also be an absolute path and be outside of the current
+         working directory:
 
-            .. code-block:: shell
+         .. code-block:: console
 
-               $ source poky/oe-init-build-env mybuilds/YP-&DISTRO;
+            $ source bitbake-builds/layers/openembedded-core/oe-init-build-env /opt/mybuilds/YP-&DISTRO;
 
       .. note::
 
@@ -100,9 +103,10 @@ universal, the list includes them just in case:
          temporary directory the build system uses for its work. :term:`TMPDIR` cannot
          be under NFS. Thus, by default, the :term:`Build Directory` cannot be under
          NFS. However, if you need the :term:`Build Directory` to be under NFS, you can
-         set this up by setting :term:`TMPDIR` in your ``local.conf`` file to use a local
-         drive. Doing so effectively separates :term:`TMPDIR` from :term:`TOPDIR`, which is the
-         :term:`Build Directory`.
+         set this up by setting :term:`TMPDIR` in your
+         :ref:`structure-build-conf-site.conf` file to use a local drive. Doing
+         so effectively separates :term:`TMPDIR` from :term:`TOPDIR`, which is
+         the :term:`Build Directory`.
 
    :term:`Build Host`
       The system used to build images in a Yocto Project Development

-- 
2.52.0


