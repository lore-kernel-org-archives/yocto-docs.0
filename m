Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB87CA6C99
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5811.1769501982674049786
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=h6Jz4ihZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 064E91A2A6B
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D21F1606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B8D2119A8696;
	Tue, 27 Jan 2026 09:19:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uxd08NKrJixDGzkppdDyhLRkShIDtsBAHhCaMKKSvcQ=;
	b=h6Jz4ihZie+CxAteouF1SRc//YjcY5b3pH0geWW6aNPZRtEWEL7wtYiduTktFuNSU3NrP1
	iyT8QD3fPf3/V3J72qgh0u9MSTVID8NUn7oMn4rm+ea0MCSWcLAhK+Dn5+hSG72yiYGEQA
	q9eFjD28qnpvwY9cMJYsXnJ3QJZ7Q6QavlJKTIj0CZopiaT6AjsjlliszMeNKf2yjBCRAf
	mVt7zF8i4pLigFN8TuuzCS+NzGMYa8MsJs4htm42LI1G4xHANB2iR9wJ7BYJ8rFRfoNM1O
	pEP60hhZF85/uZYs2L//91D5PnElAvNMtQHlPlfUn6k+xuDy+ol+OUOR2KezhA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:23 +0100
Subject: [PATCH v2 28/56] ref-manual/variables.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-28-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=24746;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Z1MFMcXkUYYRCJCnCGSE2aW+SY5XPMNWf7Qxmf2edw0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUCdwPlh4Y6udZ6005uWm59JjaJ7O+eibzFc
 uYsEIWD50SJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AgAKCRDRgEFAKaOo
 NnDWD/9eflO6+Ibj0is/lL1SA75sRnBptOsoWa0o9FK3xGjrF0JS07sOExTfQACosB+D9PKhuNB
 S0cMQR3dBMD34cKJy2kgnup7yLniuFjzmbOSupwMjQHFnfRWNYVHicQ+bsnl0rtQI+kZDME1onW
 isWNuRXg++mPrwDPwV6A2QPfOGHvV40LH6zf/8h2kAuD7c3tjaxOipybX5RNTzt24BywZm8VjOy
 85Po/lC38QaJiB7jSY+u0jEVrlRdzCA/mHPANPu4TOCNxkZWhhSehxYctxs863kb0pjg6/LzUp7
 i8dM6Lr5xt92J3weUGC9RF0DT0ZXfdRjsta77mjK+3v++AI94FY6XsDl0JV8MDVOmOUPgXCNbKN
 DySMGs9jh9viz4Ds6hf9TfTYSXkVj7WfmYqbQc+u4L2DRqEWf09hF7WblrZIxqTFW2VPhzOxa33
 9KfEYYrKFR9Rukr19T0n+tQdvUDZjG9ljNcMuuXcAvflbgZZpl70YijUuoHABQReyLDimmyQHVQ
 HvgQjqw14GSELw1+h7ovl2LL32fH7QRrTn8dx0wWzyzmiFxh6gI90VEOYQ29XKsVHabgyG8axrv
 3DSv6TrnowjeQP7utMKE+vwBxYGQtDcG89L0fZQsxM+A1QlcYBDHzeXvm9rtx6I2dkbOpV6L0YM
 sCJIsIt/E3M4ztg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8689

Remove references to the Poky repository, replace by OpenEmbedded-Core
in most cases.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 149 ++++++++++++++++-----------------
 1 file changed, 73 insertions(+), 76 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4d8a35473..8eece1bb7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -168,7 +168,8 @@ system and gives an overview of their function and contents.
          ARCHIVER_MODE[srpm] = "1"                         # Uses RPM package files.
 
       For information on how the variable works, see the
