Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8B0CA6C92
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:36 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5801.1769501967196018424
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SWiuCEPN;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4A39BC211CD;
	Tue, 27 Jan 2026 08:19:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 522F5606F5;
	Tue, 27 Jan 2026 08:19:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EE80119A867E;
	Tue, 27 Jan 2026 09:19:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501964; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KrGSLod6/pF3KhZZTNTuzimytOCaLoIcbvZ9NCgkBj4=;
	b=SWiuCEPNi/1JjVRsfcVMqfr4IUWvroJURjORt+fQU/ZP4WCh4opnMgNCSAD3v7vDHfuMhV
	d8bI7SAFd3TM4p5gD7MilJCWiLcvgLWZ0ALcBD9IN3xV3FhLSBcLxDJor1Bo+k7hxOGMtn
	Nh1Bj0S9nNc9NcqiJl7Ky1JmvsXX/pWhOsAfI0Iryqy7CW29AneJkhJGouHAguPVo54nDX
	ZjcoRm4uqI0lXQdLUzKqLkm7VPtABCM0OTzZ41NV+gBoTCguumie8uTPXjJnii8Jc0tl/Q
	moqVMNgGs5OM/0kJGA24nRE9hjouiavJ1nHEki654AyO4u+j32Z8zqt0GV7tQw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:02 +0100
Subject: [PATCH v2 07/56] dev-manual/building.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-7-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4753;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ryvQVG/eyTh6kzdj/GUta8S5C90K1sgHkpde0Vbck1U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHT/nDjpd3b7swRhgO3tir+CvIzB1qX88DEfq
 ysTdWvpmJyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh0/wAKCRDRgEFAKaOo
 NqUBD/sEFnJ5FDr1vU5sTtZMXFs91/wOXTlHZHitivQzeKnZd4ulqTOCTxqxhCoI+qD4nT0PUEh
 3QbkDaTI6YN7ZB8d4sMb/Jg04aheDrMauE06zraC4aaxlyC2UV3AI774N9mqxE3jbKG9N2Nwedu
 u1McA8ejsay5Ar2j0BjSgrNRID4dy6Y+ymWjDg2cGRcn0FgL8xXg3O9lannUlJRio4PLQQcHHQE
 /BBpfSUXJdT7aHT3cEE+KRlhtueusAO5C4YLB0jV9S4A8mLmIVXQWT9sL9QlvhiYOCD5A2Iqs1u
 GMwT0sb8AfnCQptRFdXRVZ5ONxm0Xz0AtgZKux1K82OYvGO26ljTt8aH+yG3fZf9WiLJcY4Ma30
 EtNsAcMN4G86SpZbvsII425LzuyLB9cPX6wfvlSyR0B2FMnCfLL7+EPxEqBqcFpfAHMjMRyE6MI
 ESU4A69waYMCb8mBOg38HM5B+vR0jk0Tho3kuLI++nNsmjiGgx7xe4lDdCr7Y05w3FgQtBAeNFK
 fZB2G7qxajfo8TrlVeyTgrGMnmEJcQ+cerGgt7RVlBxjS1gTrBgm/6H0PNZiKpsH+NFEGVMVYRt
 7PH6bgjkNZ4ysjueG91yvCSKu4nwQiryjvDaloCUzq6BJ/bYEUs0Nv8CbpDU+UsK0ux4F6BP3fr
 IpZ9N+45//ah8vg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8668

