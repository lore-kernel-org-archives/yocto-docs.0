Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392BFE776CA
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123723.1766593921718427503
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xBSHA8Vz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 243E01A23E0
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9BFC6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F10A210AB1377;
	Wed, 24 Dec 2025 17:31:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593919; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Gf7yvHLtcjT3PBFqbIxQ8c/I43uDHaOIQrS1Ftro02M=;
	b=xBSHA8Vz+sNLhvTHlhm9xVGdCSwOlUD8ZblGAv/ZPJdksODyBWjsJDsnaGJoimvEBf8iXn
	Txn9QFUp0pv1UowvB9mDevs9fr/EARC5T38sQNkNAIFuUEWnEqzGIHNhfsAMymx6yQVPFN
	KkpA3eV9Z7/fEPkHAloa3UEc745VZTQLoTcCBJAeVh5n5GwXBxKjvJlceZKGy1gjfoz1Y7
	gYr5fA9GRNLkloNcHthBwXVxHpWoPb8jTpDHi8lCy6BzIjrIaAckuTeET3xTPRQnWJOZXC
	7LpjSG5rWoOanPyMDjNPNLWEP1bmbArawz/Ywelnq2XPwN+vb14sDCXdv1x5kA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:44 +0100
Subject: [PATCH 18/53] dev-manual/wic.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-18-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4336;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ZMGJafFLdydo+qP/KjcapQWxeXXebc3LKsw8reGIWlQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVphMgbhzH//l77lBQ+1A6SOIU6imGytQ/tf
 u4g+PlHcg+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVaQAKCRDRgEFAKaOo
 Ni4uD/sG0PtqM+Af5OJ25Sj5qGAmmzPtBhVZvVpud81VNxKCRhYmFRarLrXgyEGTP1RwzCIvOcb
 /XJa6h5f8phEKG4MA+j0NE64whibJwRQ7RJo8E4LVV1Ip0OAZb4ZUJURmn7UyTISbX8MJmmCIiv
 30kcLtT5IPX4UO72W8/asy/kRO2OZ2oB339HEk0RCNgsPiPGbAXOw1c6CNfsFzis9aEko5Rpv3a
 uK6IDyEzdxNV5CuwmlHmNvASmJIve3mRS3tR5pEoJrZCiM/NDsFENLcQUOTHN98Ju2Vr2Cdlox9
 NnSKo3vQ9K5vHwcX3xnBLT7JaLe2UYmPW1PuPt3qPt6Wsr9AzYUgPUQCFjRw5G5ZiboPejeSUKh
 EzqA6Pw1E/ggqa/uWlXpj9KClcbf+58RU2fcskbctt1QItOYmAPxDy1rTuUXn+tCHIftJBW37Dp
 2L7VTTMSX7oIyUUPSmnEK+ytERdKe35P2Jbvxs4lUJ7VzrEd0lbDu5MmMeyWAOrbOAelThuNIWS
 l1RSNpLCFZ5Idedx+c4hUOYvZR3FtrFAgIC+tdfZR8ynewT2JvSB5O8rzf7ik+UOSSvgAfiUa6h
 dZIleRtfb5JRY2dxf70o7NqeKUeVuGNGy5iD7akqZ4BqJkV6/GiGn1DCBAeAfQpFZMqU3Afz48g
 XfkFvBIbs+9rjwQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8347

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/wic.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 07170537b..a7c4ca06a 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -276,8 +276,8 @@ existing file provided by the Wic installation. As shipped, kickstart
 files can be found in the :ref:`overview-manual/development-environment:yocto project source repositories` in the
 following two locations::
 
-   poky/meta-yocto-bsp/wic
-   poky/scripts/lib/wic/canned-wks
+   meta-yocto/meta-yocto-bsp/wic
+   meta-yocto/scripts/lib/wic/canned-wks
 
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
2.51.0