-      ``meta/classes/archiver.bbclass`` file in the :term:`Source Directory`.
+      ``meta/classes/archiver.bbclass`` file in :term:`OpenEmbedded-Core
+      (OE-Core)`.
 
    :term:`AS`
       Minimal command and arguments needed to run the :manpage:`assembler
@@ -343,7 +344,7 @@ system and gives an overview of their function and contents.
       on Multilib.
 
       The :term:`BASE_LIB` variable is defined in the machine include files in
-      the :term:`Source Directory`. If Multilib is not
+      :term:`OpenEmbedded-Core (OE-Core)`. If Multilib is not
       being used, the value defaults to "lib".
 
    :term:`BASE_WORKDIR`
@@ -889,10 +890,10 @@ system and gives an overview of their function and contents.
       Here is an example::
 
          BBLAYERS = " \
-             /home/scottrif/poky/meta \
-             /home/scottrif/poky/meta-poky \
-             /home/scottrif/poky/meta-yocto-bsp \
-             /home/scottrif/poky/meta-mykernel \
+             /home/scottrif/bitbake-builds/layers/meta \
+             /home/scottrif/bitbake-builds/layers/meta-poky \
+             /home/scottrif/bitbake-builds/layers/meta-yocto-bsp \
+             /home/scottrif/bitbake-builds/layers/meta-mykernel \
              "
 
       This example enables four layers, one of which is a custom,
@@ -1007,8 +1008,8 @@ system and gives an overview of their function and contents.
          and `glob <https://docs.python.org/3/library/glob.html>`__.
 
       For more information on how this variable works, see
-      ``meta/classes-recipe/binconfig.bbclass`` in the :term:`Source Directory`.
-      You can also find general
+      ``meta/classes-recipe/binconfig.bbclass`` in :term:`OpenEmbedded-Core
+      (OE-Core)`. You can also find general
       information on the class in the
       ":ref:`ref-classes-binconfig`" section.
 
@@ -1617,8 +1618,8 @@ system and gives an overview of their function and contents.
       Bluetooth but you do not ever intend to use it.
 
    :term:`COMMERCIAL_AUDIO_PLUGINS`
-      This variable is specific to the :yocto_git:`GStreamer recipes
-      </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
+      This variable is specific to the :oe_git:`GStreamer recipes
+      </openembedded-core/tree/meta/recipes-multimedia/gstreamer/>`.
       It allows to build the GStreamer `"ugly"
       <https://github.com/GStreamer/gst-plugins-ugly>`__ and
       `"bad" <https://github.com/GStreamer/gst-plugins-bad>`__ audio plugins.
@@ -1627,8 +1628,8 @@ system and gives an overview of their function and contents.
       section for usage details.
 
    :term:`COMMERCIAL_VIDEO_PLUGINS`
-      This variable is specific to the :yocto_git:`GStreamer recipes
-      </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
+      This variable is specific to the :oe_git:`GStreamer recipes
+      </openembedded-core/tree/meta/recipes-multimedia/gstreamer/>`.
       It allows to build the GStreamer `"ugly"
       <https://github.com/GStreamer/gst-plugins-ugly>`__ and
       `"bad" <https://github.com/GStreamer/gst-plugins-bad>`__ video plugins.
@@ -1637,8 +1638,8 @@ system and gives an overview of their function and contents.
       section for usage details.
 
    :term:`COMMON_LICENSE_DIR`
-      Points to ``meta/files/common-licenses`` in the
-      :term:`Source Directory`, which is where generic license
+      Points to ``meta/files/common-licenses`` in
+      :term:`OpenEmbedded-Core (OE-Core)`, which is where generic license
       files reside.
 
    :term:`COMPATIBLE_HOST`
@@ -1763,8 +1764,8 @@ system and gives an overview of their function and contents.
          good practice to use appropriate path variables.
          For example, ``${sysconfdir}`` rather than ``/etc`` or ``${bindir}``
          rather than ``/usr/bin``. You can find a list of these variables at
-         the top of the ``meta/conf/bitbake.conf`` file in the
-         :term:`Source Directory`.
+         the top of the ``meta/conf/bitbake.conf`` file in
+         :term:`OpenEmbedded-Core (OE-Core)`.
 
    :term:`CONFIG_INITRAMFS_SOURCE`
       Identifies the initial RAM filesystem (:term:`Initramfs`) source files. The
@@ -1934,15 +1935,8 @@ system and gives an overview of their function and contents.
       supported.
 
    :term:`COREBASE`
-      Specifies the parent directory of the OpenEmbedded-Core Metadata
-      layer (i.e. ``meta``).
-
-      It is an important distinction that :term:`COREBASE` points to the parent
-      of this layer and not the layer itself. Consider an example where you
-      have cloned the Poky Git repository and retained the ``poky`` name
-      for your local copy of the repository. In this case, :term:`COREBASE`
-      points to the ``poky`` folder because it is the parent directory of
-      the ``poky/meta`` layer.
+      Specifies the parent directory of the :term:`OpenEmbedded-Core (OE-Core)`
+      metadata layer (i.e. ``meta``).
 
    :term:`COREBASE_FILES`
       Lists files from the :term:`COREBASE` directory that
