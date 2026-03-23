Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5364EC01B0
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 08:50:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12663.1774255824796231342
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 01:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=p3T1uR8E;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 38E724E427AE
	for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10DE75FEF6
	for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5331D103713CA;
	Mon, 23 Mar 2026 09:50:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774255822; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JN5wi8lfd4UMyRGQd0AaLr59NIRv3amy4Rw7lOBFCaA=;
	b=p3T1uR8EH/6c85pxUZIlds7M98JK3HrPMh5iDb7f8yPFCq9taSFsDQtmIYdElF63Gbu5V3
	P5est0tOYwlB/YCv4A+KSa4GF/7XoZcCU0kKnEPSDH612gDlX81ZigcJI7wwRHdJ+/K1y8
	d3CH7bMQOthQF4g35+HlA5lbjYVq3dkhE943h1wkSK8YPZbGsVJER05I24xrFRqOqub5aM
	vvzbA9HZUPPiAMOdwsDeqph1MsjE61iF/K+/Mtjx0L+joV5U/zhDhZIbU23zLCrSNO/Ssp
	cSkxrKYjZNh6LfcZyzxYR7Y1YwKHbOoVwQ0S2v6AtB4HDZ+TFeiPNKlMFwjDQw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 23 Mar 2026 09:49:53 +0100
Subject: [PATCH v3 2/8] ref-manual/variables.rst: document qemuboot
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-release-notes-6-0-v3-2-844ec702f95b@bootlin.com>
References: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
In-Reply-To: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5993;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=XPsuQ0KoNGzF2qNj1ddbHa1ktUAe4oFylRCKkBS7NGY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpwP7KvkxV+dXXVv/hmUsKMWxCoWL6PaqelTjcX
 hoSZ3bE8U+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCacD+ygAKCRDRgEFAKaOo
 NmVXD/4he2N6u95myrSCATBdSC4Il2tloBsFrazwr0MPaPCYIY1ezmu8f08m3N2a0orAo+regA0
 2VpI0aopINiJrvEGDRg9bStDBu4kjwqQgXNwyuwtGcVoy0go/w+EYUuQvbzeClr+pK6Wma6cQzM
 PXmXfHleCJ+jsl70uCLYc8bi62cgdvZGEB4cqYB+CY/T7fzUIf9yecY0ES7Ur3LZrc7WZisLCMU
 yaMsD1EUcQMKx06OFXj3uaZBF+tWFiaNZgVrc6Ci89JcPAfqHzLaF70BtdbaQKdcP3MIWz25GLt
 ed7abneRZHC3TD4Q0Qt1RNHbY4gKN6Uv6vrJTNKijeWjeqJKoW3l2ge40Tq5VUFE/L1pfpNT4tp
 zzFnRgnNtN4A8IQzWUJ9/Zx9iv4HuZ/+92xIY56eUZlg5nq2hBehd5sQVuMKJmZKk/ienrfWBJs
 ywndz1jFChf2S0o/HuE0La6fGM7SlksGA3ufXdafsUJAtKB8EWLCIjbrQl3PSClsPb1SutuZkBN
 qII2qqLhxiTZl1+HAuWlZDvj/3Fldc389nI7XyAzGiQSuUS8Kc7hcdPwXyYQxV7DhMtHTQ0tn6u
 XRqjQZUVDCjM+x3kjnDQI/FtGUUSQLAy9msj2lbkeFBqGGAXMv829pBg/PJA/fL2CMjmPrLi8IQ
 o2JAY+cYKWp6GoQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9115

Document the variables in qemuboot.bbclass that allow customizing how
the QEMU guest is instantiated.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 147 +++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9e0c5b083..e24c4bbf8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7850,6 +7850,153 @@ system and gives an overview of their function and contents.
 
          QA_EMPTY_DIRS_RECOMMENDATION:/dev = "but all devices must be created at runtime"
 
