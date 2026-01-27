Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864AACA6CA2
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6055.1769501979648793188
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=U3apCaRz;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1AF4AC211CD
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2441E606F5;
	Tue, 27 Jan 2026 08:19:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06F8D119A8691;
	Tue, 27 Jan 2026 09:19:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NJRoEhvXUcXqe4SBxQDow6KNXUmkJjx3x5ek92NyWic=;
	b=U3apCaRzQOQlxQ34pu4BuxTNNjjexafWVeVZNybI+/r9RfaPEeCdFsG27orALXHW1s6CyT
	5Uotgs54fv+J/qSURe/w+15TKR3fXydHaLmhVoEpTtgrX8hQmTR5ZdWRKjKAnUJ/ASBTnV
	Tx7CsiBULnSA48bDn8E7SnGBtxLSnZY9OJn06eCLEvRVyKyBvateS/5sTFLlSHPjwsXkiL
	R68n6SI4BMja2mNSy9RxsE1uaGFqQK78Ur/5Dx5WwHlZDIAUZqYdXio3oaClYcehVdloqu
	9EHZSALBqVCvjoCGhHBU3vciMCzicZBFR3RPqAESgbEGP5kbnFWLKsaYiRFnqw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:19 +0100
Subject: [PATCH v2 24/56] ref-manual/classes.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-24-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6248;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=nY8TXckqhUv8F6yLaHugu/ItnyI/YLncG19SeUfwYW4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUCeyd5J5juhx2ijnbeyje4DOKgaFFYGCdCC
 EOgoUYM/1yJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AgAKCRDRgEFAKaOo
 Nrc9D/9AhrfR7aZNpWRKq4e/J8Wb+DE15wNNAyR7f60/CpCxfrQjR3+9CPw7Ax75hquBqZrOd7o
 yJnTkX8HvQeot6N50+wR9S1zYS3eyPItc/iUupI/DQykdLh7bdRHzd6w0a+dYnd0WFlv0e6ALR3
 M2xo1AcEaYUUrcd0pTqtNUd/sYkSRvHWCXHAJV8HhQ8uw+2M+aD1HvWFipnZbDEbc1Yj+oYH0kc
 rOTNFo1FykaEWmz1D/MrXLq8mM7YADvPWmlHk0m+/kkCws37SP/ut7YIeedc4N+EIpOL2XUBI6b
 xr6ySVlYH3UlPBWfWQ3GlxnqbugPIadbrue29v/+TobJ8D7cHN/9MGc6pzmETU8vwSuBMHQLxAu
 Bggq0WBDxMYbXmyqqTPujJccgcR7xLTE5ymblVbX2ej6KHIlucJa6YcGZf7+Z0DDBsDh3y7Tq6E
 91iPx5jNRxzBlHaZVZGbjMOPpgpgHOWQKbfU4EsooIBBmZvtAlMebVa4kvqYg5O+ENGZ5SNWCrw
 F68dJy+lWIWX8NAlXV/15yONAbjxFtPvNlsJTPHgy2Hi0VgLBv0WJuKVV0xj1B8E4F1MbLJ7ROQ
 m1enJaeK/UWLW5+Pa5n3lg5fOMbWAo42t6QE65C2D/dvQQOLtcyturr7JU+Pz6SSoywwKBlnlZT
 dAjD8v3QHiM7vig==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8685

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 2e219a59c..ef05372f0 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -9,12 +9,13 @@ amongst multiple recipe (``.bb``) files. To use a class file, you simply
 make sure the recipe inherits the class. In most cases, when a recipe
 inherits a class it is enough to enable its features. There are cases,
 however, where in the recipe you might need to set variables or override
-some default behavior.
+some default behavior. A class can also be inherited globally (in every recipe)
+with the :term:`INHERIT` variable.
 
 Any :term:`Metadata` usually found in a recipe can also be
 placed in a class file. Class files are identified by the extension
-``.bbclass`` and are usually placed in one of a set of subdirectories
-beneath the ``meta*/`` directory found in the :term:`Source Directory`:
+``.bbclass`` and are usually placed in one of the following subdirectories
+of a :term:`layer`:
 
   - ``classes-recipe/`` - classes intended to be inherited by recipes
     individually
@@ -28,9 +29,9 @@ in :term:`BBPATH` using the same method by which ``.conf``
 files are searched.
 
 This chapter discusses only the most useful and important classes. Other
