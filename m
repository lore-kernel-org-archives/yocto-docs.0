Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30840CA6C97
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5807.1769501975418578803
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DgEP4mTk;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E8BA01A2A6B
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF8F4606F5;
	Tue, 27 Jan 2026 08:19:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8943119A868B;
	Tue, 27 Jan 2026 09:19:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501973; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=19qBEwJxk89ZRVMrPmHizEc+7MxuLKke5SehpzMSZUc=;
	b=DgEP4mTkHGT5NhkJzKxnjKL/iIHMmqolpm2we2PRHWLuARUtfMw44b94lq+gagvYyiuEWK
	7TQ7HILjm5UWPy7eNgTBxsLfE5aMPCIYvjUWG4rFkUiF6uLCQmc5FmJbg8zGogcnLunhGK
	GKnO63/7OT8Opx9LX2A6lF8fZmSYkJyT1NLfS8+jp+oAiSUAzNVQnOreDY68aBNy61GC63
	XsEjB+KVxs6mUJDDtDhkiXWC0Tnl08gzPjYKeAjj86yltrWAfw1eVV9oa479fD2kiArRVd
	BeSOYp3OtRizBHzXTKz8TiVBBkBRS2msBjenQT9IIEcywHuqmvsY8ISnRCVkJA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:13 +0100
Subject: [PATCH v2 18/56] dev-manual/wic.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-18-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4399;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0HXfjkZBpeoRpsEn1kLrGsCnWKSz7Xh9Z1x3TBL2RC0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUBpBCIKMWykP7BDyHcK5luuZDLlM4wfMA5k
 rgH1OIxI2yJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AQAKCRDRgEFAKaOo
 NsApD/93DTNkYlRv6gb42Jh2FiwdRK/8nLI66Al0lEaccolwpsHXA47GGiDWUlDZEdnYxiMKNcm
 miKVLpdW8CaHW/sWhO+UBadfpz+VmcXfswZQuCV4F4ijc1VeZ6UuhozWgqNSmzMvwXR4x3HxGbD
 Ap1L4gc9HWcvPVef/7zYGX0Y1FsdLOgaViRpyX5nsrPMkHgF2/DhFwQ3oF+7TVDLSGCKWgMiisZ
 ZRrajc7TaAW7/gzAPLlai1dRYm9BEJRav2hptm3Tv1hnHUg1/DSW9DveKLJsIXXXNdireHYgxo9
 Sj/ol5XKGaz2RHWX8quvmw0vZgnKrNmn4Vt/5o4YobJ1/0YlCAtSa4GEhIYIeeBpKNp4yaOhqgf
 DOGbRveRVvy44L130GIMfi307/12Q0P5nyR3iJn2IkN16m/Ji2zj/JVFh3sOzvWp9llScQ81ys+
 TlGkd8BEZzqXAmCSewCWmuBnQpG/VM9fbVbT0RepfV2JFRIdwWxjbg3d8fkdiffR+bS2+00iwIw
 eiO5IMwKFeGGL7ZffuVF+3LMi5t+cInMklqIRRnCp+mRmCPS6yWcT4PptJWovG85n0uAMmNMVdW
 IBauQeyCnrFrc3Pr8IP2GM8W8Ikp1s8lnkuQHiXZ05mU4UfKR0NPodxJD3ypYyWrMI0VbStPfyW
 nXzLKD2R+45GbRA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8679

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


