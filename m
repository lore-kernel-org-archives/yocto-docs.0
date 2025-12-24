Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAD3E776EF
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123730.1766593928512424162
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YvCPKOes;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 07C3C1A23E0
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D31D26073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F17CF10AB1386;
	Wed, 24 Dec 2025 17:32:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dGuapXYbKioo55hZYojInooXRmJjjwEa6cHwxSO2loE=;
	b=YvCPKOesXrp9YAfK3CgqzLiCt1CpNTIJAcdlriCo8b8MtfcJRjZ5Sog+ib0enm693DHIGm
	3NKB5NC/QsCXuronjjByhMO6g+qiCDWnWwUlyeDQ/+c/B14jRrcWBWUSKxZFHK8f5ucEMo
	bH/MJARHQLIyMhJsM6zNwMpUmkxsD3Q1UjtyaHvkThRnccCOOUUpsJB96JfQ98B7fN5kGX
	2sS/bKdrilGECwLoFKrOE0XCw12zUfP4nmfUeOhnHwYcFtRzqR5SqmZQSvIy4GV68EGIoU
	EYxs81TZBh5j25TWANAOy/SNcMNH+XLDSRfc2bAeedOr73kSN/tldAXEz/rK9Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:54 +0100
Subject: [PATCH 28/53] ref-manual/variables.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-28-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=24675;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RfQt4mDHTVGIOkol/2wG9wobM74bSHOa7fezCeH+8Ps=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVrYLV3dY5gGPVtzp111lA6JfSww1ozEys97
 WHRsdL/Xh6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVawAKCRDRgEFAKaOo
 NnlkD/9IA7L4we+eqNj2JGpgFez7R7R6PS7fZ/R/5/jcW/T/evH+zpxXsOXrDPZA8cWvN98ZEqw
 xshK+Guz2sxVtZjq/9t6D2UgYocemtC35psUQBD2tyiK/p3sOUyZUG8P0ddkU0Qbi+sKB6BmD4M
 +O3uIwNIG/1826iWt61ahuBorucq23SONI3l9ghocNYWiP+kGvRdjRt1auI/pU84no3MtCtiQs+
 nTimYSperjAmU2PuUqKdH9TDMUeFEhy4c7swFxhMEo3RJvixN5UZ4qdpl7kVKSh5KaFgolrEdXk
 9hK93SgbyDKfw4eDROzvijRaQQ7Ga48sxUHwVV0dU7YCqYu2BV6mlXbwESviScCurhbIYaNs3EV
 zX6KbPLsf8TAeXTEaiiLESEljEqGcCSnwBOhyORWXj0y/YA9i4EF+lI5okb0Ts+W0lZYcPqaJ4x
 3eoV7XOnCUI7aVYkr0gRlXpreju2c5V6oyYqcBQnMPC7SvhwocQudQEkXWl4wdcL45vosvRi2jJ
 bM5uFIggPjhN02kahl/zzqpu3xw9mHkPgWMZAy11JAu6xT+qu0I/PtgsuWkl5CJc2dA68o1yjwK
 uJCtaOTf8G2BwvtpFjg2fkip7cRuKl3s7NHRv0q1+K5sL+44jADn2oqjCF5RzOcYCaJtEyen2F0
 w39nO+mHSMTtq+g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8357

Remove references to the Poky repository, replace by OpenEmbedded-Core
in most cases.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 149 ++++++++++++++++-----------------
 1 file changed, 73 insertions(+), 76 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ee776c110..b994c62a2 100644
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
+             /home/scottrif/project/layers/meta \
+             /home/scottrif/project/layers/meta-poky \
+             /home/scottrif/project/layers/meta-yocto-bsp \
+             /home/scottrif/project/layers/meta-mykernel \
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
 
@@ -1611,8 +1612,8 @@ system and gives an overview of their function and contents.
       Bluetooth but you do not ever intend to use it.
 
    :term:`COMMERCIAL_AUDIO_PLUGINS`
-      This variable is specific to the :yocto_git:`GStreamer recipes
-      </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
+      This variable is specific to the :oe_git:`GStreamer recipes
+      </openembedded-core/tree/meta/recipes-multimedia/gstreamer/>`.
       It allows to build the GStreamer `"ugly"
       <https://github.com/GStreamer/gst-plugins-ugly>`__ and
       `"bad" <https://github.com/GStreamer/gst-plugins-bad>`__ audio plugins.
