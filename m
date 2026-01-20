Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CFBD2ED1B
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:17:17 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8792.1768922232876878230
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZI9k20Ts;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5DD894E421AE
	for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:17:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 338BB606AB
	for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:17:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AF9110B6B4FB;
	Tue, 20 Jan 2026 16:17:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768922230; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mJrqtodLdku80BaQYQ21y+mmP8ndksLtj8+KZGovCGo=;
	b=ZI9k20Ts3MRoqDd0L8PSoYC/v3l79CWWvzIxz5FtbXDE0px7mim0yc1Lo4axZj0R37vnxy
	in0DSffG3z4xd0JK1OY1vhu4kBVIJJxjQqRdXI3dZHxvK1G5B0aTtXJkofSTQT30r5FnXY
	tVs51Yg5d2j2/7fAkTdfYz2DBoj4nKjH7OWyFhtu5QkJSMy9wq01Tc9K+ZmEGPA/K0d0KS
	4WKgNa5ed5lNp20MJvo5+8VcWrT47bykvM5TP/VJY/uDCpKBlQZJhNEUclmrmBTQrgRgwc
	UiWyPrS05sZksWxBjASAcXdQXaykMlT1TShda+67bHqA6amQG9B0Nv+QzGxz9A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 20 Jan 2026 16:17:00 +0100
Subject: [PATCH v2 1/5] ref-manual/terms.rst: refresh the Build Directory
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-terms-refresh-v2-1-fa49d15b209f@bootlin.com>
References: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
In-Reply-To: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4509;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=sVktb6+iylFKBuUGcpgujo8T3WgjkeNMwxB5eFOaT9w=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpb5x0zLtjtn3Uz37z8Gxx/y4bRbDDzIxz25fbb
 2dHeLjUTpeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaW+cdAAKCRDRgEFAKaOo
 NpMWEADKNPgnjTmSU3BUv20VFC1cfLaUSFn3H6xPEcbvBV2VIOKtoT5G0R2ehzWKGD8Hd137qyz
 YPPB8KQYdBXldzSu0ji2VS3/hiw+c8ryMuxUKLcj4QIynUWlVuwg0zb9maaZmGyB9jXFMKHjXi0
 cf3M8D8oXjioVVeqlzqaHvgl9+VWdtcHfQGEWR1CDg2Fw6ejFifmdY9tImMf4xx4Cv3bp4XLbZB
 XscrYxy2tSF5KapwTpihGM1oSYtr44+h2m+K8NMxRUg4LFOby5Vd+EprjXOugGjWE4RQQXEw04o
 mwh6oDzFs2W6t6LdXJGVygUC0r2Jbrv/VAO+sQ5URt3XFxZ/KLyQXUpBn1i02MPTNRdhHa9Zz0y
 f4IMySFgx9sfTUmYZqHTSqJDEA8NjuEmfEn2wmG2sxWx77hrYiPRPBYsWTm7rlL2YwS0rxrnzva
 7cmiPy3lq1RwLNNt+pllMJ5xyUKT9aq7xu3J0AtdhEG3ek8mke7bPqTLjNvEqBoJvbZUL40lShB
 9EkCKdnAyoU685wn8cVdvpCCfqwSO6xx8Ws06MjMeyKf+ZqNu8MbiN82X9pR+KQ4xwiGnwOZ1wk
 l4113Lj9JeTWXhyMIhw+Hw5ALbhhspaGNbSO1LX6OOMW0NWms1itXItdirRV5xefFzrW1ojuhBp
 7/uQ1bsyXpmoNsg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:17:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8594

After the Poky repository obsolescence, refresh the build directory
definition. Fix the formatting and indenting issues while at it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 46 +++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 6a9f88061..93a2febc7 100644
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
+      examples assume your :term:`Source Directory` is named ``project``:
 
-         -  Create the :term:`Build Directory` inside your Source Directory and let
-            the name of the :term:`Build Directory` default to ``build``:
+      -  Create the :term:`Build Directory` inside your Source Directory and let
+         the name of the :term:`Build Directory` default to ``build``:
 
-            .. code-block:: shell
+         .. code-block:: console
 
-               $ cd poky
-               $ source oe-init-build-env
+            $ cd project
+            $ source layers/openembedded-core/oe-init-build-env
 
-         -  Create the :term:`Build Directory` inside your home directory and
-            specifically name it ``test-builds``:
+      -  Or create the :term:`Build Directory` inside your current working
+         directory and specifically name it ``test-builds``:
 
-            .. code-block:: shell
+         .. code-block:: console
 
-               $ source poky/oe-init-build-env test-builds
+            $ source project/layers/openembedded-core/oe-init-build-env test-builds
 
-         -  Provide a directory path and specifically name the
-            :term:`Build Directory`. Any intermediate folders in the pathname
-            must exist.  This next example creates a :term:`Build Directory`
-            named ``YP-&DISTRO;`` within the existing directory ``mybuilds``:
+      -  Or provide a directory path and specifically name the
+         :term:`Build Directory`. Any intermediate folders in the pathname
+         must exist.  This next example creates a :term:`Build Directory`
+         named ``YP-&DISTRO;`` within the existing directory ``mybuilds``:
 
-            .. code-block:: shell
+         .. code-block:: shell
 
-               $ source poky/oe-init-build-env mybuilds/YP-&DISTRO;
+            $ source project/layers/openembedded-core/oe-init-build-env mybuilds/YP-&DISTRO;
 
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


