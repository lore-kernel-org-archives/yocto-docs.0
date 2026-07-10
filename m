Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C24C44508
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 14:47:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.632.1783694833563336046
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 07:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nCwmmlSj;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E754C1A0F44
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDCE760342
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16B3211BD174C;
	Fri, 10 Jul 2026 16:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783694831; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QV83A6ZC6HnCEbjn4ngY8/tP1xrl3ewRx50b1o9eKdg=;
	b=nCwmmlSjCHufzK//amTfqIrMBut9AWeW6owRYr7IQrSHnYiD7kbqmZO4kEGOXuduuyTRQV
	pQh9ioqIKXYT7bLO1UXIyPq5cwv6fFseFVVCqZVz4TwbAJtdDokxdM1w8PD8C142uRJ9Zr
	Iz7EULKFBLv1SSjs6JAD5pNtF2lL1RSkY2rZ3ahulQ7efhQabcuNtPuVqILq8wdEjv//HM
	W/4GvjK/qyrt/lNhwESTLolUDTyWDs0q8nk/NA3MFTPBiKmZyzMHDsbu6BrwoIJ/x/mYaS
	f/PMRbpSDQfghl8p3al88DU9+ma1TgvhCCgL8E7DE4ibjvvN/TI2XXRfrqbUEw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Jul 2026 16:46:51 +0200
Subject: [PATCH 4/8] docs-wide: fix broken path links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-linkcheck-v1-4-999168371d5e@bootlin.com>
References: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
In-Reply-To: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6622;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=yojsmPUPrVPJEdsJ4t6h9GoenIk0VhwzHJnYXv/UaP8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqUQXqF98S77Pjs6ScE/3HwrB1OMUbJqGpCHByy
 QDY7PxNG8yJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCalEF6gAKCRDRgEFAKaOo
 Nt9QD/9yaPDPfUnDnFXQUHKSjGcFr7hI1bOimykbBtV7JXfusZxdejP5jwOQzO9ZQb6P2NCGUQl
 tg8c1Ft5/Iyty1DJbThyr1eqsDKLrA+DBCem25jeGtCfQ/MavuaHDWkTuyrjT324u+JLjn+xtwQ
 EVSx8E4NQmd+yx/yOtaVByrl0JbwsSFIwCC94FTQrLoSVkxScBlXC/h8/8mWxvccm3jndbH9EPn
 aokPIYqIKVnWzLWYiJpE5WDw8X0Vj9cUCrF/Av6r6mJzXz4g/Fxn59dS7j2HfYMGxdQgOIRq0AU
 p6hEYq6YYjUR7YbebgYA5MnHeq5qNlk0RyR0weoWlLxMNK7a7HlZvT1m75+QK8PrcAR3l3bL8ku
 WvWeMMof4WkN5nqY+iciBm4dsWKx/1NaJkcj7w7FI28ZEU0PUGJqAyBY6+Zmm76q2LkshO+ntDE
 8NKdr7kPp6clXTB75q+VW9aEnkQKySGzAQWpP1Gz27t9MKtghwA1HJ7/UprbAxhyIhJDt8j3eRy
 BLDjqgNEchWW2luyB1inIVlPBmQm3Qd+hpeAG8guVAy7xrL/MH8/Y3msYQAhHC8mFHAgAil3Y3E
 kG02zbG4IUMmeB5kYPJlunZC8UNI0cxKBfnKAf0lTi0vyIn7a2QeexKnPJ8Uv1g3DeLCHeYyPQ8
 DONVfh9OeaGKMgg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10060