@@ -1621,8 +1622,8 @@ system and gives an overview of their function and contents.
       section for usage details.
 
    :term:`COMMERCIAL_VIDEO_PLUGINS`
-      This variable is specific to the :yocto_git:`GStreamer recipes
-      </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
+      This variable is specific to the :oe_git:`GStreamer recipes
+      </openembedded-core/tree/meta/recipes-multimedia/gstreamer/>`.
       It allows to build the GStreamer `"ugly"
       <https://github.com/GStreamer/gst-plugins-ugly>`__ and
       `"bad" <https://github.com/GStreamer/gst-plugins-bad>`__ video plugins.
@@ -1631,8 +1632,8 @@ system and gives an overview of their function and contents.
       section for usage details.
 
    :term:`COMMON_LICENSE_DIR`
-      Points to ``meta/files/common-licenses`` in the
-      :term:`Source Directory`, which is where generic license
+      Points to ``meta/files/common-licenses`` in
+      :term:`OpenEmbedded-Core (OE-Core)`, which is where generic license
       files reside.
 
    :term:`COMPATIBLE_HOST`
@@ -1757,8 +1758,8 @@ system and gives an overview of their function and contents.
          good practice to use appropriate path variables.
          For example, ``${sysconfdir}`` rather than ``/etc`` or ``${bindir}``
          rather than ``/usr/bin``. You can find a list of these variables at
-         the top of the ``meta/conf/bitbake.conf`` file in the
-         :term:`Source Directory`.
+         the top of the ``meta/conf/bitbake.conf`` file in
+         :term:`OpenEmbedded-Core (OE-Core)`.
 
    :term:`CONFIG_INITRAMFS_SOURCE`
       Identifies the initial RAM filesystem (:term:`Initramfs`) source files. The
@@ -1928,15 +1929,8 @@ system and gives an overview of their function and contents.
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
@@ -2425,8 +2419,8 @@ system and gives an overview of their function and contents.
       file whose root name is the same as the variable's argument and whose
       filename extension is ``.conf``. For example, the distribution
       configuration file for the Poky distribution is named ``poky.conf``
-      and resides in the ``meta-poky/conf/distro`` directory of the
-      :term:`Source Directory`.
+      and resides in the ``meta-poky/conf/distro`` directory of
+      :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>`.
 
       Within that ``poky.conf`` file, the :term:`DISTRO` variable is set as
       follows::
@@ -2442,7 +2436,8 @@ system and gives an overview of their function and contents.
 
          If the :term:`DISTRO` variable is blank, a set of default configurations
          are used, which are specified within
-         ``meta/conf/distro/defaultsetup.conf`` also in the Source Directory.
+         ``meta/conf/distro/defaultsetup.conf`` also in :term:`OpenEmbedded-Core
+         (OE-Core)`.
 
    :term:`DISTRO_CODENAME`
       Specifies a codename for the distribution being built.
@@ -2561,7 +2556,7 @@ system and gives an overview of their function and contents.
       argument and whose filename extension is ``.conf``. For example, the
       distribution configuration file for the Poky distribution is named
       ``poky.conf`` and resides in the ``meta-poky/conf/distro`` directory
-      of the :term:`Source Directory`.
+      of :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>`.
 
       Within that ``poky.conf`` file, the :term:`DISTRO_NAME` variable is set
       as follows::
@@ -2576,7 +2571,8 @@ system and gives an overview of their function and contents.
 
          If the :term:`DISTRO_NAME` variable is blank, a set of default
          configurations are used, which are specified within
-         ``meta/conf/distro/defaultsetup.conf`` also in the Source Directory.
+         ``meta/conf/distro/defaultsetup.conf`` also in :term:`OpenEmbedded-Core
+         (OE-Core)`.
 
    :term:`DISTRO_VERSION`
       The version of the distribution.
