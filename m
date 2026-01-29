Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12C3D6103C
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17196.1769700257894529643
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FosmIKXe;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6579D1A2B0C
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3CBD3606FD;
	Thu, 29 Jan 2026 15:24:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B4B0119A885E;
	Thu, 29 Jan 2026 16:24:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=19qBEwJxk89ZRVMrPmHizEc+7MxuLKke5SehpzMSZUc=;
	b=FosmIKXedJxIi3QpQHAYNJ5yjbKfroPaiHYO3BnR0wwGpv48vWmXArBoFsbXxic3ZFyT7s
	ItkOOfWwkXNy2Qe/jAo0neXGWXrUdj3kHjvkCt+pwMb5KSM23WDE/4xKexEg9A0W5mjPAJ
	JQyjHxRtpbsapByPb88q7d/GvQpE3mHDHJhGxanBX9X19UQo4niZHqcfI1m8K1JwHgjT3l
	JS5FKUTdMmgXmd+oItrzCChzmq+E9tBlk8nCo0teZh0bPely9JxsRHAfc2J6iDpNYuPFQ+
	eadrjLHXELp7Fwg2kFjPsSot4e0qeelJ4onreZYvqchpmVDutYvG/hvkL1gZOg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:09 +0100
Subject: [PATCH v3 18/57] dev-manual/wic.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-18-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4399;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0HXfjkZBpeoRpsEn1kLrGsCnWKSz7Xh9Z1x3TBL2RC0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uLXdTk19Pttf5m6NOeUQB9TW3W6uE1rvBg5
 8zr4MVGUd6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7iwAKCRDRgEFAKaOo
 Ns3xD/0a+jZNGWd/EESkgp2hq3TlCVw+7E2qB66C6p0FwGi08fjCbrWmbHaB6PXwabhB8I8Pqw3
 LSVIKGhsusNan4peb5eE3t6aj6K5xn4JOQvML4b1gdc8kgFn8hHUnnj32sVQEG84LiCf56GZtmh
 UnWSXHf5CkJ4CbC8VAhy9yklHElIhUtBCfthjLPYpKdKX60Mbj05mUuxfP7mqU0fWXLMgL8Ttet
 Mypq8DeW0coGrarAEPARtGXS5R3JJrm66pjjhQqGzGJe4KjF5Mi03jrartNUFgQDNOrfy+CDNvy
 DvTfHsDt4skUjbX8F2nJHh1aPdP9KIOhYTkynQ12w7Ff9i9phOoTRpxkzOySE3C1SyYRfsuMbM5
 lrztep0GZcPPWQPekc0ULz9EHWi4rtPpmnE9wCUFT0dnhafsT57vfwzTBXkCWaHZd/6pYzfNklR
 +smiRq930mCRwqMCaBzwDA5nsmYigbQVKqQAta8EfNHbaQb0PWjx3ZfOPbj/ybsebCpzF3qRjsO
 gF1T/JN9xLytXbrw7ZgkWkRKjDJxpHFkT/X3KKwyu+3D1JV++zOrW4mCoM0xBqJjf5fZJYgUjf0
 GcyrWyTL5iqTgfC/ajQQOH1Ki4SUfTeys0/UmIi6fUt+6d61PfnYteuboGs67JEvYuqwF47cnNq
 fW+Bmoq5kkyR1GA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8804

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/wic.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 07170537b..60b08f834 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -276,8 +276,8 @@ existing file provided by the Wic installation. As shipped, kickstart
 files can be found in the :ref:`overview-manual/development-environment:yocto project source repositories` in the
 following two locations::
 
-   poky/meta-yocto-bsp/wic
-   poky/scripts/lib/wic/canned-wks
+   meta-yocto/meta-yocto-bsp/wic
+   openembedded-core/scripts/lib/wic/canned-wks
 
 Use the following command to list the available kickstart files::
 
@@ -342,12 +342,12 @@ partition.
 Source plugins are subclasses defined in plugin files. As shipped, the
 Yocto Project provides several plugin files. You can see the source
 plugin files that ship with the Yocto Project
-:yocto_git:`here </poky/tree/scripts/lib/wic/plugins/source>`.
+:oe_git:`here </openembedded-core/tree/scripts/lib/wic/plugins/source>`.
 Each of these plugin files contains source plugins that are designed to
 populate a specific Wic image partition.
 
 Source plugins are subclasses of the ``SourcePlugin`` class, which is
-defined in the ``poky/scripts/lib/wic/pluginbase.py`` file. For example,
+defined in the ``openembedded-core/scripts/lib/wic/pluginbase.py`` file. For example,
 the ``BootimgEFIPlugin`` source plugin found in the ``bootimg_efi.py``
 file is a subclass of the ``SourcePlugin`` class, which is found in the
 ``pluginbase.py`` file.
@@ -527,8 +527,8 @@ This next example demonstrates that through modification of the
 As mentioned earlier, you can use the command ``wic list images`` to
 show the list of existing kickstart files. The directory in which the
 ``directdisk-gpt.wks`` file resides is
-``scripts/lib/image/canned-wks/``, which is located in the
-:term:`Source Directory` (e.g. ``poky``).
+``scripts/lib/image/canned-wks/``, which is located in
+:term:`OpenEmbedded-Core (OE-Core)`.
 Because available files reside in this directory, you can create and add
 your own custom files to the directory. Subsequent use of the
 ``wic list images`` command would then include your kickstart files.
@@ -542,8 +542,8 @@ The example begins by making a copy of the ``directdisk-gpt.wks`` file
 in the ``scripts/lib/image/canned-wks`` directory and then by changing
 the lines that specify the target disk from which to boot::
 
-   $ cp /home/stephano/yocto/poky/scripts/lib/wic/canned-wks/directdisk-gpt.wks \
-        /home/stephano/yocto/poky/scripts/lib/wic/canned-wks/directdisksdb-gpt.wks
+   $ cp /home/stephano/yocto/openembedded-core/scripts/lib/wic/canned-wks/directdisk-gpt.wks \
+        /home/stephano/yocto/openembedded-core/scripts/lib/wic/canned-wks/directdisksdb-gpt.wks
 
 Next, the example modifies the ``directdisksdb-gpt.wks`` file and
 changes all instances of "``--ondisk sda``" to "``--ondisk sdb``". The
@@ -580,7 +580,7 @@ Computing (nuc) :term:`MACHINE` the
      NATIVE_SYSROOT:               /home/stephano/yocto/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
 
    INFO: The image(s) were created using OE kickstart file:
-     /home/stephano/yocto/poky/scripts/lib/wic/canned-wks/directdisksdb-gpt.wks
+     /home/stephano/yocto/openembedded-core/scripts/lib/wic/canned-wks/directdisksdb-gpt.wks
 
 Continuing with the example, you can now directly ``dd`` the image to a
 USB stick, or whatever media for which you built your image, and boot
@@ -717,7 +717,7 @@ the existing kernel, and then inserts a new kernel:
    kernel::
 
       $ wic cp poky_sdk/tmp/work/qemux86-poky-linux/linux-yocto/4.12.12+git999-r0/linux-yocto-4.12.12+git999/arch/x86/boot/bzImage \
-               poky/build/tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1/vmlinuz
+               build/tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1/vmlinuz
 
    Once the new kernel is added back into the image, you can use the
    ``dd`` command or :ref:`bmaptool

-- 
2.52.0


