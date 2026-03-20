Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C34108B8FB
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:46:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9823.1774003590521050179
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 03:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xqMDJK0Q;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 483FBC415B6
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DFD38600E0
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E27310450B99;
	Fri, 20 Mar 2026 11:46:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003588; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JN5wi8lfd4UMyRGQd0AaLr59NIRv3amy4Rw7lOBFCaA=;
	b=xqMDJK0Qej7TYMP4mG2pv61C7CXpUAE/ZvUFMv23xKCIY12AM4Lj4xDJpMyy0YI8VdAUvJ
	6vzltr//gG27VmEVl4Qo1gl2LoX1Fu8jw4h2yztEOUwuZ02yZ1jtUH8/30TCBFPwvhCi5E
	ALOTK4l+KfxuCKHBLTOljxGRf/2jmoh/uGrqBN2lJcjvOoEXpgNAwTyVr8vyjN8CdGhUUd
	YhcU7YHTEuG7xJ4B2OaXNFyNtYR2NL8dfRWh7zNyzxZC1TDCvLyfIO/inBKLPRGlv5Jpw/
	Q/WjJbi9eq9al5yYZt0uvs0O4M78x6lmltHJJMmFk1zlrG5OB18r0uUVMeguBw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Mar 2026 11:46:20 +0100
Subject: [PATCH v2 2/8] ref-manual/variables.rst: document qemuboot
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-release-notes-6-0-v2-2-1bdb1eb142ae@bootlin.com>
References: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
In-Reply-To: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5993;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=XPsuQ0KoNGzF2qNj1ddbHa1ktUAe4oFylRCKkBS7NGY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpvSWB1sL4b0BPx3CAilweCqwmVEF4PS8rhAiVD
 WjJWfQ8J/+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCab0lgQAKCRDRgEFAKaOo
 NibiEAC1x+Y7q4zua10+ZQEyuFcSGBMpz2UrPougdC7crKWmwx1/XCEMObgMQDPStYqGSrhHiiV
 lM+0Ao4PgBAdiBeJMo64F3x53VphfVTz8QpX0mGf9lmBmE5OnZIOSt8pPl8PuyUbfOUSzSAXGbR
 cJiaPHYTNuIgiKtRZcWnWLw1KOtl9Q65e9m8JstF79rJzyuExRO9s89GPiukRouo6h49FRe5u/w
 RY3jWL8xb3ecNjpxzj2xUPgRwfDX9dOYksTEKW8iyaTFmJotgAs9FDhipukZXkl2u7uitZ8lYF1
 6keBroJVuAMffYxe3BDe3LJH+z6rgSAGN0RcJs1kqfoGBZRLjGEX0LejfcyEe3FiY0rZ1CT9kXO
 hw/HhxNvvrY7bN+eOOpybCMNSHG4NlHv9Ue7KXBiz68Vs8Mi3bLi6/RF1ZN+qbIvif1Hmzp1ByO
 Vo87cC/nfom37RWWr42NgVLYviICruRVBsj2Syrf3OhgKJfN32mIvMYR1ln0SOcwYULjj06xw4J
 nc0YPFOKfwouwxGmdMo36M+hpUJRCoD264wO+0IZxZEP2pK7tms1OFd+VLOGGjv3hoO/RQQ6gPZ
 tfKyVtx6zxQDZQyIKbi5g4y4OFy2gHyLsr0pIQBMfcFV4tp/jGrdfyrAO8rMMYW7RZH/oqvQ12s
 lBDc38Prs30tIRA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9103

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