@@ -2594,7 +2590,7 @@ system and gives an overview of their function and contents.
       :term:`OVERRIDES`.
 
       Here is an example from :yocto_git:`meta-poky/conf/distro/poky-tiny.conf
-      </poky/tree/meta-poky/conf/distro/poky-tiny.conf>`::
+      </meta-yocto/tree/meta-poky/conf/distro/poky-tiny.conf>`::
 
          DISTROOVERRIDES = "poky:poky-tiny"
 
@@ -3156,7 +3152,7 @@ system and gives an overview of their function and contents.
             use ``${sysconfdir}`` rather than ``/etc``, or ``${bindir}``
             rather than ``/usr/bin``. You can find a list of these
             variables at the top of the ``meta/conf/bitbake.conf`` file in
-            the :term:`Source Directory`. You will also
+            :term:`OpenEmbedded-Core (OE-Core)`. You will also
             find the default values of the various ``FILES:*`` variables in
             this file.
 
@@ -3273,8 +3269,8 @@ system and gives an overview of their function and contents.
       :term:`SRC_URI` statements.
 
       The default value for the :term:`FILESPATH` variable is defined in the
-      :ref:`ref-classes-base` class found in ``meta/classes-global`` in the
-      :term:`Source Directory`::
+      :ref:`ref-classes-base` class found in ``meta/classes-global`` in
+      :term:`OpenEmbedded-Core (OE-Core)`::
 
          FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", \
              "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
@@ -3329,7 +3325,7 @@ system and gives an overview of their function and contents.
 
       By default, the OpenEmbedded build system uses the ``fs-perms.txt``,
       ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt`` which are
-      located in the ``meta/files`` folder in the :term:`Source Directory`. If
+      located in the ``meta/files`` folder in :term:`OpenEmbedded-Core (OE-Core)`. If
       you create your own permission setting table files, you should place
       those in your layer.
 
@@ -3632,7 +3628,7 @@ system and gives an overview of their function and contents.
       Other Go programs importing this package will use this path.
 
       Here is an example setting from the
-      :yocto_git:`go-helloworld_0.1.bb </poky/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
+      :oe_git:`go-helloworld_0.1.bb </openembedded-core/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
       recipe::
 
           GO_IMPORT = "golang.org/x/example"
@@ -4494,7 +4490,8 @@ system and gives an overview of their function and contents.
       - wic.zst
 
       For more information about these types of images, see
-      ``meta/classes-recipe/image_types*.bbclass`` in the :term:`Source Directory`.
+      ``meta/classes-recipe/image_types*.bbclass`` in :term:`OpenEmbedded-Core
+      (OE-Core)`.
 
    :term:`IMAGE_VERSION_SUFFIX`
       Version suffix that is part of the default :term:`IMAGE_NAME` and
@@ -4712,7 +4709,7 @@ system and gives an overview of their function and contents.
 
       With ``sysvinit``, the init manager is set to
       :wikipedia:`SysVinit <Init#SysV-style>`, the traditional UNIX init
-      system. This is the default choice in the Poky distribution, together with
+      system. This is the default choice in the :term:`Poky` distribution, together with
       the Udev device manager (see the ":ref:`device-manager`" section).
 
       With ``systemd``, the init manager becomes :wikipedia:`systemd <Systemd>`,
@@ -4726,7 +4723,7 @@ system and gives an overview of their function and contents.
       More concretely, this is used to include
       ``conf/distro/include/init-manager-${INIT_MANAGER}.inc`` into the global
       configuration. You can have a look at the
-      :yocto_git:`meta/conf/distro/include/init-manager-*.inc </poky/tree/meta/conf/distro/include>`
+      :oe_git:`meta/conf/distro/include/init-manager-*.inc </openembedded-core/tree/meta/conf/distro/include>`
       files for more information, and also the ":ref:`init-manager`"
       section in the Yocto Project Development Tasks Manual.
 
@@ -4745,8 +4742,8 @@ system and gives an overview of their function and contents.
       :term:`IMAGE_FSTYPES` variable.
 
       The default value of this variable, which is set in the
-      ``meta/conf/bitbake.conf`` configuration file in the
-      :term:`Source Directory`, is "cpio.gz". The Linux kernel's
+      ``meta/conf/bitbake.conf`` configuration file in
+      :term:`OpenEmbedded-Core (OE-Core)`, is "cpio.gz". The Linux kernel's
       :term:`Initramfs` mechanism, as opposed to the initial RAM filesystem
       :wikipedia:`initrd <Initrd>` mechanism, expects
       an optionally compressed cpio archive.
@@ -4768,14 +4765,14 @@ system and gives an overview of their function and contents.
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
 
