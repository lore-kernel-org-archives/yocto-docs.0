Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9A0C77B7F
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:26 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.1297.1682133618051249370
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 6ABF0E7761;
	Fri, 21 Apr 2023 23:20:17 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 9A3B5E77BC;
	Fri, 21 Apr 2023 23:20:16 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 14/17] Document INIT_MANAGER
Date: Sat, 22 Apr 2023 15:19:50 +1200
Message-Id: <4283cb7fbe25a6d54df2b3359a1e46f9bc4d708c.1682133339.git.bluelightning@bluelightning.org>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3865

The INIT_MANAGER variable was added in 3.0 but it seems we didn't get
around to documenting it yet. I have added a variable glossary entry and
made the basic adjustment of the "Using systemd Exclusively" section in
the dev manual, however I think the latter section still needs work.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/dev-manual/init-manager.rst | 24 ++++++-----------------
 documentation/ref-manual/variables.rst    | 15 ++++++++++++++
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/documentation/dev-manual/init-manager.rst b/documentation/de=
v-manual/init-manager.rst
index 0617fed5166..10c4754e626 100644
--- a/documentation/dev-manual/init-manager.rst
+++ b/documentation/dev-manual/init-manager.rst
@@ -38,26 +38,14 @@ following sections.
 Using systemd Exclusively
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
=20
-Set these variables in your distribution configuration file as follows::
-
-   DISTRO_FEATURES:append =3D " systemd"
-   VIRTUAL-RUNTIME_init_manager =3D "systemd"
-
-You can also prevent the SysVinit distribution feature from
-being automatically enabled as follows::
-
-   DISTRO_FEATURES_BACKFILL_CONSIDERED =3D "sysvinit"
-
-Doing so removes any
-redundant SysVinit scripts.
-
-To remove initscripts from your image altogether, set this variable
-also::
+Set the :term:`INIT_MANAGER` variable in your distribution configuration
+file as follows::
=20
-   VIRTUAL-RUNTIME_initscripts =3D ""
+   INIT_MANAGER =3D "systemd"
=20
-For information on the backfill variable, see
-:term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`.
+This will enable systemd and remove sysvinit components from the image.
+See ``meta/conf/distro/include/init-manager-systemd.inc`` for exact
+details on what this does.
=20
 Using systemd for the Main Image and Using SysVinit for the Rescue Image
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index bfdf1d1401a..79d56dd7047 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3956,6 +3956,21 @@ system and gives an overview of their function and=
 contents.
          even if the toolchain's binaries are strippable, there are othe=
r files
          needed for the build that are not strippable.
=20
+   :term:`INIT_MANAGER`
+      Specifies the system init manager to use. Available options are:
+
+      -  ``sysvinit`` - System V init (default for poky)
+      -  ``systemd`` - systemd
+      -  ``mdev-busybox`` - mdev provided by busybox
+      -  ``none`` - no init manager
+
+      More concretely, this is used to include
+      ``conf/distro/include/init-manager-${INIT_MANAGER}.inc`` into the =
global
+      configuration. You can have a look at the ``conf/distro/include/in=
it-manager-*.inc``
+      files for more information, and also the
+      ":ref:`dev-manual/init-manager:selecting an initialization manager=
`"
+      section in the Yocto Project Development Tasks Manual.
+
    :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
       Indicates the deploy directory used by :ref:`ref-tasks-bundle_init=
ramfs`
       where the :term:`INITRAMFS_IMAGE` will be fetched from. This varia=
ble is
--=20
2.34.1


