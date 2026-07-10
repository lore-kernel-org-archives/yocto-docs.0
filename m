Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4E0C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 08:20:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8289.1783671609466697768
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 01:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WvvbuBR+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3F4611A0F25
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 08:20:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0EF2C60341
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 08:20:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B24811BD26A6;
	Fri, 10 Jul 2026 10:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783671606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=OogApggLUE9Lz1yoXSfzj7QwmDa9wapCQg9AlOR3yD4=;
	b=WvvbuBR+Lg+uPBSZW2Gwa9ZVdEvK44yA3jKc/FBHfU4E99P4k6qMelctPyXjwLeSdwv2k6
	tC+uXKmc6lJZoSh67sRImrGC7SFI4SBvbYOW2Nsah9vn9QZKtLW6kg2ESyTJ4QpR+tI7+v
	PIvWmPYB75x034JCfSLBFzyeuwp4NfHHhQCUU6z023xdayqzO8SfTaxxa5QwcWBuLXs9kC
	bpvPVdUitxo89+l+4YER6+s0d5qDcg6M81qY67loRNSOzbAzXFWdTETc2FQKdWZ8f6SNdk
	3qqrZsELel7h/e9nczYmzqEkVxbE6tRnU2yH4Tr42YLpWEIjxtEH+54zn5Jedw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Jul 2026 10:19:52 +0200
Subject: [PATCH] brief-yoctoprojectqs/index.rst: refresh bitbake-setup
 outputs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-bitbake-setup-refresh-v1-1-18ea82f38ef3@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM2wqDMBCE4VeRve5CYqhCX6X0IoexroKVbJSC+
 O5N28uPYf6DFFmgdGsOythF5bVU2EtDcfTLEyypmlrTdqa3hoOU4GewomwrZwwZOvI1uZSMs3H
 wjup3rYO8f93742/dwoRYvjE6zw99KLqXeQAAAA==
X-Change-ID: 20260710-bitbake-setup-refresh-5d3dd031cfa3
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5834;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=XTlmJOKTshXn/vrZxNKf7pHIKAGuYtiGif9GzymaNKI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqUKs1/VRsht5O0M4cQqXm6/8ZCNWk+94vzpVBu
 MQ7dvansnqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCalCrNQAKCRDRgEFAKaOo
 NkJSD/49GxVKKjykdvcNRD+XgvS3ImGHwhSnnKlzDJjMYxzJZ7+Kf3JzKW3SCf9FoGtuRw6Y0ev
 hF38Jxysk6WTDXTgAiDzSsNZmkT4mxYbYQAFM/hTH1Co21i+8QvaCtidXG5lppZiMVZkQaPuM7H
 43G6v6mLdurTiHzNd1EDV0CuYDcaaBm78gWnugL2aK2jW32Z/tvqtFK4r0CZolrrp7kPQJHOYol
 CNE3FjlkJEIo+kn0CCGxxiZQXKBT745LCTZmcpKsd6gmntiHYz4ZPGh0AgUvXqkVsEnjtRg1Bws
 xRS4s/dVFdgo9yzSWlGY+pT2f4jIknJ52sy1B0zSTPluHhEB55F6oaqoxOnz2i+W0C0PHz2kwvz
 Rh3OAfIq1E1QkyEvyDUqifYrkWZcsDE1TBq/q8rPrpHnnJs24acw5nmXWrjr4ti9mULryTDGVDw
 8v0SKWDX9mdBEkErxAR2G5cPNvbjoOLb0fd8DX/qCOP+3wEGT5Pm43pMM5G/mVPGcDJ6KC1lcCf
 woOePeFr6g69GM3MMia1S29CHxBuKYW3jXpZn8ZU2VxG7m+im8Pol6O8MNgQkfaPDAkIQotAQwh
 snnYYYxIoXu4o0eBKa/nhkDcjAgD0a3E7pTnUnzLawySmN8vU5wY9cNm/d5gbUtnljX0nzlt2cS
 4Xtmwa2V/eE2n7g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 08:20:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10051

Outputs from bitbake-setup have changed slightly, and our intro document
did not reflect that anymore. Refresh the outputs.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 53 +++++++++++++---------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 3e56b8621..2ffa3a6d8 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -124,15 +124,13 @@ differ from the examples below.
 
    .. code-block:: text
 