Remove references to the Poky repository, replace by OpenEmbedded-Core
in most cases.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/building.rst  | 40 +++++++---------------------------
 documentation/ref-manual/fragments.rst |  2 ++
 2 files changed, 10 insertions(+), 32 deletions(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 60ad11f52..c153eb9de 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -51,32 +51,9 @@ The following figure and list overviews the build process:
    Yocto Project*: See the ":doc:`/dev-manual/start`" section for options on how to get a
    build host ready to use the Yocto Project.
 
-#. *Initialize the Build Environment:* Initialize the build environment
-   by sourcing the build environment script (i.e.
-   :ref:`structure-core-script`)::
-
-      $ source oe-init-build-env [build_dir]
-
-   When you use the initialization script, the OpenEmbedded build system
-   uses ``build`` as the default :term:`Build Directory` in your current work
-   directory. You can use a `build_dir` argument with the script to
-   specify a different :term:`Build Directory`.
-
-   .. note::
-
-      A common practice is to use a different :term:`Build Directory` for
-      different targets; for example, ``~/build/x86`` for a ``qemux86``
-      target, and ``~/build/arm`` for a ``qemuarm`` target. In any
-      event, it's typically cleaner to locate the :term:`Build Directory`
-      somewhere outside of your source directory.
-
-#. *Make Sure Your* ``local.conf`` *File is Correct*: Ensure the
-   ``conf/local.conf`` configuration file, which is found in the
-   :term:`Build Directory`, is set up how you want it. This file defines many
-   aspects of the build environment including the target machine architecture
-   through the :term:`MACHINE` variable, the packaging format used during
-   the build (:term:`PACKAGE_CLASSES`), and a centralized tarball download
-   directory through the :term:`DL_DIR` variable.
+#. *Make Sure Your Configuration is Correct*: Use :ref:`bitbake-config-build <ref-bitbake-config-build-qf>` to
+   define the :term:`MACHINE` or :term:`DISTRO`, and open your
+   :ref:`structure-build-conf-site.conf` file to set site-specific settings.
 
 #. *Build the Image:* Build the image using the ``bitbake`` command::
 
@@ -88,8 +65,8 @@ The following figure and list overviews the build process:
 
    The target is the name of the recipe you want to build. Common
    targets are the images in ``meta/recipes-core/images``,
-   ``meta/recipes-sato/images``, and so forth all found in the
-   :term:`Source Directory`. Alternatively, the target
+   ``meta/recipes-sato/images``, and so forth all found in
+   :term:`OpenEmbedded-Core (OE-Core)`. Alternatively, the target
    can be the name of a recipe for a specific piece of software such as
    BusyBox. For more details about the images the OpenEmbedded build
    system supports, see the
@@ -127,7 +104,7 @@ Follow these steps to create an :term:`Initramfs` image:
 
 #. *Create the Initramfs Image Recipe:* You can reference the
    ``core-image-minimal-initramfs.bb`` recipe found in the
-   ``meta/recipes-core`` directory of the :term:`Source Directory`
+   ``meta/recipes-core`` directory in :term:`OpenEmbedded-Core (OE-Core)`
    as an example from which to work. The ``core-image-minimal-initramfs`` recipe
    is based on the :ref:`initramfs-framework <dev-manual/building:Customizing an
    Initramfs using \`\`initramfs-framework\`\`>` recipe described below.
@@ -366,9 +343,8 @@ memory used for decompressing the kernel and for the ``__init__``
 functions.
 
 To help you see where you currently are with kernel and root filesystem
-sizes, you can use two tools found in the :term:`Source Directory`
-in the
-``scripts/tiny/`` directory:
+sizes, you can use two tools found in :term:`OpenEmbedded-Core (OE-Core)`
+in the ``scripts/tiny/`` directory:
 
 -  ``ksize.py``: Reports component sizes for the kernel build objects.
 
diff --git a/documentation/ref-manual/fragments.rst b/documentation/ref-manual/fragments.rst
index 42fba41e9..9449f4648 100644
--- a/documentation/ref-manual/fragments.rst
+++ b/documentation/ref-manual/fragments.rst
@@ -22,6 +22,8 @@ System` core repositories.
    :doc:`/dev-manual/creating-fragments` section of the Yocto Project Development
    Tasks Manual.
 
+.. _ref-bitbake-config-build-qf:
+
 ``bitbake-config-build`` Quick Reference
 ========================================
 

-- 
2.52.0