@@ -2431,8 +2425,8 @@ system and gives an overview of their function and contents.
       file whose root name is the same as the variable's argument and whose
       filename extension is ``.conf``. For example, the distribution
       configuration file for the Poky distribution is named ``poky.conf``
-      and resides in the ``meta-poky/conf/distro`` directory of the
-      :term:`Source Directory`.
+      and resides in the ``meta-poky/conf/distro`` directory of
+      :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>`.
 
       Within that ``poky.conf`` file, the :term:`DISTRO` variable is set as
       follows::
@@ -2448,7 +2442,8 @@ system and gives an overview of their function and contents.
 
          If the :term:`DISTRO` variable is blank, a set of default configurations
          are used, which are specified within
-         ``meta/conf/distro/defaultsetup.conf`` also in the Source Directory.
+         ``meta/conf/distro/defaultsetup.conf`` also in :term:`OpenEmbedded-Core
+         (OE-Core)`.
 
    :term:`DISTRO_CODENAME`
       Specifies a codename for the distribution being built.
@@ -2567,7 +2562,7 @@ system and gives an overview of their function and contents.
       argument and whose filename extension is ``.conf``. For example, the
       distribution configuration file for the Poky distribution is named
       ``poky.conf`` and resides in the ``meta-poky/conf/distro`` directory
-      of the :term:`Source Directory`.
+      of :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>`.
 
       Within that ``poky.conf`` file, the :term:`DISTRO_NAME` variable is set
       as follows::
@@ -2582,7 +2577,8 @@ system and gives an overview of their function and contents.
 
          If the :term:`DISTRO_NAME` variable is blank, a set of default
          configurations are used, which are specified within
-         ``meta/conf/distro/defaultsetup.conf`` also in the Source Directory.
+         ``meta/conf/distro/defaultsetup.conf`` also in :term:`OpenEmbedded-Core
+         (OE-Core)`.
 
    :term:`DISTRO_VERSION`
       The version of the distribution.
@@ -2600,7 +2596,7 @@ system and gives an overview of their function and contents.
       :term:`OVERRIDES`.
 
       Here is an example from :yocto_git:`meta-poky/conf/distro/poky-tiny.conf
-      </poky/tree/meta-poky/conf/distro/poky-tiny.conf>`::
+      </meta-yocto/tree/meta-poky/conf/distro/poky-tiny.conf>`::
 
          DISTROOVERRIDES = "poky:poky-tiny"
 
@@ -3162,7 +3158,7 @@ system and gives an overview of their function and contents.
             use ``${sysconfdir}`` rather than ``/etc``, or ``${bindir}``
             rather than ``/usr/bin``. You can find a list of these
             variables at the top of the ``meta/conf/bitbake.conf`` file in
-            the :term:`Source Directory`. You will also
+            :term:`OpenEmbedded-Core (OE-Core)`. You will also
             find the default values of the various ``FILES:*`` variables in
             this file.
 
@@ -3279,8 +3275,8 @@ system and gives an overview of their function and contents.
       :term:`SRC_URI` statements.
 
       The default value for the :term:`FILESPATH` variable is defined in the
-      :ref:`ref-classes-base` class found in ``meta/classes-global`` in the
-      :term:`Source Directory`::
+      :ref:`ref-classes-base` class found in ``meta/classes-global`` in
+      :term:`OpenEmbedded-Core (OE-Core)`::
 
          FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", \
              "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
@@ -3335,7 +3331,7 @@ system and gives an overview of their function and contents.
 
       By default, the OpenEmbedded build system uses the ``fs-perms.txt``,
       ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt`` which are
-      located in the ``meta/files`` folder in the :term:`Source Directory`. If
+      located in the ``meta/files`` folder in :term:`OpenEmbedded-Core (OE-Core)`. If
       you create your own permission setting table files, you should place
       those in your layer.
 
@@ -3638,7 +3634,7 @@ system and gives an overview of their function and contents.
       Other Go programs importing this package will use this path.
 
       Here is an example setting from the
-      :yocto_git:`go-helloworld_0.1.bb </poky/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
+      :oe_git:`go-helloworld_0.1.bb </openembedded-core/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
       recipe::
 
           GO_IMPORT = "golang.org/x/example"
@@ -4500,7 +4496,8 @@ system and gives an overview of their function and contents.
       - wic.zst
 
       For more information about these types of images, see
-      ``meta/classes-recipe/image_types*.bbclass`` in the :term:`Source Directory`.
+      ``meta/classes-recipe/image_types*.bbclass`` in :term:`OpenEmbedded-Core
+      (OE-Core)`.
 
    :term:`IMAGE_VERSION_SUFFIX`
       Version suffix that is part of the default :term:`IMAGE_NAME` and
@@ -4718,7 +4715,7 @@ system and gives an overview of their function and contents.
 
       With ``sysvinit``, the init manager is set to
       :wikipedia:`SysVinit <Init#SysV-style>`, the traditional UNIX init