-      Available configurations:
-      1. poky-master  Poky - The Yocto Project testing distribution configurations and hardware test platforms
-      2. oe-nodistro-&DISTRO_NAME_NO_CAP;       OpenEmbedded - 'nodistro' basic configuration, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;'
-      3. poky-&DISTRO_NAME_NO_CAP;      Poky - The Yocto Project testing distribution configurations and hardware test platforms, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;'
-      4. oe-nodistro-master   OpenEmbedded - 'nodistro' basic configuration
-      ...
+      Available Configuration Templates:
+      1. oe-nodistro-master   OpenEmbedded - 'nodistro' basic configuration
+      2. oe-nodistro-&DISTRO_NAME_NO_CAP  OpenEmbedded - 'nodistro' basic configuration, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;' (supported until ...)
+      3. poky-master          Poky - The Yocto Project testing distribution configurations and hardware test platforms
+      4. poky-&DISTRO_NAME_NO_CAP         Poky - The Yocto Project testing distribution configurations and hardware test platforms, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;' (supported until ...)
 
-      Please select one of the above configurations by its number:
-      1
+      Please select one of the above configurations by its number: 3
 
    Depending on the choice above, new options can be prompted to further specify
    which configuration to use. For example:
@@ -140,43 +138,40 @@ differ from the examples below.
    .. code-block:: text
 
       Available bitbake configurations:
-      1. poky Poky - The Yocto Project testing distribution
-      2. poky-with-sstate     Poky - The Yocto Project testing distribution with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.
+      1. poky              Poky - The Yocto Project testing distribution
+      2. poky-with-sstate  Poky - The Yocto Project testing distribution with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.
 
-      Please select one of the above bitbake configurations by its number:
-      1
+      Please select one of the above bitbake configurations by its number: 1
 
 #. Choose a target :term:`MACHINE` (for example, ``qemux86-64``):
 
    .. code-block:: text
 
       Target machines:
-      1. machine/qemux86-64
-      2. machine/qemuarm64
-      3. machine/qemuriscv64
-      4. machine/genericarm64
-      5. machine/genericx86-64
+      1. machine/qemux86-64     x86-64 system on QEMU
+      2. machine/qemuarm64      ARMv8 system on QEMU
+      3. machine/qemuriscv64    RISC-V system on QEMU
+      4. machine/genericarm64   Arm64 SystemReady IR/ES platforms
+      5. machine/genericx86-64  x86_64 (64-bit) PCs and servers
 
-      Please select one of the above options by its number:
-      1
+      Please select one of the above options by its number: 1
 
 #. Choose a :term:`DISTRO` (for example, ``poky``):
 
    .. code-block:: text
 
-      Distribution configuration variants:
-      1. distro/poky
-      2. distro/poky-altcfg
-      3. distro/poky-tiny
+      Target distributions:
+      1. distro/poky         Yocto Project Reference Distro
+      2. distro/poky-altcfg  Poky alternative with systemd as init manager
+      3. distro/poky-tiny    Poky alternative optimized for size
 
-      Please select one of the above options by its number:
-      1
+      Please select one of the above options by its number: 1
 
 #. Choose a :term:`bitbake:setup` directory name:
 
    .. code-block:: text
 
-      Enter setup directory name: [poky-master-poky-distro_poky-machine_qemux86-64]
+      Enter setup directory name: [poky-master]
 
    Press Enter to leave it to the default value shown in the brackets, or type a
    custom directory name.
@@ -188,7 +183,7 @@ differ from the examples below.
 
    .. code-block:: console
 
-      $ bitbake-setup init --non-interactive poky-master poky-with-sstate distro/poky machine/qemux86-64
+      $ ./bitbake/bin/bitbake-setup init --non-interactive poky-master poky distro/poky machine/qemux86-64
 
 The ``init`` command creates a new :term:`bitbake:Setup` in the
 :term:`bitbake:top directory`. The default name is derived from the selected
@@ -198,7 +193,7 @@ For the selected options in the above example, this would be:
 
 .. code-block:: text
 
-   poky-master-poky-distro_poky-machine_qemux86-64
+   poky-master
 
 This will be our example configuration in the following sections.
 
@@ -249,7 +244,7 @@ an entire Linux distribution, including the toolchain, from source.
 
     .. code-block:: console
 
-       $ source poky-master-poky-distro_poky-machine_qemux86-64/build/init-build-env
+       $ source poky-master/build/init-build-env
        Poky reference distro build
 
 #.  **Examine Your Current Configuration:** When you set up the build

---
base-commit: b01fb11a4909fe2d3afa6cb01bd7b179429e382c
change-id: 20260710-bitbake-setup-refresh-5d3dd031cfa3


