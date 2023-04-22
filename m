Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D40C77B76
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:26 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.1296.1682133616851408308
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 3F816E773A;
	Fri, 21 Apr 2023 23:20:16 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 6E890E772B;
	Fri, 21 Apr 2023 23:20:15 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 13/17] ref-manual: move Initramfs entry from variables to terms
Date: Sat, 22 Apr 2023 15:19:49 +1200
Message-Id: <013bf815b0be12ebcd11e0986278ed999e7909c3.1682133339.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682133339.git.bluelightning@bluelightning.org>
References: <cover.1682133339.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.11 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Apr 2023 03:20:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3864

It looks like this was accidentally added to the variable glossary
instead of the terms list, so move it to the latter.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/ref-manual/terms.rst     | 42 ++++++++++++++++++++++++++
 documentation/ref-manual/variables.rst | 42 --------------------------
 2 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manua=
l/terms.rst
index 92cc723ff6a..68313d0294a 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -212,6 +212,48 @@ universal, the list includes them just in case:
       of the supported image types that the Yocto Project provides, see =
the
       ":ref:`ref-manual/images:Images`" chapter.
=20
+   :term:`Initramfs`
+      An Initial RAM Filesystem (:term:`Initramfs`) is an optionally com=
pressed
+      :wikipedia:`cpio <Cpio>` archive which is extracted
+      by the Linux kernel into RAM in a special :wikipedia:`tmpfs <Tmpfs=
>`
+      instance, used as the initial root filesystem.
+
+      This is a replacement for the legacy init RAM disk ("initrd")
+      technique, booting on an emulated block device in RAM, but being l=
ess
+      efficient because of the overhead of going through a filesystem an=
d
+      having to duplicate accessed file contents in the file cache in RA=
M,
+      as for any block device.
+
+      .. note:
+
+         As far as bootloaders are concerned, :term:`Initramfs` and "ini=
trd"
+         images are still copied to RAM in the same way. That's why most
+	 most bootloaders refer to :term:`Initramfs` images as "initrd"
+	 or "init RAM disk".
+
+      This kind of mechanism is typically used for two reasons:
+
+      -  For booting the same kernel binary on multiple systems requirin=
g
+         different device drivers. The :term:`Initramfs` image is then c=
ustomized
+	 for each type of system, to include the specific  kernel modules
+         necessary to access the final root filesystem. This technique
+	 is used on all GNU / Linux distributions for desktops and servers.
+
+      -  For booting faster. As the root filesystem is extracted into RA=
M,
+         accessing the first user-space applications is very fast, compa=
red
+         to having to initialize a block device, to access multiple bloc=
ks
+         from it, and to go through a filesystem having its own overhead=
.
+         For example, this allows to display a splashscreen very early,
+	 and to later take care of mounting the final root filesystem and
+         loading less time-critical kernel drivers.
+
+      This cpio archive can either be loaded to RAM by the bootloader,
+      or be included in the kernel binary.
+
+      For information on creating and using an :term:`Initramfs`, see th=
e
+      ":ref:`dev-manual/building:building an initial ram filesystem (Ini=
tramfs) image`"
+      section in the Yocto Project Development Tasks Manual.
+
    :term:`Layer`
       A collection of related recipes. Layers allow you to consolidate r=
elated
       metadata to customize your build. Layers also isolate information =
used
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 86ffd8912dc..bfdf1d1401a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3956,48 +3956,6 @@ system and gives an overview of their function and=
 contents.
          even if the toolchain's binaries are strippable, there are othe=
r files
          needed for the build that are not strippable.
=20
-   :term:`Initramfs`
-      An Initial RAM Filesystem (:term:`Initramfs`) is an optionally com=
pressed
-      :wikipedia:`cpio <Cpio>` archive which is extracted
-      by the Linux kernel into RAM in a special :wikipedia:`tmpfs <Tmpfs=
>`
-      instance, used as the initial root filesystem.
-
-      This is a replacement for the legacy init RAM disk ("initrd")
-      technique, booting on an emulated block device in RAM, but being l=
ess
-      efficient because of the overhead of going through a filesystem an=
d
-      having to duplicate accessed file contents in the file cache in RA=
M,
-      as for any block device.
-
-      .. note:
-
-         As far as bootloaders are concerned, :term:`Initramfs` and "ini=
trd"
-         images are still copied to RAM in the same way. That's why most
-	 most bootloaders refer to :term:`Initramfs` images as "initrd"
-	 or "init RAM disk".
-
-      This kind of mechanism is typically used for two reasons:
-
-      -  For booting the same kernel binary on multiple systems requirin=
g
-         different device drivers. The :term:`Initramfs` image is then c=
ustomized
-	 for each type of system, to include the specific  kernel modules
-         necessary to access the final root filesystem. This technique
-	 is used on all GNU / Linux distributions for desktops and servers.
-
-      -  For booting faster. As the root filesystem is extracted into RA=
M,
-         accessing the first user-space applications is very fast, compa=
red
-         to having to initialize a block device, to access multiple bloc=
ks
-         from it, and to go through a filesystem having its own overhead=
.
-         For example, this allows to display a splashscreen very early,
-	 and to later take care of mounting the final root filesystem and
-         loading less time-critical kernel drivers.
-
-      This cpio archive can either be loaded to RAM by the bootloader,
-      or be included in the kernel binary.
-
-      For information on creating and using an :term:`Initramfs`, see th=
e
-      ":ref:`dev-manual/building:building an initial ram filesystem (Ini=
tramfs) image`"
-      section in the Yocto Project Development Tasks Manual.
-
    :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
       Indicates the deploy directory used by :ref:`ref-tasks-bundle_init=
ramfs`
       where the :term:`INITRAMFS_IMAGE` will be fetched from. This varia=
ble is
--=20
2.34.1


