Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41BFE776C3
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:24:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123569.1766593484392597218
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JojSU2rY;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DA6F71A23E1
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B1E846073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C78310AB12F3;
	Wed, 24 Dec 2025 17:24:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593482; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s63xbhhn6yaKjxoCFqVDY6i+2BKDpidG2ePugl4G5zY=;
	b=JojSU2rYW6MEImUMfSweYiv11wnMKcZ8bMQrmiiAS+JJowma3ahEiRVtZz7zHavkChKtPh
	JW3jM45rzuh8YChS1aOIWuVYINrvWN3BzlCFLg9KgQH3RLKhazlAfzTv+9e2e3Dzaac9E8
	GwnSIO5ZcyiDod4K8oiNQLZV08575tFNmXIsylBJFYe5U/NXfcdgarjxlJhw4zRgHnrZKL
	rkvykqAnaVXhmrAyXtS1rTOPSwySLoyRTCJS0wjRbM3rVtaYFYvcvPw5DCjoJ9d9VpVCUf
	UU8nkLS0qSAQF+R49ZNCp22ZX0eAM7WyL7o2Qojs54C6CitPrN5zp7J+hLyeYg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:24:16 +0100
Subject: [PATCH 1/5] ref-manual/terms.rst: refresh the Build Directory
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-terms-refresh-v1-1-691329fd038f@bootlin.com>
References: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
In-Reply-To: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4492;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tjUhkUks3VSzRdpA0ny7RzDmY41+YK1sNBSUkfzh8gI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBPHATQ6/G1iG3cebgX699IAvJ4rLNadUcRua
 ti/Tu2Qjx6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwTxwAKCRDRgEFAKaOo
 NtvSEADA0/nTik2g3d7ZFjwMVDxECeZzqZsMTVRkHUx/FAMfcgfRyM7faVR7hfNrzD4coPFhvub
 1l4tOIE2k8tKnhRePMB2nKdGy5/F+3IqHuDa4Jw+Pu/A44yDTmVg+GY5zzkXqIaFuZywGiMwA7N
 BkQJQyrkPenS/blXApkspbhNfeJQHgR4JUsETp/xwkEfK+9urlXeX6SAVzmbMWslTBN7QhCSGbN
 j9rT0ZKy6TC+tU8F6RawXUT+BXs/D5NIHMvBa9kgEtEedIXqEpM7RZ5jfuOPeX2gIzKidNXIYrm
 S9625PF0nBtI8StroXm6/2YGNg2fou92Irx3DRBUHITTkTeSNlA6n8qY8Lc8XR+Nsdi3gnG+zNt
 uqqv/s0eeLYnuNdgjf+lUTivhs+vMV9mikQAUgUVIv5QZm3CF27vXZVEzwZxWUpLkFaqNzcqGaN
 q1DtTWPlcdSr9J+M4ili0QOUhwu0yKh6rGJxfJFhSy9FY+ZNszfqwPfyhAj96E1QW37qJ+nt4xn
 6Gr7rnaVnx8OCgLCF5eDN0jWiBRSoQcTZdi2D5o37CJ+X/9/0dmjfN8A90aNHyflqwQRJ3yRg93
 0Cwokl272zwqM9sX1ZMddFIVUKIOGRIDU7MgJY4mdLwEzwgDi4CBgZL/uEx9E2usg3/GDgnmBQq
 pJOd9/KaQAqS2/g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8323

After the Poky repository obsolescence, refresh the build directory
definition. Fix the formatting and indenting issues while at it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 46 +++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 6a9f88061..4b9b6ed88 100644
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
+      -  Create the :term:`Build Directory` inside your home directory and
+         specifically name it ``test-builds``:
 
-            .. code-block:: shell
+         .. code-block:: console
 
-               $ source poky/oe-init-build-env test-builds
+            $ source project/layers/openembedded-core/oe-init-build-env test-builds
 
-         -  Provide a directory path and specifically name the
-            :term:`Build Directory`. Any intermediate folders in the pathname
-            must exist.  This next example creates a :term:`Build Directory`
-            named ``YP-&DISTRO;`` within the existing directory ``mybuilds``:
+      -  Provide a directory path and specifically name the
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
2.51.0


