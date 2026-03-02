Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F75DFD0054
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:38:03 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157026.1772444282727112120
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:38:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AJ4Rqfqo;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A7A84E424DB
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:38:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 021215FE89
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:38:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A36A10369531;
	Mon,  2 Mar 2026 10:38:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772444280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=boSi9YS4bBSsunHCeIvKfpLhHEtUD1fxqWiPJioCLxQ=;
	b=AJ4RqfqogpaE7VLIbN2qRSlEXQ3atHRNcB0347RVKs6puDkuPIJevCdvOdwZTG8N0Lw99c
	Mteh/xOojbVzMzSkFxpB8lf2oQ91g7HWx5giN4uMda07c83+EK/jnXVIqCiYR06jJBfjuy
	XArjWqXCTujulXgz7ElAgxTU7Ra98JRy+XJtnBHj/alZKTrvi4IqXYkG3yT6zXCrNmOQ3M
	22vfvyyX5mJRP6q6VFRQpIGmLWVtKU9XvKeVo39zhxGGd7S57ZQ4TTFG9ZjIs26FLIQCrQ
	bKJqDY1NboR7cs4sGAtW7/8v8TjWQ0TJmXGYcnxunVX8jma/Xy2VTVY975ZizQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 02 Mar 2026 10:37:49 +0100
Subject: [PATCH 2/8] ref-manual/variables.rst: document qemuboot variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-release-notes-6-0-v1-2-9662dee58591@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
In-Reply-To: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5993;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=j6j1XpvdYXW3rtNXTFCbof5l/Yyb1zfPmZtZj1x6zjk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBppVp1tUsDUbr3DJ6zxYmLqC4Txtpyd+QekPvAB
 dq7beCaZd6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaaVadQAKCRDRgEFAKaOo
 NobDEACdqLFKqRBQ572SfpOx9ejVevJ8Xhwx5HQ0WxTsx+umjAhba3/qpBAVkjuI/gDbLQRrMtV
 iEnL0BdKj/pAwPCMBSEavfn5LEVIAcN5pHvKMFfP+uUJ4tCINkGbW4b0Xgvl95Lo3yFu2zFXRdF
 tEJOsaRhjipU64PatBuV3r0zy0/AUq7m6BAgPD/6NSwiSpHh7SJNtjZOyQQF2fNgZ75E75akEHO
 +P34PUBmB7w+Rwmayn6uz9EaucPHnL9ZFTrIqnKElyQBLWqWLTQ7mfqBhMSV9fPunmfu3+RbJzX
 drdPgZdQj4gU1BygO/YqI2SehfOXZo0LcQ2UVqLoc9MyXbb7gaGEWcJUl4ekBsXg8h/DQkNmD5O
 vvOnixqZDbnrBpQK5raioZ+QJN7qKVBnTEksaI8gTFI9iFbOm+1Wgqzeso0IbEfhORKhrvGHURb
 NNpG+nu3qHYT3v37H/2bu6UG3vInhMhEMY9pt+0qpZ2aocamX/X+/VW6SLtIzKOMpRCWi2phZpX
 G73uTROmaNGenB6S6xgqnSdqb/ez1yqn6hBQX0ABG00RWmFmcA3svAwiMoqXyu17LmmZfpElvIl
 TON1G1j+fW3PIfc8DIlulEFREOcfZ1vSWzEPuMRj+WmId2SIrt4ZQFrJCU+60QjoixKv/9gKl2U
 YtCKVN59tY9utIw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:38:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9019

Document the variables in qemuboot.bbclass that allow customizing how
the QEMU guest is instantiated.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 147 +++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 45073d8a0..bf13b05c5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7853,6 +7853,153 @@ system and gives an overview of their function and contents.
 
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
2.52.0