-classes do exist within the ``meta/classes*`` directories in the Source
-Directory. You can reference the ``.bbclass`` files directly for more
-information.
+classes do exist within the ``meta/classes*`` directories of
+:term:`OpenEmbedded-Core (OE-Core)`. You can refer to the ``.bbclass`` files
+directly for more information.
 
 .. _ref-classes-allarch:
 
@@ -338,8 +339,8 @@ The :ref:`ref-classes-cargo_c` class can be inherited by a recipe to generate
 a Rust library that can be called by C/C++ code. The recipe which inherits this
 class has to only replace ``inherit cargo`` by ``inherit cargo_c``.
 
-See the :yocto_git:`rust-c-lib-example_git.bb
-</poky/tree/meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb>`
+See the :oe_git:`rust-c-lib-example_git.bb
+</openembedded-core/tree/meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb>`
 example recipe.
 
 .. _ref-classes-cargo_common:
@@ -602,8 +603,9 @@ inherited globally from a configuration file::
 
    INHERIT += "cve-check"
 
-To filter out obsolete CVE database entries which are known not to impact software from Poky and OE-Core,
-add following line to the build configuration file::
+To filter out obsolete CVE database entries which are known not to impact
+software from :term:`OpenEmbedded-Core (OE-Core)`, add the following line to the
+build configuration file::
 
    include cve-extra-exclusions.inc
 
@@ -827,7 +829,7 @@ See these variables for more information:
 :term:`PV`,
 
 For more information on the :ref:`ref-classes-externalsrc` class, see the comments in
-``meta/classes/externalsrc.bbclass`` in the :term:`Source Directory`.
+``meta/classes/externalsrc.bbclass`` in :term:`OpenEmbedded-Core (OE-Core)`.
 For information on how to use the :ref:`ref-classes-externalsrc` class, see the
 ":ref:`dev-manual/building:building software from an external source`"
 section in the Yocto Project Development Tasks Manual.
@@ -1009,7 +1011,7 @@ this class is controlled by the mandatory :term:`GO_IMPORT` variable, and
 by the optional :term:`GO_INSTALL` and :term:`GO_INSTALL_FILTEROUT` ones.
 
 To build a Go program with the Yocto Project, you can use the
-:yocto_git:`go-helloworld_0.1.bb </poky/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
+:oe_git:`go-helloworld_0.1.bb </openembedded-core/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
 recipe as an example.
 
 .. _ref-classes-go-mod:
@@ -3471,10 +3473,10 @@ is one reason we don't use static linking for our :ref:`ref-classes-native`
 binaries.
 
 With this class enabled, a tarball containing a pre-built C library is
-downloaded at the start of the build. In the Poky reference distribution this is
+downloaded at the start of the build. In :term:`OpenEmbedded-Core (OE-Core)` this is
 enabled by default through :oe_git:`meta/conf/distro/include/yocto-uninative.inc
 </openembedded-core/tree/meta/conf/distro/include/yocto-uninative.inc>`. Other distributions that do
-not derive from Poky can also "``require conf/distro/include/yocto-uninative.inc``"
+not derive from :term:`Poky` can also "``require conf/distro/include/yocto-uninative.inc``"
 to use this. Alternatively if you prefer, you can build the uninative-tarball
 recipe yourself, publish the resulting tarball (e.g. via HTTP) and set
 :term:`UNINATIVE_URL` and :term:`UNINATIVE_CHECKSUM` appropriately. For an
@@ -3516,7 +3518,7 @@ To use this class, you need to define a number of variables:
 These variables list alternative commands needed by a package, provide
 pathnames for links, default links for targets, and so forth. For
 details on how to use this class, see the comments in the
-:yocto_git:`update-alternatives.bbclass </poky/tree/meta/classes-recipe/update-alternatives.bbclass>`
+:oe_git:`update-alternatives.bbclass </openembedded-core/tree/meta/classes-recipe/update-alternatives.bbclass>`
 file.
 
 .. note::
@@ -3549,7 +3551,7 @@ that contain system services that should be run under their own user or
 group, you can use these classes to enable creation of the user or
 group. The :oe_git:`meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
 </openembedded-core/tree/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb>`
-recipe in the :term:`Source Directory` provides a simple
+recipe in :term:`OpenEmbedded-Core (OE-Core)` provides a simple
 example that shows how to add three users and groups to two packages.
 
 The :ref:`useradd_base <ref-classes-useradd>` class provides basic functionality for user or

-- 
2.52.0