-      system. This is the default choice in the Poky distribution, together with
+      system. This is the default choice in the :term:`Poky` distribution, together with
       the Udev device manager (see the ":ref:`device-manager`" section).
 
       With ``systemd``, the init manager becomes :wikipedia:`systemd <Systemd>`,
@@ -4732,7 +4729,7 @@ system and gives an overview of their function and contents.
       More concretely, this is used to include
       ``conf/distro/include/init-manager-${INIT_MANAGER}.inc`` into the global
       configuration. You can have a look at the
-      :yocto_git:`meta/conf/distro/include/init-manager-*.inc </poky/tree/meta/conf/distro/include>`
+      :oe_git:`meta/conf/distro/include/init-manager-*.inc </openembedded-core/tree/meta/conf/distro/include>`
       files for more information, and also the ":ref:`init-manager`"
       section in the Yocto Project Development Tasks Manual.
 
@@ -4751,8 +4748,8 @@ system and gives an overview of their function and contents.
       :term:`IMAGE_FSTYPES` variable.
 
       The default value of this variable, which is set in the
-      ``meta/conf/bitbake.conf`` configuration file in the
-      :term:`Source Directory`, is "cpio.gz". The Linux kernel's
+      ``meta/conf/bitbake.conf`` configuration file in
+      :term:`OpenEmbedded-Core (OE-Core)`, is "cpio.gz". The Linux kernel's
       :term:`Initramfs` mechanism, as opposed to the initial RAM filesystem
       :wikipedia:`initrd <Initrd>` mechanism, expects
       an optionally compressed cpio archive.
@@ -4774,14 +4771,14 @@ system and gives an overview of their function and contents.
       .. note::
 
          See the ``meta/recipes-core/images/core-image-minimal-initramfs.bb``
-         recipe in the :term:`Source Directory`
+         recipe in :term:`OpenEmbedded-Core (OE-Core)`
          for an example :term:`Initramfs` recipe. To select this sample recipe as
          the one built to provide the :term:`Initramfs` image, set :term:`INITRAMFS_IMAGE`
          to "core-image-minimal-initramfs".
 
       You can also find more information by referencing the
-      ``meta-poky/conf/templates/default/local.conf.sample.extended``
-      configuration file in the Source Directory, the :ref:`ref-classes-image`
+      ``conf/templates/default/local.conf.sample.extended``
+      configuration file in :yocto_git:`meta-poky <meta-yocto/tree/meta-poky>`, the :ref:`ref-classes-image`
       class, and the :ref:`ref-classes-kernel` class to see how to use the
       :term:`INITRAMFS_IMAGE` variable.
 
@@ -4841,7 +4838,7 @@ system and gives an overview of their function and contents.
          configuration file. You cannot set the variable in a recipe file.
 
       See the
-      :yocto_git:`local.conf.sample.extended </poky/tree/meta-poky/conf/templates/default/local.conf.sample.extended>`
+      :yocto_git:`local.conf.sample.extended </meta-yocto/tree/meta-poky/conf/templates/default/local.conf.sample.extended>`
       file for additional information. Also, for information on creating an
       :term:`Initramfs`, see the ":ref:`dev-manual/building:building an initial ram filesystem (Initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
@@ -5855,7 +5852,7 @@ system and gives an overview of their function and contents.
       name, through which machine-specific configurations are set. Thus,
       when :term:`MACHINE` is set to "qemux86", the corresponding
       ``qemux86.conf`` machine configuration file can be found in
-      the :term:`Source Directory` in
+      :term:`OpenEmbedded-Core (OE-Core)` in
       ``meta/conf/machine``.
 
       The list of machines supported by the Yocto Project as shipped
@@ -6369,8 +6366,8 @@ system and gives an overview of their function and contents.
       ``sysroots/`` directory so that all builds that use the script will
       use the correct directories for the cross compiling layout.
 
