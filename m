Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F317FFEEF34
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 12:59:07 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19376.1774358696365720177
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 06:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=d70HNpyZ;
 dkim=pass header.i=@valla.it header.s=default header.b=qFfc7qqO;
 spf=pass (domain: valla.it, ip: 185.56.87.3, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-d2fs.prod.antispam.mailspamprotection.com; s=arckey; t=1774358696;
	 b=tZyYrqoc7s91RCKxp/i06wO/cr894dsNkhf/+oknDikKVv6TJjmYmyfbyw0QibphjhSnZ1DoNW
	  MxgygdP76A2nyQG6rp/ybaGrzOPvNt7qpkcrtLhoTtyvp+TvZ61RzckUe/Onwcc7ucM971Q2iP
	  cM0oP+582hUKMrquvff0aCFhom4NxA1gFgBa2hWp3AaBvL2l06mUMIzP/13u+FTpNxOc+TUdIn
	  8RYZ5vNRYzUnRRZPd69jHWwk8cANtpaAQS1Hfr3WmDb0u7dKcwaJmMCtUe1YhQsJaetQ6HSsG8
	  LVzAmqkjWp0VVdwwdl8Cf2jo7TRtOqPD0XQEotSAw1slBg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-d2fs.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-d2fs.prod.antispam.mailspamprotection.com; s=arckey; t=1774358696;
	bh=bH3B8I73uCrf1jDvl+q86E9LN6Kqcv9PJDul8Csqqik=;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	  DKIM-Signature:DKIM-Signature;
	b=YBYjp8pIC5sV6O04jI97Z3J1/HWYw1fbnoheTzaxUCTQreKj0LSvLgZU8nmrXar8J4EVB9U14V
	  ztCPc0Ak5oJrDiCXzYm67vBToKSi4Q5jtWA/g2TDrlR165jbo8oazTl9I09Fb6H7vMzaHZ/hxn
	  RgHdJfFYgIRA9+gKA+NXtt7psoA51zVKIHEZ2w0ntUxtOikH2Ik+fTwgXtVyA7WuHrw48AjPan
	  vhpx2I4gnNT2EfvhOgwg2MOhAvXK1BpzWKX6gfOZmUCzJtq83jG5W9cphIERM7NR3zj96Bqz7T
	  ifSWSF4VJOmTvpQ+rf87wmcU3w6yYLR3NZPbr4o5UzEhSA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:List-Unsubscribe:Content-Type;
	bh=vQVjMqjDkfoG1MmNlZMZz3yCMUtN+WndFeuHE4qIUTw=; b=d70HNpyZJz11x8LqH265u9HstZ
	d0Z0fnVGCFLuV7TtyzjxXHnayLvPc4R8KFidm729E0/ELpDMUq5hEHCuf4BXFMKK2uxhLC5GxrPiB
	c4SObPnYZkK8Y2PZRO0E9JrEB7wFGHtBo0rSZ3MV0hyE2pEZ5n1M2MCzcLp2mKFdvE3Q=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-d2fs.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1w51kZ-00000008YuY-2re3
	for docs@lists.yoctoproject.org;
	Tue, 24 Mar 2026 13:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=vQVjMqjDkfoG1MmNlZMZz3yCMUtN+WndFeuHE4qIUTw=; b=qFfc7qqO2ita97rZzEmjCh1H32
	mGYrPyZQiJnf3rOMpXla3zm4DX3cuBoUqpk9B2tdWJ4X+BJ/PGw+jj8J31H37lbZx80nnGtaMoX1X
	G81CYrO3siUWU/szB10wbaE69qmJWOMdmh+GpT72ecHRlHo2uARVtkvhoxmjlSB4WGhA=;
Received: from [95.248.129.24] (port=64432 helo=bywater.fritz.box)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1w51kS-000000000Kw-2rR8;
	Tue, 24 Mar 2026 13:24:44 +0000
From: "Francesco Valla" <francesco@valla.it>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Francesco Valla <francesco@valla.it>
Subject: [PATCH RESEND] ref-manual: document the usage of FIT_LOADABLES
Date: Tue, 24 Mar 2026 14:21:26 +0100
Message-ID: <20260324132125.310341-2-francesco@valla.it>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 7cc824a307392aaa903ea77b3b7094e4
X-AntiAbuse: ID - 7cc824a307392aaa903ea77b3b7094e4
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1w51kZ-00000008YuY-2re3-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-d2fs.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Apr 2026 12:59:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9185

Add documentation for the new logic and variables that can be used to
add additional arbitrary loadables to a FIT image.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 documentation/ref-manual/classes.rst   |  16 +-
 documentation/ref-manual/variables.rst | 193 +++++++++++++++++++++++++
 2 files changed, 207 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a3a4df1dbfa4..b23c680cbde3 100644
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
index 03154a8667ef..67c1b0e989c9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3510,6 +3510,199 @@ system and gives an overview of their function and contents.
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
+      Compresssion for the loadables defined in :term:`FIT_LOADABLES`; the
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
+         The binary to be included will be considered as already compressed, no
+         operation will be performed on it.
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
+         FIT_LOADABLE_LOADADDRESS[foo] = "foo-firmware.bin"
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
+         FIT_LOADABLE_COMPRESSSION[tee] = "gzip"
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
+                         hash-1 {
+                                 algo = "sha256";
+                         };
+                 };
+                 tee {
+                         description = "tee loadable";
+                         type = "tee";
+                         compression = "gzip";
+                         data = /incbin/("<DEPLOY_DIR_IMAGE>/tee.bin.gz");
+                         arch = "arm64";
+                         os = "tee";
+                         load = <0x96000000>;
+                         hash-1 {
+                                 algo = "sha256";
+                         };
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
+                         hash-1 {
+                                 algo = "sha256";
+                         };
+                         signature-1 {
+                                 algo = "sha256,rsa2048";
+                                 key-name-hint = "temp";
+                                 padding = "pkcs-1.5";
+                                 sign-images = "kernel", "fdt", "loadables";
+                         };
+                 };
+         };
+
    :term:`FIT_MKIMAGE_EXTRA_OPTS`
       When inheriting the :ref:`ref-classes-kernel-fit-image`, the
       :term:`FIT_MKIMAGE_EXTRA_OPTS` variable allows passing extra options to
-- 
2.53.0


