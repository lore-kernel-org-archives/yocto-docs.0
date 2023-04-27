Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B78CC77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 15:53:23 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.24601.1682610793961621365
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 08:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pQh/KXom;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3B576240003;
	Thu, 27 Apr 2023 15:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682610791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6WqFULWr0s8tEBi/rwb9fxf9D3NxDyAYl2Sb3TfdUiY=;
	b=pQh/KXom5ruWZ0R/M2z/1gu+H8vTnFsFSBVhI09rY4U4BpQVOb4dUE9gLetaRpGgruvwuc
	WvFJGfEMoUkvU4o1iwHlHQSdxGTGaANsUvMgm4zkBeAQD/g+Y9TLUkie4HzXqi1wN2SW+B
	ef+HcKLF9d9wPQkONkQsqY4J6nN7OriMOPPZFQ+1MPJWdiWqvZ7PQ76Yacl8a6y/OcIi4x
	c0hufk/oUEiJDjrgb2zVP1yHhD6JdrbTwEyditEAiJoUB44smmWyEZGHxrKdOTWbGnrk5s
	5IwjGiIr/EJfkLVoVQ6R47vwBBoM8EclpntHWFHOfPufDhnPO4p3t1LsiU90PQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Paul Eggleton <bluelightning@bluelightning.org>
Subject: [PATCH] manuals: expand init manager documentation
Date: Thu, 27 Apr 2023 17:53:08 +0200
Message-Id: <20230427155308.56744-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Apr 2023 15:53:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3875

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Add details about INIT_MANAGER
  Correct the fact that "none" currently generates
  an image with "sysvinit", at least on Poky.
  This behaviour should probably be changed.

- Expand the "Selecting an Initialization Manager" section.

- Stop mentioning "rescue image" generation, as this
  is not detailed anywhere else.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/dev-manual/device-manager.rst |   2 +
 documentation/dev-manual/init-manager.rst   | 108 +++++++++++++-------
 documentation/ref-manual/variables.rst      |  31 ++++--
 3 files changed, 98 insertions(+), 43 deletions(-)

diff --git a/documentation/dev-manual/device-manager.rst b/documentation/dev-manual/device-manager.rst
index 4248c23b44..0343d19b9c 100644
--- a/documentation/dev-manual/device-manager.rst
+++ b/documentation/dev-manual/device-manager.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
+.. _device-manager:
+
 Selecting a Device Manager
 **************************
 
diff --git a/documentation/dev-manual/init-manager.rst b/documentation/dev-manual/init-manager.rst
index 10c4754e62..fd8747b9b0 100644
--- a/documentation/dev-manual/init-manager.rst
+++ b/documentation/dev-manual/init-manager.rst
@@ -1,71 +1,107 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
+.. _init-manager:
+
 Selecting an Initialization Manager
 ***********************************
 
-By default, the Yocto Project uses SysVinit as the initialization
-manager. However, there is also support for systemd, which is a full
-replacement for init with parallel starting of services, reduced shell
-overhead and other features that are used by many distributions.
+By default, the Yocto Project uses :wikipedia:`SysVinit <Init#SysV-style>` as
+the initialization manager. There is also support for BusyBox init, a simpler
+implementation, as well as support for :wikipedia:`systemd <Systemd>`, which
+is a full replacement for init with parallel starting of services, reduced
+shell overhead, increased security and resource limits for services, and other
+features that are used by many distributions.
+
+Within the system, SysVinit and BusyBox init treat system components as
+services. These services are maintained as shell scripts stored in the
+``/etc/init.d/`` directory.
 
-Within the system, SysVinit treats system components as services. These
-services are maintained as shell scripts stored in the ``/etc/init.d/``
-directory. Services organize into different run levels. This
-organization is maintained by putting links to the services in the
-``/etc/rcN.d/`` directories, where `N/` is one of the following options:
-"S", "0", "1", "2", "3", "4", "5", or "6".
+SysVinit is more elaborate than BusyBox init and organizes services in
+different run levels. This organization is maintained by putting links
+to the services in the ``/etc/rcN.d/`` directories, where `N/` is one
+of the following options: "S", "0", "1", "2", "3", "4", "5", or "6".
 
 .. note::
 
    Each runlevel has a dependency on the previous runlevel. This
    dependency allows the services to work properly.
 
+Both SysVinit and BusyBox init are configured through the ``/etc/inittab``
+file, with a very similar syntax, though of course BusyBox init features
+are more limited.
+
 In comparison, systemd treats components as units. Using units is a
 broader concept as compared to using a service. A unit includes several
-different types of entities. Service is one of the types of entities.
+different types of entities. ``Service`` is one of the types of entities.
 The runlevel concept in SysVinit corresponds to the concept of a target
 in systemd, where target is also a type of supported unit.
 
-In a SysVinit-based system, services load sequentially (i.e. one by one)
-during init and parallelization is not supported. With systemd, services
-start in parallel. Needless to say, the method can have an impact on
-system startup performance.
+In systems with SysVinit or BusyBox init, services load sequentially (i.e. one
+by one) during init and parallelization is not supported. With systemd, services
+start in parallel. This method can have an impact on the startup performance
+of a given service, though systemd will also provide more services by default,
+therefore increasing the total system boot time. systemd also substantially
+increases system size because of its multiple components and the extra
+dependencies it pulls.
 