-      See the ``meta/classes-recipe/binconfig.bbclass`` in the
-      :term:`Source Directory` for details on how this class
+      See the ``meta/classes-recipe/binconfig.bbclass`` in
+      :term:`OpenEmbedded-Core (OE-Core)` for details on how this class
       applies these additional sed command arguments.
 
    :term:`OE_FRAGMENTS`
@@ -6449,7 +6446,7 @@ system and gives an overview of their function and contents.
 
    :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`
       Set the package manager(s) for build reproducibility testing.
-      See :yocto_git:`reproducible.py </poky/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`
+      See :oe_git:`reproducible.py </openembedded-core/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`
       and :doc:`/test-manual/reproducible-builds`.
 
    :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS`
@@ -6719,7 +6716,7 @@ system and gives an overview of their function and contents.
          ``*-dbg`` package as with the ``.debug`` value, while source is
          placed in a separate ``*-src`` package, which can be installed
          independently.  This is the default setting for this variable,
-         as defined in Poky's ``bitbake.conf`` file.
+         as defined in :term:`OE-Core <OpenEmbedded-Core (OE-Core)>`'s ``bitbake.conf`` file.
 
       -  "``debug-without-src``": The same behavior as with the ``.debug``
          setting, but no source is packaged at all.
@@ -7677,8 +7674,8 @@ system and gives an overview of their function and contents.
       The network based :term:`PR` service host and port.
 
       The ``conf/templates/default/local.conf.sample.extended`` configuration