@@ -4835,7 +4832,7 @@ system and gives an overview of their function and contents.
          configuration file. You cannot set the variable in a recipe file.
 
       See the
-      :yocto_git:`local.conf.sample.extended </poky/tree/meta-poky/conf/templates/default/local.conf.sample.extended>`
+      :yocto_git:`local.conf.sample.extended </meta-yocto/tree/meta-poky/conf/templates/default/local.conf.sample.extended>`
       file for additional information. Also, for information on creating an
       :term:`Initramfs`, see the ":ref:`dev-manual/building:building an initial ram filesystem (Initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
@@ -5849,7 +5846,7 @@ system and gives an overview of their function and contents.
       name, through which machine-specific configurations are set. Thus,
       when :term:`MACHINE` is set to "qemux86", the corresponding
       ``qemux86.conf`` machine configuration file can be found in
-      the :term:`Source Directory` in
+      :term:`OpenEmbedded-Core (OE-Core)` in
       ``meta/conf/machine``.
 
       The list of machines supported by the Yocto Project as shipped
@@ -6363,8 +6360,8 @@ system and gives an overview of their function and contents.
       ``sysroots/`` directory so that all builds that use the script will
       use the correct directories for the cross compiling layout.
 
-      See the ``meta/classes-recipe/binconfig.bbclass`` in the
-      :term:`Source Directory` for details on how this class
+      See the ``meta/classes-recipe/binconfig.bbclass`` in
+      :term:`OpenEmbedded-Core (OE-Core)` for details on how this class
       applies these additional sed command arguments.
 
    :term:`OE_FRAGMENTS`
@@ -6443,7 +6440,7 @@ system and gives an overview of their function and contents.
 
    :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`
       Set the package manager(s) for build reproducibility testing.
-      See :yocto_git:`reproducible.py </poky/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`
+      See :oe_git:`reproducible.py </openembedded-core/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`
       and :doc:`/test-manual/reproducible-builds`.
 
    :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS`
@@ -6713,7 +6710,7 @@ system and gives an overview of their function and contents.
          ``*-dbg`` package as with the ``.debug`` value, while source is
          placed in a separate ``*-src`` package, which can be installed
          independently.  This is the default setting for this variable,
-         as defined in Poky's ``bitbake.conf`` file.
+         as defined in :term:`OE-Core <OpenEmbedded-Core (OE-Core)>`'s ``bitbake.conf`` file.
 
       -  "``debug-without-src``": The same behavior as with the ``.debug``
          setting, but no source is packaged at all.
@@ -7671,8 +7668,8 @@ system and gives an overview of their function and contents.
       The network based :term:`PR` service host and port.
 
       The ``conf/templates/default/local.conf.sample.extended`` configuration
