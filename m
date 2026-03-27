Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8C010ED676
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 13:05:29 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71745.1774616727767955404
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Mar 2026 06:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=eE9esXgQ;
 dkim=pass header.i=@valla.it header.s=default header.b=Sho7zw7M;
 spf=pass (domain: valla.it, ip: 185.56.87.3, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-b1c0.prod.antispam.mailspamprotection.com; s=arckey; t=1774616728;
	 b=WTuNJb237XGiBh+HfmFx7bA0UYQfUTpSVHtruD4Nbpr1h8FfPge/J7a/pCEBD7XnSJ+Hx9HNHJ
	  zmvyzRd4569DLgq9SRzuLeFUuz8+LprDXcZe1CZo8vRlaSdCUVcyQkXrXAFgOHbnnAZZBUDnbg
	  tWA3RTLylLTHXr7U7YhiFHoXqw24xEN3abhWHp1kjyMbhX5UpFhOQoBAwkPwFm0Q+IZfWVObSs
	  oKUqkU2LqUVSyeewVd4uCgWaqDFKexRK95sMZemjgSd6RMYm1NH6CHKZRRlaCyUqlB47VqE+pX
	  BT4b47CuOQ7sTyyVgiR0WGY9+7rK/YdsOWqGKoRrkEDBuQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-b1c0.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-b1c0.prod.antispam.mailspamprotection.com; s=arckey; t=1774616728;
	bh=hppP2WoZfDrILU1xkpbVEGHWwc+c/kemwBXw/bqepQY=;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	  DKIM-Signature:DKIM-Signature;
	b=LKhLKvqSBnavlvrgMWhQ/0OO13le5A6iE4yI9j4AfeZ70wRU1/bzSzPWsiuF7hefLr1rRkasFR
	  hTonPqvpt8Im3QCZO1ZtJbA7ROizje1hm24Z1vXyV9ZAq5SskAC/UaxEcsR/4r/Mm5/sDe8C6q
	  ZzZtTDT2+2sTBCvxKiBZaWFyb6RoAr7EpXKg3YmzePo79Y5fmWZ1S5bzq955oXXKKvFycR7gIM
	  de46vKw0+MSA1n5N5jwSAsfLJQl4/TgRy99vunsTD1125OWN24Ji4wb37TSCDYE8soGDD5pq9T
	  ts49DAhmyaO3HMqGCht1zMpBKqSX3Dk3VMWWivxskz28gQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:List-Unsubscribe:Content-Type;
	bh=YKGFa4EofyfHre15BUj4rKzsVZJqR1zxSWr3EEJX0QQ=; b=eE9esXgQ8dezKg/K0aSr1P6d/h
	afKJZeTR8ckN+50buws0xNe5gxqi3QMTL0DyzM/OAOwfJme6z9f7QvdaKXlpMRjYCBOK+Dkg6kjb+
	muVKLIQPEb0I5MLGfbjL7bTIZl3We1G6GtR7yrkwfcpMm5me8mPqgCTJnvj9eSww9F4M=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-b1c0.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1w66sN-0000000484u-2Bsr
	for docs@lists.yoctoproject.org;
	Fri, 27 Mar 2026 13:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=YKGFa4EofyfHre15BUj4rKzsVZJqR1zxSWr3EEJX0QQ=; b=Sho7zw7McJuwhA1/7mcNUGtVhd
	gsqGUIslt2aJocI7HLDbv+Co0agOE8scRHiCblXa+3r0f2xTQyxUuYB7pqmB611BG6KLN7qo066ei
	2buXNqP1wFrCLyhWIgWjFAyY0BXnWYpv7PBpaiMmfi5lVMliEynma+HHaVKsnnZgZY64=;
Received: from [95.248.129.24] (port=63033 helo=bywater.fritz.box)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1w66sH-000000001SC-0IwN;
	Fri, 27 Mar 2026 13:05:17 +0000
From: Francesco Valla <francesco@valla.it>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Francesco Valla <francesco@valla.it>
Subject: [PATCH v2] ref-manual: document the usage of FIT_LOADABLES
Date: Fri, 27 Mar 2026 14:03:50 +0100
Message-ID: <20260327130349.843041-2-francesco@valla.it>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: ce23c4d3df557464cbbe86055aa471da
X-AntiAbuse: ID - ce23c4d3df557464cbbe86055aa471da
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1w66sN-0000000484u-2Bsr-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-b1c0.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Mar 2026 13:05:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9139

Add documentation for the new logic and variables that can be used to
add additional arbitrary loadables to a FIT image.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 documentation/ref-manual/classes.rst   |  16 ++-
 documentation/ref-manual/variables.rst | 178 +++++++++++++++++++++++++
 2 files changed, 192 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index dc131be9fb93..ec30d6417cb0 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1420,12 +1420,13 @@ Its behavior is mainly controlled by the following variables:
 ====================
 
 The :ref:`ref-classes-kernel-fit-image` class provides support to pack a kernel image,
-device trees, a U-boot script, and an :term:`Initramfs` into a single FIT image.
+device trees, a U-boot script, an :term:`Initramfs` and additional loadables into a
+single FIT image.
 In theory, a FIT image can support any number of kernels, U-boot scripts,
 :term:`Initramfs`, and device trees.
 However, :ref:`ref-classes-kernel-fit-image` currently only supports
 limited usecases: just one kernel image, an optional U-boot script,
-an optional :term:`Initramfs`, and any number of device trees.
+an optional :term:`Initramfs`, and any number of device trees and loadables.
 
 The FIT image is created by a recipe which inherits the
 :ref:`ref-classes-kernel-fit-image` class.
@@ -1535,6 +1536,17 @@ allow configuration:
    At run-time, U-boot's boot command can be configured to load the boot script
    from the FIT image and source it.
 
+-  Multiple additional loadables (e.g.: firmwares for auxiliary processors) can
+   be added to the FIT image created by :ref:`ref-classes-kernel-fit-image`.
+   The addition of loadables is optional. The loadables are specified using the
+   :term:`FIT_LOADABLES` variable; each of them can then be configured through
+   flags on the following variables: :term:`FIT_LOADABLE_ARCH`,
+   :term:`FIT_LOADABLE_COMPRESSION`, :term:`FIT_LOADABLE_DESCRIPTION`,
+   :term:`FIT_LOADABLE_ENTRYPOINT`, :term:`FIT_LOADABLE_FILENAME`,
+   :term:`FIT_LOADABLE_LOADADDRESS`, :term:`FIT_LOADABLE_OS` and
+   :term:`FIT_LOADABLE_TYPE`. All loadables specified in this way will be added
+   to all configurations present in the FIT image.
+
 -  The FIT image generated by the :ref:`ref-classes-kernel-fit-image` class is signed when the
    variables :term:`UBOOT_SIGN_ENABLE`, :term:`UBOOT_MKIMAGE_DTCOPTS`,
    :term:`UBOOT_SIGN_KEYDIR` and :term:`UBOOT_SIGN_KEYNAME` are set
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9e0c5b0835a2..e5dc838fa011 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3510,6 +3510,184 @@ system and gives an overview of their function and contents.
       The default value is set to "x509" by the
       :ref:`ref-classes-kernel-fit-image` class.
 
+   :term:`FIT_LOADABLE_ARCH`
+      Architecture the loadables defined in :term:`FIT_LOADABLES`; the value
+      will be used for the ``arch`` property of the loadable.
+      If no value is defined for a specific loadable, the kernel architecture
+      will be used.
+
+      This variable cannot be used directly, but only defining flags on it.
+
+      Example::
+
+         FIT_LOADABLES = "foo"
+         FIT_LOADABLE_ARCH[foo] = "arm"
+
+   :term:`FIT_LOADABLE_COMPRESSION`
+      Compression type for the loadables defined in :term:`FIT_LOADABLES`; the
+      value will be used for the ``compression`` property of the loadable.
+      If no value is defined for a specific loadable, its ``compression``
+      property will be set to ``none``.
+
+      This variable cannot be used directly, but only defining flags on it.
+
+      Example::
+
+         FIT_LOADABLES = "foo"
+         FIT_LOADABLE_COMPRESSION[foo] = "gzip"
+
+      .. note::
+
+         The binary should already be compressed, as no compression is
+         performed by the :ref:`ref-classes-kernel-fit-image` class.
+
+   :term:`FIT_LOADABLE_DESCRIPTION`
+      Description for the loadables defined in :term:`FIT_LOADABLES`; the value
+      will be used for the ``description`` property of the loadable.
+      If no value is defined for a specific loadable, its description will be
+      set to the loadable name followed by a space plus the string ``loadable``.
+
+      This variable cannot be used directly, but only defining flags on it.
+
+      Example::
+
+         FIT_LOADABLES = "foo"
+         FIT_LOADABLE_DESCRIPTION[foo] = "Foo firmware binary"
+
+   :term:`FIT_LOADABLE_ENTRYPOINT`
+      Entry point for the loadables defined in :term:`FIT_LOADABLES`; the value
+      will be used for the ``entry`` property of the loadable.
+      If no value is defined for a specific loadable, the ``entry`` property
+      will be omitted.
+
+      This variable cannot be used directly, but only defining flags on it.
+
+      Example::
+
+         FIT_LOADABLES = "foo"
+         FIT_LOADABLE_ENTRYPOINT[foo] = "0x80234000"
+
+   :term:`FIT_LOADABLE_FILENAME`
+      Filename (or relative path) for the loadables defined in
+      :term:`FIT_LOADABLES`; this will be used to search for the binary to
+      include and is therefore mandatory for each loadable. Binary files to be
+      included need to be located in :term:`DEPLOY_DIR_IMAGE`.
+
+      This variable cannot be used directly, but only defining flags on it.
+
+      Example::
+
+         FIT_LOADABLES = "foo"
+         FIT_LOADABLE_FILENAME[foo] = "foo-firmware.bin"
+
+   :term:`FIT_LOADABLE_LOADADDRESS`
+      Load address for the loadables defined in :term:`FIT_LOADABLES`; the
+      value will be used for the ``load`` property of the loadable.
+      This is mandatory for each loadable.
+
+      This variable cannot be used directly, but only defining flags on it.
+
+      Example::
+
+         FIT_LOADABLES = "foo"
+         FIT_LOADABLE_LOADADDRESS[foo] = "0x80230000"
+
+   :term:`FIT_LOADABLE_OS`
+      Operating system for the loadables defined in :term:`FIT_LOADABLES`; the
+      value will be used for the ``os`` property of the loadable.
+      If no value is defined for a specific loadable, the ``os`` property will
+      be set to ``linux``.
+
+      This variable cannot be used directly, but only defining flags on it.
+
+      Example::
+
+         FIT_LOADABLES = "foo"
+         FIT_LOADABLE_OS[foo] = "linux"
+
+   :term:`FIT_LOADABLE_TYPE`
+      Type for the loadables defined in :term:`FIT_LOADABLES`; the value will
+      be used for the ``type`` property of the loadable.
+      If no value is defined for a specific loadable, the ``type`` property
+      will be set to ``firmware``.
+
+      This variable cannot be used directly, but only defining flags on it.
+
+      Example::
+
+         FIT_LOADABLES = "foo"
+         FIT_LOADABLE_TYPE[foo] = "firmware"
+
+   :term:`FIT_LOADABLES`
+      Space-separated list of loadables to add to a FIT image in addition to
+      regular ones (kernel, initramfs, dtsb etc.).
+      Values specified here will be used as node names inside the FIT image;
+      all of them will be included in all configurations by using the
+      ``loadables`` property.
+
+      For each loadable specified in this variable, additional parameters can be
+      defined using :term:`FIT_LOADABLE_ARCH`, :term:`FIT_LOADABLE_COMPRESSION`,
+      :term:`FIT_LOADABLE_DESCRIPTION`, :term:`FIT_LOADABLE_ENTRYPOINT`,
+      :term:`FIT_LOADABLE_FILENAME`, :term:`FIT_LOADABLE_LOADADDRESS`,
+      :term:`FIT_LOADABLE_OS` and :term:`FIT_LOADABLE_TYPE`.
+
+      This variable is used by the :ref:`ref-classes-kernel-fit-image` class and
+      is empty by default.
+
+      For example, the following configuration adds as loadables a TF-A BL31
+      firmware and a (compressed) TEE firmware, to be loaded respectively at
+      0x204E0000 and 0x96000000::
+
+         FIT_LOADABLES = "atf tee"
+
+         FIT_LOADABLE_FILENAME[atf] = "bl31.bin"
+         FIT_LOADABLE_DESCRIPTION[atf] = "TF-A Firmware"
+         FIT_LOADABLE_TYPE[atf] = "tfa-bl31"
+         FIT_LOADABLE_ARCH[atf] = "arm64"
+         FIT_LOADABLE_OS[atf] = "arm-trusted-firmware"
+         FIT_LOADABLE_LOADADDRESS[atf] = "0x204E0000"
+         FIT_LOADABLE_ENTRYPOINT[atf] = "0x204E0000"
+
+         FIT_LOADABLE_FILENAME[tee] = "tee.bin.gz"
+         FIT_LOADABLE_COMPRESSION[tee] = "gzip"
+         FIT_LOADABLE_TYPE[tee] = "tee"
+         FIT_LOADABLE_OS[tee] = "tee"
+         FIT_LOADABLE_LOADADDRESS[tee] = "0x96000000"
+
+      and will be converted to the following FIT source::
+
+         images {
+                 atf {
+                         description = "TF-A Firmware";
+                         type = "tfa-bl31";
+                         compression = "none";
+                         data = /incbin/("<DEPLOY_DIR_IMAGE>/bl31.bin");
+                         arch = "arm64";
+                         os = "arm-trusted-firmware";
+                         load = <0x204E0000>;
+                         entry = <0x204E0000>;
+                 };
+                 tee {
+                         description = "tee loadable";
+                         type = "tee";
+                         compression = "gzip";
+                         data = /incbin/("<DEPLOY_DIR_IMAGE>/tee.bin.gz");
+                         arch = "arm64";
+                         os = "tee";
+                         load = <0x96000000>;
+                 };
+         };
+
+         configurations {
+                 default = "<my-board>.dtb";
+                 <my-board>.dtb {
+                         description = "1 Linux kernel, FDT blob, loadables";
+                         kernel = "kernel-1";
+                         fdt = "<my-board>.dtb";
+                         loadables = "atf", "tee";
+                 };
+         };
+
    :term:`FIT_MKIMAGE_EXTRA_OPTS`
       When inheriting the :ref:`ref-classes-kernel-fit-image`, the
       :term:`FIT_MKIMAGE_EXTRA_OPTS` variable allows passing extra options to
-- 
2.53.0