-      file in the :term:`Source Directory` shows how the :term:`PRSERV_HOST`
-      variable is set::
+      file in :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>` shows how the
+      :term:`PRSERV_HOST` variable is set::
 
          PRSERV_HOST = "localhost:0"
 
@@ -8324,11 +8321,11 @@ system and gives an overview of their function and contents.
       to find the unpacked source.
 
       As an example, assume a :term:`Source Directory`
-      top-level folder named ``poky`` and a default :term:`Build Directory` at
-      ``poky/build``. In this case, the work directory the build system
+      top-level folder named ``bitbake-builds`` and a default :term:`Build Directory` at
+      ``bitbake-builds/build``. In this case, the work directory the build system
       uses to keep the unpacked recipe for ``db`` is the following::
 
-         poky/build/tmp/work/qemux86-poky-linux/db/5.1.19-r3/sources/db-5.1.19
+         bitbake-builds/build/tmp/work/qemux86-poky-linux/db/5.1.19-r3/sources/db-5.1.19
 
       The unpacked source code resides in the ``db-5.1.19`` folder.
 
@@ -8580,7 +8577,7 @@ system and gives an overview of their function and contents.
 
          SDK_TITLE ??= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
 
-      For the default distribution "poky",
+      For the :term:`poky` reference distribution,
       :term:`SDK_TITLE` is set to "Poky (Yocto Project Reference Distro)".
 
       For information on how to change this default title, see the
@@ -8626,7 +8623,7 @@ system and gives an overview of their function and contents.
          SDKEXTPATH ??= "~/${@d.getVar('DISTRO')}_sdk"
 
       For the
-      default distribution "poky", the :term:`SDKEXTPATH` is set to "poky_sdk".
+      :term:`Poky` reference distro, the :term:`SDKEXTPATH` is set to "poky_sdk".
 
       For information on how to change this default directory, see the
       ":ref:`sdk-manual/appendix-customizing:changing the default sdk installation directory`"
@@ -9300,8 +9297,8 @@ system and gives an overview of their function and contents.
       .. note::
 
          The :term:`SRCPV` variable used to be defined in the
-         ``meta/conf/bitbake.conf`` configuration file in the :term:`Source
-         Directory` as follows::
+         ``meta/conf/bitbake.conf`` configuration file in
+         :term:`OpenEmbedded-Core (OE-Core)` as follows::
 
             SRCPV = "${@bb.fetch2.get_srcrev(d)}"
 
@@ -10006,8 +10003,8 @@ system and gives an overview of their function and contents.
       compatible with the kernel compilation. The :term:`TARGET_CC_KERNEL_ARCH`
       variable allows the kernel (and associated modules) to use a
       different configuration. See the
-      ``meta/conf/machine/include/arm/feature-arm-thumb.inc`` file in the
-      :term:`Source Directory` for an example.
+      ``meta/conf/machine/include/arm/feature-arm-thumb.inc`` file in
+      :term:`OpenEmbedded-Core (OE-Core)` for an example.
 
    :term:`TARGET_CFLAGS`
       Specifies the flags to pass to the C compiler when building for the
@@ -10408,10 +10405,10 @@ system and gives an overview of their function and contents.
       ``tmp`` within the :term:`Build Directory`.
 
       If you want to establish this directory in a location other than the
-      default, you can uncomment and edit the following statement in the
-      ``conf/local.conf`` file in the :term:`Source Directory`::
+      default, you can set it to another value in your
+      :ref:`structure-build-conf-site.conf` configuration file::
 
-         #TMPDIR = "${TOPDIR}/tmp"
+         TMPDIR = "/another/location"
 
       An example use for this scenario is to set :term:`TMPDIR` to a local disk,
       which does not use NFS, while having the :term:`Build Directory` use NFS.
@@ -10542,8 +10539,8 @@ system and gives an overview of their function and contents.
       definitions can be a single static definition, or can be dynamically
       adjusted. You can see details for a given CPU family by looking at
       the architecture's ``README`` file. For example, the
-      ``meta/conf/machine/include/mips/README`` file in the
-      :term:`Source Directory` provides information for
+      ``meta/conf/machine/include/mips/README`` file in
+      :term:`OpenEmbedded-Core (OE-Core)` provides information for
       :term:`TUNE_ARCH` specific to the ``mips`` architecture.
 
       :term:`TUNE_ARCH` is tied closely to
@@ -10645,7 +10642,7 @@ system and gives an overview of their function and contents.
       that conflict with feature.
 
       Known tuning conflicts are specified in the machine include files in
-      the :term:`Source Directory`. Here is an example from
+      :term:`OpenEmbedded-Core (OE-Core)`. Here is an example from
       the ``meta/conf/machine/include/mips/arch-mips.inc`` include file
       that lists the "o32" and "n64" features as conflicting with the "n32"
       feature::
@@ -10661,7 +10658,7 @@ system and gives an overview of their function and contents.
 
          TUNEVALID[bigendian] = "Enable big-endian mode."
 
-      See the machine include files in the :term:`Source Directory`
+      See the machine include files in :term:`OpenEmbedded-Core (OE-Core)`
       for these features.
 
    :term:`UBOOT_BINARY`
@@ -11350,8 +11347,8 @@ system and gives an overview of their function and contents.
          USER_CLASSES ?= "buildstats"
 
       For more information, see
-      ``meta-poky/conf/templates/default/local.conf.sample`` in the
-      :term:`Source Directory`.
+      ``conf/templates/default/local.conf.sample`` in
+      :yocto_git:`meta-poky <meta-yocto/tree/meta-poky>`.
 
    :term:`USERADD_DEPENDS`
       Specifies a list of recipes that create users / groups (via
@@ -11500,13 +11497,13 @@ system and gives an overview of their function and contents.
          VIRTUAL-RUNTIME_base-utils = "packagegroup-core-base-utils"
 
       Here are two examples using this virtual runtime package. The
-      first one is in :yocto_git:`initramfs-framework_1.0.bb
-      </poky/tree/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb?h=scarthgap>`::
+      first one is in :oe_git:`initramfs-framework_1.0.bb
+      </openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb>`::
 
          RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_base-utils}"
 
-      The second example is in the :yocto_git:`core-image-initramfs-boot
-      </poky/tree/meta/recipes-core/images/core-image-initramfs-boot.bb?h=scarthgap>`
+      The second example is in the :oe_git:`core-image-initramfs-boot
+      </openembedded-core/tree/meta/recipes-core/images/core-image-initramfs-boot.bb>`
       image definition::
 
          PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} base-passwd"
@@ -11632,13 +11629,13 @@ system and gives an overview of their function and contents.
       -  :term:`PR`: The recipe revision
 
       As an example, assume a Source Directory top-level folder name
-      ``poky``, a default :term:`Build Directory` at ``poky/build``, and a
+      ``bitbake-builds``, a default :term:`Build Directory` at ``bitbake-builds/build``, and a
       ``qemux86-poky-linux`` machine target system. Furthermore, suppose
       your recipe is named ``foo_1.3.0-r0.bb``. In this case, the work
       directory the build system uses to build the package would be as
       follows::
 
-         poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
+         bitbake-builds/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
 
    :term:`XSERVER`
       Specifies the packages that should be installed to provide an X

-- 
2.52.0