-If you want to use SysVinit, you do not have to do anything. But, if you
-want to use systemd, you must take some steps as described in the
-following sections.
+On the contrary, BusyBox init is the simplest and the lightest solution and
+also comes with BusyBox mdev as device manager, a lighter replacement to
+:wikipedia:`udev <Udev>`, which SysVinit and systemd both use.
 
-Using systemd Exclusively
+The ":ref:`device-manager`" chapter has more details about device managers.
+
+Using SysVinit with udev
 =========================
 
-Set the :term:`INIT_MANAGER` variable in your distribution configuration
-file as follows::
+SysVinit with  the udev device manager corresponds to the
+default setting in Poky. This corresponds to setting::
+
+   INIT_MANAGER = "sysvinit"
+
+Using BusyBox init with BusyBox mdev
+====================================
+
+BusyBox init with BusyBox mdev is the simplest and lightest solution
+for small root filesystems. All you need is BusyBox, which most systems
+have anyway::
+
+   INIT_MANAGER = "mdev-busybox"
+
+Using systemd
+=============
+
+The last option is to use systemd together with the udev device
+manager. This is the most powerful and versatile solution, especially
+for more complex systems::
 
    INIT_MANAGER = "systemd"
 
 This will enable systemd and remove sysvinit components from the image.
-See ``meta/conf/distro/include/init-manager-systemd.inc`` for exact
+See :yocto_git:`meta/conf/distro/include/init-manager-systemd.inc
+</poky/tree/meta/conf/distro/include/init-manager-systemd.inc>` for exact
 details on what this does.
 
-Using systemd for the Main Image and Using SysVinit for the Rescue Image
-========================================================================
-
-Set these variables in your distribution configuration file as follows::
+Controling systemd from the target command line
+-----------------------------------------------
 
-   DISTRO_FEATURES:append = " systemd"
-   VIRTUAL-RUNTIME_init_manager = "systemd"
+Here is a quick reference for controling systemd from the command line on the
+target. Instead of opening and sometimes modifying files, most interaction
+happens through the ``systemctl`` and ``journalctl`` commands:
 
-Doing so causes your main image to use the
-``packagegroup-core-boot.bb`` recipe and systemd. The rescue/minimal
-image cannot use this package group. However, it can install SysVinit
-and the appropriate packages will have support for both systemd and
-SysVinit.
+-  ``systemctl status``: show the status of all services
+-  ``systemctl status <service>``: show the status of one service
+-  ``systemctl [start|stop] <service>``: start or stop a service
+-  ``systemctl [enable|disable] <service>``: enable or disable a service at boot time
+-  ``systemctl list-units``: list all available units
+-  ``journalctl -a``: show all logs for all services
+-  ``journalctl -f``: show only the last log entries, and keep printing updates as they arrive
+-  ``journalctl -u``: show only logs from a particular service
 
 Using systemd-journald without a traditional syslog daemon
-==========================================================
+----------------------------------------------------------
 
 Counter-intuitively, ``systemd-journald`` is not a syslog runtime or provider,
-and the proper way to use systemd-journald as your sole logging mechanism is to
+and the proper way to use ``systemd-journald`` as your sole logging mechanism is to
 effectively disable syslog entirely by setting these variables in your distribution
 configuration file::
 
@@ -73,5 +109,5 @@ configuration file::
    VIRTUAL-RUNTIME_base-utils-syslog = ""
 
 Doing so will prevent ``rsyslog`` / ``busybox-syslog`` from being pulled in by
-default, leaving only ``journald``.
+default, leaving only ``systemd-journald``.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 01b710199d..acfdd7a544 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3959,16 +3959,33 @@ system and gives an overview of their function and contents.
    :term:`INIT_MANAGER`
       Specifies the system init manager to use. Available options are:
 
-      -  ``sysvinit`` - System V init (default for poky)
-      -  ``systemd`` - systemd
-      -  ``mdev-busybox`` - mdev provided by busybox
-      -  ``none`` - no init manager
+      -  ``sysvinit``
+      -  ``systemd``
+      -  ``mdev-busybox``
+      -  ``none``
+
+      With ``sysvinit``, the init manager is set to
+      :wikipedia:`SysVinit <Init#SysV-style>`, the traditional UNIX init
+      system. This is the default choice in the Poky distribution, together with
+      the Udev device manager (see the ":ref:`device-manager`" section).
+
+      With ``systemd``, the init manager becomes :wikipedia:`systemd <Systemd>`,
+      which comes with the :wikipedia:`udev <Udev>` device manager.
+
+      With ``mdev-busybox``, the init manager becomes the must simpler BusyBox
+      init, together with the BusyBox mdev device manager. This is the simplest
+      and lightest solution, and probably the best choice for low-end systems
+      with a rather slow CPU and a limited amount of RAM.
+
+      With ``none``, the init manager is also set to ``sysvinit``. This is the
+      default setting in OpenEmbedded-Core. This option also selects the
+      :wikipedia:`udev <Udev>` device manager.
 
       More concretely, this is used to include
       ``conf/distro/include/init-manager-${INIT_MANAGER}.inc`` into the global
-      configuration. You can have a look at the ``conf/distro/include/init-manager-*.inc``
-      files for more information, and also the
-      ":ref:`dev-manual/init-manager:selecting an initialization manager`"
+      configuration. You can have a look at the
+      :yocto_git:`meta/conf/distro/include/init-manager-*.inc </poky/tree/meta/conf/distro/include>`
+      files for more information, and also the ":ref:`init-manager`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
-- 
2.34.1


