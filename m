Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810DDD6102E
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17190.1769700255067400729
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DGAplW3W;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8B9CF4E4231D
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 60932606FD;
	Thu, 29 Jan 2026 15:24:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA31D119A8853;
	Thu, 29 Jan 2026 16:24:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700252; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X8nddArgurHkE5hFd8tjN/qVOtCJ1lM90P18lGTfB1k=;
	b=DGAplW3WmYzEZIhc2Cy43BThOcvhOhegscpvFim7y7sZPcOHUFO2k4iOXV6a7vF0ndzFR6
	ikdEWKY6INM6Kiun22KtnbUEyi1pOQ8IOI0Gka1ophOE8tNlTtKbCK27FGMGEY8fHwH3xQ
	SWZt1cpHabAq5KV7T5ehg15FE90k6Wrn8s4VvdKLIu+A/8yHA2AmCSnOicAH1RCwSD/XZ6
	q4qfIgSdy7SSTdSQZkUA3txb1Wg0oyBJWzcmAlK/D1TRJjI7BscnfR3BMGVqpeEcQL1POI
	iFTVddVeyMKcAmaDxPmq0+p+tAeI/9ZgRYdVNyE+0NQ2BIhNqPW8D4vRV2oVeA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:05 +0100
Subject: [PATCH v3 14/57] dev-manual/new-recipe.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-14-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3428;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=czdOcqgQKIdqxN6QdV4G36hZbh6bpldmxYwhlLsD/FM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uLK0e6pUyA2n0M2lqxjB6MLvTocDWRTkm+7
 TMPc/0UpgCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7iwAKCRDRgEFAKaOo
 NoPcEAC0SydE8PYqc1Unn/25S27nhEQRDIu4YFVxINtzzh2BvgSnUPNL/4PU/qd3nkp41mL6Cvh
 QSJbWR7cyJqcJTRPBOWv5JgHEfj9npc9r79IVeIlsJSKvrGWQukZFZ1s5zVhJZaG2epAyM0o5D/
 t6IVhGqxZ2oDzKIMgiDB4d+JckQOPPnK9QDHANeaKzfeJIKx6kRAXocN6hCYCL3ivTsutbxm6B4
 XH+ceLUgVziUCTJ36cSAarcOBaHXyDOU0twuAClFztNVftMXM53q3m3t0ojGW7ADz+v7LQA+UEp
 ZLwMJ7P+uslVCj+FbFThQJNuuoOqbsOG64ydx2eaFehDRP2zeSMLIvhulF1t+3RaCqCcSANTXKm
 l+nybomEHkrdxBtF+jGpUzOMRAt/Hj6ZLQZovTEw+76hnEK4HTNWHUyF9+12cDMYl+zrHwz1WLE
 L7tfGS0E74UgDYwMuKNrzTR691+LyqyWl3LTR23Lkf5i7THAi0hsXHIIxyxdijINaxMie4ApVng
 3k/LAqxJrzgRIcHlc7tMA2U20UGyn+vGTzhBOawMBKasm6KoybUYyJuXHcnS1YQoTh/4NFBK2Dw
 +C6eUc4wR+zpFGhX4UQ83jAaAuY9gAI9OVqHDGwyyBa/QTmrxcrrVV+7esNhmWG75uuR8D6eAb4
 1bJaNbs/eUMyOtw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8800

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index ee0f6aaf6..5e9498afc 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -224,14 +224,23 @@ is to use the ``bitbake-getvar`` utility::
 
    $ bitbake-getvar -r basename WORKDIR
 
-As an example, assume a Source Directory
-top-level folder named ``poky``, a default :term:`Build Directory` at
-``poky/build``, and a ``qemux86-poky-linux`` machine target system.
+As an example, assume a :term:`Source Directory`
+top-level folder named ``bitbake-builds``, a default :term:`Build Directory` at
+``bitbake-builds/build``, a ``cortexa57`` :term:`PACKAGE_ARCH`, ``poky``
+:term:`DISTRO` and ``linux`` as :term:`TARGET_OS`.
+
 Furthermore, suppose your recipe is named ``foo_1.3.0.bb``. In this
 case, the work directory the build system uses to build the package
 would be as follows::
 
-   poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
+   bitbake-builds/build/tmp/work/cortexa57-poky-linux/foo/1.3.0
+
+.. note::
+
+   This covers the case when the :term:`PACKAGE_ARCH` variable is set to its
+   default value, :term:`TUNE_PKGARCH`. This variable is sometimes set to
+   :term:`MACHINE_ARCH`. See the documentation of the :term:`PACKAGE_ARCH`
+   variable for more information.
 
 Inside this directory you can find sub-directories such as ``image``,
 ``packages-split``, and ``temp``. After the build, you can examine these
@@ -240,7 +249,7 @@ to determine how well the build went.
 .. note::
 
    You can find log files for each task in the recipe's ``temp``
-   directory (e.g. ``poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0/temp``).
+   directory (e.g. ``bitbake-builds/build/tmp/work/cortexa57-poky-linux/foo/1.3.0/temp``).
    Log files are named ``log.taskname`` (e.g. ``log.do_configure``,
    ``log.do_fetch``, and ``log.do_compile``).
 
@@ -830,7 +839,7 @@ different ways:
 
    To enable a service using systemd, your recipe needs to inherit the
    :ref:`ref-classes-systemd` class. See the ``systemd.bbclass`` file
-   located in your :term:`Source Directory` section for more information.
+   located in :term:`OpenEmbedded-Core (OE-Core)` section for more information.
 
 Packaging
 =========
@@ -974,8 +983,8 @@ being able to provide the ``virtual/kernel`` item.
 Now comes the time to actually build an image and you need a kernel
 recipe, but which one? You can configure your build to call out the
 kernel recipe you want by using the :term:`PREFERRED_PROVIDER` variable. As
-an example, consider the :yocto_git:`x86-base.inc
-</poky/tree/meta/conf/machine/include/x86/x86-base.inc>` include file, which is a
+an example, consider the :oe_git:`x86-base.inc
+</openembedded-core/tree/meta/conf/machine/include/x86/x86-base.inc>` include file, which is a
 machine (i.e. :term:`MACHINE`) configuration file. This include file is the
 reason all x86-based machines use the ``linux-yocto`` kernel. Here are the
 relevant lines from the include file::

-- 
2.52.0


