Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38ADC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 17:47:51 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.2899.1681753662308711906
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Apr 2023 10:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R9WCKwmr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7234360002;
	Mon, 17 Apr 2023 17:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681753660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KJEVv2NkJ51nPSretoWRITa3SBVq3fvI7P5gycKH6oE=;
	b=R9WCKwmrF1+y6nygIYXgB8nCkO8onEclaX10NfVxe7OBTeG3IiZ3TcLuTEojO2aZQ7PJhE
	1ib6/SAKjEapdUQ0QoVz0SjgltKOnvkl7Mt8HqadE3DW/jT7dQKXCq1sLw++zWRkLLOGfZ
	joW+R/QZZnZPwzWwmTG5X8hufo4+OIl5cupfhlgxsYIWfV46AvNAPTRlwNhUwWClw2br7i
	x11BMVZcp7VpCIon+yJW9wz4Fk/lyQFAtAu6+Fr0iq2LAmNVQmBFCvXiu2uDqpDGe9UfxE
	SZTnKRlQt8aucb203l5ksYXQtOhbf5DZmXqg/VCpnqQzlOcSezMU14NgQkfwMA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: document INIT_MANAGER
Date: Mon, 17 Apr 2023 19:47:37 +0200
Message-Id: <20230417174737.1244805-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Apr 2023 17:47:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3838

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Document the INIT_MANAGER variable and all its
  possible settings

- Stop mentioning "rescue image" generation, as this
  is not detailed anywhere else.

- Expand the "Selecting an Initialization Manager" section.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/device-manager.rst   |   2 +
 documentation/dev-manual/init-manager.rst     | 111 ++++++++++--------
 .../migration-guides/migration-3.0.rst        |   6 +-
 documentation/ref-manual/variables.rst        |  25 ++++
 4 files changed, 95 insertions(+), 49 deletions(-)

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
index 0617fed516..b4127d20a4 100644
--- a/documentation/dev-manual/init-manager.rst
+++ b/documentation/dev-manual/init-manager.rst
@@ -1,83 +1,102 @@
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
-=========================
+The :ref:`device-manager` chapter has more details about device managers.
 
-Set these variables in your distribution configuration file as follows::
+Using SysVinit with udev
+=========================
 
-   DISTRO_FEATURES:append = " systemd"
-   VIRTUAL-RUNTIME_init_manager = "systemd"
+SysVinit with  the udev device manager corresponds to the
+default setting in Poky. This corresponds to setting::
 
-You can also prevent the SysVinit distribution feature from
-being automatically enabled as follows::
+   INIT_MANAGER = "sysvinit"
 
-   DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
+Using BusyBox init with BusyBox mdev
+====================================
 
-Doing so removes any
-redundant SysVinit scripts.
+BusyBox init with BusyBox mdev is the simplest and lightest solution
+for small root filesystems. All you need is BusyBox, which most systems
+have anyway::
 
-To remove initscripts from your image altogether, set this variable
-also::
+   INIT_MANAGER = "mdev-busybox"
 
-   VIRTUAL-RUNTIME_initscripts = ""
+Using systemd
+=============
 
-For information on the backfill variable, see
-:term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`.
+The last option is to use systemd together with the udev device
+manager. This is the most powerful and versatile solution, especially
+for more complex systems::
 
-Using systemd for the Main Image and Using SysVinit for the Rescue Image
-========================================================================
+   INIT_MANAGER = "systemd"
 
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
 
@@ -85,5 +104,5 @@ configuration file::
    VIRTUAL-RUNTIME_base-utils-syslog = ""
 
 Doing so will prevent ``rsyslog`` / ``busybox-syslog`` from being pulled in by
-default, leaving only ``journald``.
+default, leaving only ``systemd-journald``.
 
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 8e7a58e74d..6a3e3f084d 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -13,12 +13,12 @@ Init System Selection
 
 Changing the init system manager previously required setting a number of
 different variables. You can now change the manager by setting the
-``INIT_MANAGER`` variable and the corresponding include files (i.e.
+:term:`INIT_MANAGER` variable and the corresponding include files (i.e.
 ``conf/distro/include/init-manager-*.conf``). Include files are provided
 for four values: "none", "sysvinit", "systemd", and "mdev-busybox". The
-default value, "none", for ``INIT_MANAGER`` should allow your current
+default value, "none", for :term:`INIT_MANAGER` should allow your current
 settings to continue working. However, it is advisable to explicitly set
-``INIT_MANAGER``.
+:term:`INIT_MANAGER`.
 
 .. _migration-3.0-lsb-support-removed:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 62f28bd278..c9a9ba7ba9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3988,6 +3988,31 @@ system and gives an overview of their function and contents.
          even if the toolchain's binaries are strippable, there are other files
          needed for the build that are not strippable.
 
+   :term:`INIT_MANAGER`
+      This variable allows to choose the init manager for the system. Possible
+      values correspond to the ``init-manager-*.inc`` include files in
+      :yocto_git:`tree/meta/conf/distro/include/ </poky/tree/meta/conf/distro/include>`:
+      ``none``, ``sysvinit``, ``systemd``, and ``mdev-busybox``.
+
+      With ``sysvinit``, the init manager is set to
+      :wikipedia:`SysVinit <Init#SysV-style>`, the traditional UNIX init
+      system. This is the default choice in the Poky distribution, together with
+      the Udev device manager (see the ":ref:`device-manager`" section).
+
+      With ``none``, the init manager is also set to ``sysvinit``. This is the
+      default setting in OpenEmbedded-Core. This option also selects the
+      :wikipedia:`udev <Udev>` device manager.
+
+      With ``systemd``, the init manager becomes :wikipedia:`systemd <Systemd>`,
+      which comes with the :wikipedia:`udev <Udev>` device manager.
+
+      With ``mdev-busybox``, the init manager becomes the must simpler BusyBox
+      init, together with the BusyBox mdev device manager. This is the simplest
+      and lightest solution, and probably the best choice for low-end systems
+      with a rather slow CPU and a limited amount of RAM.
+
+      See the ":ref:`init-manager`" section for further details.
+
    :term:`Initramfs`
       An Initial RAM Filesystem (:term:`Initramfs`) is an optionally compressed
       :wikipedia:`cpio <Cpio>` archive which is extracted
-- 
2.34.1