+   :term:`QB_CMDLINE_IP_SLIRP`
+
+      If :term:`QB_NETWORK_DEVICE` adds more than one network interface to QEMU,
+      usually the ``ip=`` Linux kernel command line argument needs to be changed
+      accordingly. The :term:`QB_CMDLINE_IP_SLIRP` variable allows controlling
+      this value. See the Linux kernel documentation for more details:
+      https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt.
+
+   :term:`QB_CMDLINE_IP_TAP`
+
+      This variable is similar to the :term:`QB_CMDLINE_IP_SLIRP` variable.
+
+      Use as follows::
+
+         QB_CMDLINE_IP_TAP = "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0"
+
+      Since the tap interface requires static IP configuration, ``runqemu``
+      replaces the ``@CLIENT@`` and ``@GATEWAY@`` place holders by the IP and
+      the gateway address of the QEMU guest.
+
+   :term:`QB_DEFAULT_FSTYPE`
+
+      The :term:`QB_DEFAULT_FSTYPE` variable controls the default filesystem
+      type to boot. It is represented as the file extension of one of the root
+      filesystem image extension found in :term:`DEPLOY_DIR_IMAGE`. For example:
+      ``ext4.zst``.
+
+   :term:`QB_DEFAULT_KERNEL`
+
+      When using ``runqemu``, the :term:`QB_DEFAULT_KERNEL` variable controls
+      the default Linux kernel image to boot, found in :term:`DEPLOY_DIR_IMAGE`. For
+      example: ``bzImage``.
+
+   :term:`QB_DRIVE_TYPE`
+
+      When using ``runqemu``, the :term:`QB_DRIVE_TYPE` variable specifies the
+      type of drive to emulate when starting the emulated machine.
+      Valid values are:
+
+      -  ``/dev/hd``: emulates an IDE drive.
+      -  ``/dev/mmcblk``: emulates an SD Card.
+      -  ``/dev/sd``: emulates an SCSI drive.
+      -  ``/dev/vd``: emulates a VirtIO drive.
+      -  ``/dev/vdb``: emulates a block VirtIO drive.
+
+   :term:`QB_GRAPHICS`
+
+      When using ``runqemu``, the :term:`QB_GRAPHICS` variable controls the QEMU
+      video card type to emulate. For example: ``-vga std``.
+
+      This value is appended to the argument list when running ``qemu``.
+
+   :term:`QB_KERNEL_CMDLINE_APPEND`
+
+      The :term:`QB_KERNEL_CMDLINE_APPEND` variable controls the options passed
+      to the Linux kernel's ``-append`` QEMU options, which controls the Linux kernel
+      command-line.
+
+      For example::
+
+         QB_KERNEL_CMDLINE_APPEND = "console=ttyS0"
+
+   :term:`QB_MEM`
+
+      The :term:`QB_MEM` variable controls the amount of memory allocated to the
+      emulated machine. Specify as follows::
+
+         QB_MEM = "-m 512"
+
+   :term:`QB_NETWORK_DEVICE`
+
+      When using ``runqemu``, the :term:`QB_NETWORK_DEVICE` variable controls
+      the network device instantiated by QEMU. This value needs to be compatible
+      with the :term:`QB_TAP_OPT` variable.
+
+      Example::
+
+         QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@"
+
+      ``runqemu`` replaces ``@MAC@`` with a predefined mac address.
+
+   :term:`QB_NFSROOTFS_EXTRA_OPT`
+
+      When using ``runqemu``, the :term:`QB_NFSROOTFS_EXTRA_OPT` variable
+      controls extra options to be appended to the NFS rootfs options in the
+      Linux kernel command-line.
+
+      For example::
+
+         QB_NFSROOTFS_EXTRA_OPT = "wsize=4096,rsize=4096"
+
+   :term:`QB_OPT_APPEND`
+
+      When using ``runqemu``, the :term:`QB_OPT_APPEND` variable controls
+      general options to append to QEMU when starting.
+
+   :term:`QB_RNG`
+
+      When using ``runqemu``, the :term:`QB_RNG` variable controls
+      pass-through for host random number generator, it can speedup boot
+      in system mode, where system is experiencing entropy starvation.
+
+      For example::
+
+         QB_RNG = "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
+
+   :term:`QB_ROOTFS_EXTRA_OPT`
+
+      When using ``runqemu``, the :term:`QB_ROOTFS_EXTRA_OPT` variable controls
+      extra options to be appended to the rootfs device options.
+
+   :term:`QB_SERIAL_OPT`
+
+      When using ``runqemu``, the :term:`QB_SERIAL_OPT` variable controls the
+      serial port option.
+
+      For example::
+
+         QB_SERIAL_OPT = "-serial mon:stdio"
+
+   :term:`QB_SMP`
+
+      When using ``runqemu``, the :term:`QB_SMP` variable controls
+      amount of CPU cores made availalble inside the QEMU guest, each mapped to
+      a thread on the host.
+
+      For example::
+
+         QB_SMP = "-smp 8".
+
+   :term:`QB_TAP_NAMESERVER`
+
+      When using ``runqemu``, the :term:`QB_TAP_NAMESERVER` variable controls
+      the default :wikipedia:`name server <Name_server>` used in the QEMU guest.
+
+   :term:`QB_TAP_OPT`
+
+      When using ``runqemu``, the :term:`QB_TAP_OPT` variable controls
+      the network option for "tap" mode.
+
+      For example::
+
+         QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
+
+      Note that ``runqemu`` will replace ``@TAP@`` with the tap interface in
+      use, such as ``tap0``, ``tap1``, etc.
+
    :term:`RANLIB`
       The minimal command and arguments to run :manpage:`ranlib <ranlib(1)>`.
 

-- 
2.53.0