Fix link that forget to add a leading '/', by looking at the output of
'grep -E -r --no-filename -o 'href="http.://[^/"]+' | sort | uniq' in
the HTML output.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.0.rst       | 4 ++--
 documentation/migration-guides/release-notes-3.4.2.rst | 2 +-
 documentation/migration-guides/release-notes-6.0.rst   | 6 +++---
 documentation/ref-manual/faq.rst                       | 2 +-
 documentation/ref-manual/variables.rst                 | 6 +++---
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
index eed4b16e7..5ad284600 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -77,7 +77,7 @@ Default :term:`INIT_MANAGER` definition changed to ``systemd``
 --------------------------------------------------------------
 
 The default definition of :term:`INIT_MANAGER` in the :oe_git:`defaultsetup.conf
-<openembedded-core/tree/meta/conf/distro/defaultsetup.conf>` file was changed
+</openembedded-core/tree/meta/conf/distro/defaultsetup.conf>` file was changed
 from ``none`` to ``systemd``.
 
 This means that users of the default distro setup (appearing as the ``nodistro``
@@ -243,7 +243,7 @@ See commit :oecore_rev:`cd9e7304481b24b27df61c03ad73496d18e4d47c` for more infor
 
 All the :ref:`ref-classes-pkgconfig`-related variables, such as
 :term:`PKG_CONFIG_PATH`, are no longer exported in
-:oe_git:`meta/conf/bitbake.conf <bitbake/tree/meta/conf/bitbake.conf>` with the
+:oe_git:`meta/conf/bitbake.conf </bitbake/tree/meta/conf/bitbake.conf>` with the
 :ref:`export <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:Exporting
 Variables to the Environment>` directive.
 
diff --git a/documentation/migration-guides/release-notes-3.4.2.rst b/documentation/migration-guides/release-notes-3.4.2.rst
index a8e05af24..4e98aedb0 100644
--- a/documentation/migration-guides/release-notes-3.4.2.rst
+++ b/documentation/migration-guides/release-notes-3.4.2.rst
@@ -200,7 +200,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: :yocto_git:`meta-mingw`
+-  Repository Location: :yocto_git:`/meta-mingw`
 -  Branch: :yocto_git:`honister </meta-mingw/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.2 </meta-mingw/tag/?h=yocto-3.4.2>`
 -  Git Revision: :yocto_git:`f5d761cbd5c957e4405c5d40b0c236d263c916a8 </meta-mingw/commit/?id=f5d761cbd5c957e4405c5d40b0c236d263c916a8>`
diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index 9ef7e66d9..1ce7d5120 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -225,20 +225,20 @@ New Features / Enhancements in |yocto-ver|
       (:oecore_rev:`722897f96d30e978b20e140419fb044d850f5c74`)
 
    -  The :oe_git:`no-static-libs.inc
-      <openembedded-core/tree/meta/conf/distro/include/no-static-libs.inc>`
+      </openembedded-core/tree/meta/conf/distro/include/no-static-libs.inc>`
       file, disabling most static libraries in various recipes, is now included
       by default in the default distro setup (appearing as the ``nodistro``
       :term:`DISTRO`) (:oecore_rev:`03fc931bfe9ea3fa9f33553e6020cbc067b24291`)
 
    -  The :oe_git:`security_flags.inc
-      <openembedded-core/tree/meta/conf/distro/include/security_flags.inc>`
+      </openembedded-core/tree/meta/conf/distro/include/security_flags.inc>`
       file, adding various security related flags to the default compiler and
       linker, is now included by default in the default distro setup (appearing
       as ``nodistro`` :term:`DISTRO`)
       (:oecore_rev:`4c2d64c10a5b0437ab1ea04df22386f0f95124d1`)
 
    -  The :oe_git:`yocto-space-optimize.inc
-      <openembedded-core/tree/meta/conf/distro/include/yocto-space-optimize.inc>`
+      </openembedded-core/tree/meta/conf/distro/include/yocto-space-optimize.inc>`
       file, adding various space optimization tweaks, is now included by default
       in the default distro setup (appearing as ``nodistro`` :term:`DISTRO`)
       (:oecore_rev:`175fcf9fad699dd122680d3f6961af9bf8487046`)
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index adb5659b7..65d5db5d2 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -22,7 +22,7 @@ System` and :term:`BitBake`. The :term:`metadata` involved to build the
 -  :term:`OpenEmbedded-Core (OE-Core)`, which is hosted at
    :oe_git:`/openembedded-core`.
 
--  :yocto_git:`meta-poky <meta-yocto/tree/meta-poky>`, which defines the
+-  :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>`, which defines the
    ``poky`` distro configuration file (:term:`DISTRO`).
 
 .. note::
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 41d9638fb..12d2e335c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2679,7 +2679,7 @@ system and gives an overview of their function and contents.
    :term:`EFI_ARCH`
       The CPU architecture name within EFI standard. Set in
       :oe_git:`meta/conf/image-uefi.conf
-      <openembedded-core/tree/meta/conf/image-uefi.conf>`.
+      </openembedded-core/tree/meta/conf/image-uefi.conf>`.
 
    :term:`EFI_PROVIDER`
       When building bootable images (i.e. where ``hddimg``, ``iso``, or
@@ -5031,7 +5031,7 @@ system and gives an overview of their function and contents.
 
       You can also find more information by referencing the
       ``conf/templates/default/local.conf.sample.extended``
-      configuration file in :yocto_git:`meta-poky <meta-yocto/tree/meta-poky>`, the :ref:`ref-classes-image`
+      configuration file in :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>`, the :ref:`ref-classes-image`
       class, and the :ref:`ref-classes-kernel` class to see how to use the
       :term:`INITRAMFS_IMAGE` variable.
 
@@ -12241,7 +12241,7 @@ system and gives an overview of their function and contents.
 
       For more information, see
       ``conf/templates/default/local.conf.sample`` in
-      :yocto_git:`meta-poky <meta-yocto/tree/meta-poky>`.
+      :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>`.
 
    :term:`USERADD_DEPENDS`
       Specifies a list of recipes that create users / groups (via

-- 
2.54.0