-      file in the :term:`Source Directory` shows how the :term:`PRSERV_HOST`
-      variable is set::
+      file in :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>` shows how the
+      :term:`PRSERV_HOST` variable is set::
 
          PRSERV_HOST = "localhost:0"
 
@@ -8318,11 +8315,11 @@ system and gives an overview of their function and contents.
       to find the unpacked source.
 
       As an example, assume a :term:`Source Directory`
-      top-level folder named ``poky`` and a default :term:`Build Directory` at
-      ``poky/build``. In this case, the work directory the build system
+      top-level folder named ``project`` and a default :term:`Build Directory` at
+      ``project/build``. In this case, the work directory the build system
       uses to keep the unpacked recipe for ``db`` is the following::
 
-         poky/build/tmp/work/qemux86-poky-linux/db/5.1.19-r3/sources/db-5.1.19
+         project/build/tmp/work/qemux86-poky-linux/db/5.1.19-r3/sources/db-5.1.19
 
       The unpacked source code resides in the ``db-5.1.19`` folder.
 
@@ -8574,7 +8571,7 @@ system and gives an overview of their function and contents.
 
          SDK_TITLE ??= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
 
-      For the default distribution "poky",
+      For the :term:`poky` reference distribution,
       :term:`SDK_TITLE` is set to "Poky (Yocto Project Reference Distro)".
 
       For information on how to change this default title, see the
@@ -8620,7 +8617,7 @@ system and gives an overview of their function and contents.
          SDKEXTPATH ??= "~/${@d.getVar('DISTRO')}_sdk"
 
       For the
-      default distribution "poky", the :term:`SDKEXTPATH` is set to "poky_sdk".
+      :term:`Poky` reference distro, the :term:`SDKEXTPATH` is set to "poky_sdk".
 
       For information on how to change this default directory, see the
       ":ref:`sdk-manual/appendix-customizing:changing the default sdk installation directory`"
@@ -9294,8 +9291,8 @@ system and gives an overview of their function and contents.
       .. note::
 
          The :term:`SRCPV` variable used to be defined in the
-         ``meta/conf/bitbake.conf`` configuration file in the :term:`Source
-         Directory` as follows::
+         ``meta/conf/bitbake.conf`` configuration file in
+         :term:`OpenEmbedded-Core (OE-Core)` as follows::
 
             SRCPV = "${@bb.fetch2.get_srcrev(d)}"
 
@@ -10000,8 +9997,8 @@ system and gives an overview of their function and contents.
       compatible with the kernel compilation. The :term:`TARGET_CC_KERNEL_ARCH`
       variable allows the kernel (and associated modules) to use a
       different configuration. See the
-      ``meta/conf/machine/include/arm/feature-arm-thumb.inc`` file in the
-      :term:`Source Directory` for an example.
+      ``meta/conf/machine/include/arm/feature-arm-thumb.inc`` file in
+      :term:`OpenEmbedded-Core (OE-Core)` for an example.
 
    :term:`TARGET_CFLAGS`
       Specifies the flags to pass to the C compiler when building for the
@@ -10402,10 +10399,10 @@ system and gives an overview of their function and contents.
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
@@ -10536,8 +10533,8 @@ system and gives an overview of their function and contents.
       definitions can be a single static definition, or can be dynamically
       adjusted. You can see details for a given CPU family by looking at
       the architecture's ``README`` file. For example, the
-      ``meta/conf/machine/include/mips/README`` file in the
-      :term:`Source Directory` provides information for
+      ``meta/conf/machine/include/mips/README`` file in
+      :term:`OpenEmbedded-Core (OE-Core)` provides information for
       :term:`TUNE_ARCH` specific to the ``mips`` architecture.
 
       :term:`TUNE_ARCH` is tied closely to
@@ -10639,7 +10636,7 @@ system and gives an overview of their function and contents.
       that conflict with feature.
 
       Known tuning conflicts are specified in the machine include files in
-      the :term:`Source Directory`. Here is an example from
+      :term:`OpenEmbedded-Core (OE-Core)`. Here is an example from
       the ``meta/conf/machine/include/mips/arch-mips.inc`` include file
       that lists the "o32" and "n64" features as conflicting with the "n32"
       feature::
@@ -10655,7 +10652,7 @@ system and gives an overview of their function and contents.
 
          TUNEVALID[bigendian] = "Enable big-endian mode."
 
-      See the machine include files in the :term:`Source Directory`
+      See the machine include files in :term:`OpenEmbedded-Core (OE-Core)`
       for these features.
 
    :term:`UBOOT_BINARY`
@@ -11298,8 +11295,8 @@ system and gives an overview of their function and contents.
          USER_CLASSES ?= "buildstats"
 
       For more information, see
-      ``meta-poky/conf/templates/default/local.conf.sample`` in the
-      :term:`Source Directory`.
+      ``conf/templates/default/local.conf.sample`` in
+      :yocto_git:`meta-poky <meta-yocto/tree/meta-poky>`.
 
    :term:`USERADD_DEPENDS`
       Specifies a list of recipes that create users / groups (via
@@ -11448,13 +11445,13 @@ system and gives an overview of their function and contents.
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
@@ -11580,13 +11577,13 @@ system and gives an overview of their function and contents.
       -  :term:`PR`: The recipe revision
 
       As an example, assume a Source Directory top-level folder name
-      ``poky``, a default :term:`Build Directory` at ``poky/build``, and a
+      ``project``, a default :term:`Build Directory` at ``project/build``, and a
       ``qemux86-poky-linux`` machine target system. Furthermore, suppose
       your recipe is named ``foo_1.3.0-r0.bb``. In this case, the work
       directory the build system uses to build the package would be as
       follows::
 
-         poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
+         project/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
 
    :term:`XSERVER`
       Specifies the packages that should be installed to provide an X

-- 
2.51.0


