Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A591C282D2
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 17:20:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.460.1741022426602482407
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 09:20:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CA251007
	for <docs@lists.yoctoproject.org>; Mon,  3 Mar 2025 09:20:40 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C51B53F673
	for <docs@lists.yoctoproject.org>; Mon,  3 Mar 2025 09:20:25 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 1/2] Remove all mention of core-image-lsb
Date: Mon,  3 Mar 2025 17:20:21 +0000
Message-ID: <20250303172022.775243-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Mar 2025 17:20:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6490

core-image-lsb was removed in 2019[1], so remove all of the  incredibly
obsolete references in the documentation.

[1] oe-core fb064356af615d67d85b65942103bf943d84d290

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../dev-manual/customizing-images.rst         | 17 +++++++--------
 documentation/dev-manual/qemu.rst             | 11 +++++-----
 documentation/ref-manual/images.rst           | 21 -------------------
 3 files changed, 13 insertions(+), 36 deletions(-)

diff --git a/documentation/dev-manual/customizing-images.rst b/documentat=
ion/dev-manual/customizing-images.rst
index 634825944..6eed9ef56 100644
--- a/documentation/dev-manual/customizing-images.rst
+++ b/documentation/dev-manual/customizing-images.rst
@@ -79,15 +79,14 @@ recipe that are enabled with :term:`IMAGE_FEATURES`. =
The value of
 :term:`EXTRA_IMAGE_FEATURES` is added to :term:`IMAGE_FEATURES` within
 ``meta/conf/bitbake.conf``.
=20
-To illustrate how you can use these variables to modify your image,
-consider an example that selects the SSH server. The Yocto Project ships
-with two SSH servers you can use with your images: Dropbear and OpenSSH.
-Dropbear is a minimal SSH server appropriate for resource-constrained
-environments, while OpenSSH is a well-known standard SSH server
-implementation. By default, the ``core-image-sato`` image is configured
-to use Dropbear. The ``core-image-full-cmdline`` and ``core-image-lsb``
-images both include OpenSSH. The ``core-image-minimal`` image does not
-contain an SSH server.
+To illustrate how you can use these variables to modify your image, cons=
ider an
+example that selects the SSH server. The Yocto Project ships with two SS=
H
+servers you can use with your images: Dropbear and OpenSSH. Dropbear is =
a
+minimal SSH server appropriate for resource-constrained environments, wh=
ile
+OpenSSH is a well-known standard SSH server implementation. By default, =
the
+``core-image-sato`` image is configured to use Dropbear. The
+``core-image-full-cmdline`` image includes OpenSSH. The ``core-image-min=
imal``
+image does not contain an SSH server.
=20
 You can customize your image and change these defaults. Edit the
 :term:`IMAGE_FEATURES` variable in your recipe or use the
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual=
/qemu.rst
index 19f3e40d6..9014d75f4 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -280,12 +280,11 @@ present, the toolchain is also automatically used.
       networking.
=20
    -  SSH servers are available in some QEMU images. The ``core-image-sa=
to``
-      QEMU image has a Dropbear secure shell (SSH) server that runs with
-      the root password disabled. The ``core-image-full-cmdline`` and
-      ``core-image-lsb`` QEMU images have OpenSSH instead of Dropbear.
-      Including these SSH servers allow you to use standard ``ssh`` and
-      ``scp`` commands. The ``core-image-minimal`` QEMU image, however,
-      contains no SSH server.
+      QEMU image has a Dropbear secure shell (SSH) server that runs with=
 the
+      root password disabled. The ``core-image-full-cmdline`` QEMU image=
 has
+      OpenSSH instead of Dropbear. Including these SSH servers allow you=
 to use
+      standard ``ssh`` and ``scp`` commands. The ``core-image-minimal`` =
QEMU
+      image, however, contains no SSH server.
=20
    -  You can use a provided, user-space NFS server to boot the QEMU
       session using a local copy of the root filesystem on the host. In
diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manu=
al/images.rst
index d6bdc92f0..c9d898926 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -51,27 +51,6 @@ Here is a list of supported recipes:
 -  ``core-image-full-cmdline``: A console-only image with more
    full-featured Linux system functionality installed.
=20
--  ``core-image-lsb``: An image that conforms to the Linux Standard Base
-   (LSB) specification. This image requires a distribution configuration
-   that enables LSB compliance (e.g. ``poky-lsb``). If you build
-   ``core-image-lsb`` without that configuration, the image will not be
-   LSB-compliant.
-
--  ``core-image-lsb-dev``: A ``core-image-lsb`` image that is suitable
-   for development work using the host. The image includes headers and
-   libraries you can use in a host development environment. This image
-   requires a distribution configuration that enables LSB compliance
-   (e.g. ``poky-lsb``). If you build ``core-image-lsb-dev`` without that
-   configuration, the image will not be LSB-compliant.
-
--  ``core-image-lsb-sdk``: A ``core-image-lsb`` that includes everything
-   in the cross-toolchain but also includes development headers and
-   libraries to form a complete standalone SDK. This image requires a
-   distribution configuration that enables LSB compliance (e.g.
-   ``poky-lsb``). If you build ``core-image-lsb-sdk`` without that
-   configuration, the image will not be LSB-compliant. This image is
-   suitable for development using the target.
-
 -  ``core-image-minimal``: A small image just capable of allowing a
    device to boot.
=20
--=20
2.43.0


