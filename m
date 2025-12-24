Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084D0E776F5
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123199.1766593925905127120
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CDEet0YV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 54DDA1A23E0
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D1386073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 615E610AB1384;
	Wed, 24 Dec 2025 17:32:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593923; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UgLyueh8X/9Gn33TscFMLN5imSv1eRgr70bb4TR3xC8=;
	b=CDEet0YVnKGhlKgsRzOYRBOzzsbJUSkTWDYitUQUdkGmlo+9jrnuQPFH6jrNkCM5T3fSaZ
	h7/OoU0Ezt3ZGLbKtj4BFphLJdQ49xFcI2tpsepQQn3wV9Iv9DOjX4hVhsl2g6Ef3ZmY+u
	y+itvvO8Hd4d0MH55FoVfAwPZYHe9cZ9vVeqk1WFULj7cUawnM0rUm1SWE8V3ofnteLW5y
	V9HvhaPNglQbodAm9xaTrH1rPv5hG88A6qvSsL+Sd3f8QcNbame+f1g/PxrngZA5xaBJWk
	qF1TWvoynOrOm+iWMVm2VLOodifQlCzvvZA+RCp97+K2PyVTL8mPodzdATOWXw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:50 +0100
Subject: [PATCH 24/53] ref-manual/classes.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-24-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6191;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Wx67zJJweKrxnKziIHi0SdDE/LOGEemZ9NyZy/o0CdE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVrPAT4tXsJOrg1qwpK9A65g1D/tuimBMgOp
 IgV3D0RzweJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVawAKCRDRgEFAKaOo
 NqASD/9dVYCcTZQZu7IvJhXQAEtyv/s7Ae9M+8n5xHLyCT/Sejj3zTydqO9HGdwPhDDB4rX/vM7
 /8FuerEO4zysb3+sccECll+X8TyazUSMy6LiLkZzixoFNp6c5QPHBKfrgv/YicCcMQlHkLjR52B
 RuPHR+4lAioyvVyBZkB8Ir9Gobge9O/mO3wS4TDSDaAf7YKYIuN/TRLwiWvNgG2D4Kdh4ob+v+1
 1dHTA7jVcXU/azGcd8cyIHYv4qy98RMV9hOVSjdBiu8PEBMtAHvHZLlt3zilid30X5LcE9J/azG
 uIFQLqZZ9Gngc4jBzQtcsWID9L2qRH+6C715nP/7K0Z79B+/jyWmJWAvwIbpc3gS3YoyDxs7Sej
 wyUHrPSBXuEY6mOfwZjjsoWlxjGgCq15Ifzlb6v5VyL0jplNIXK94XNw4/8muwfBZXL45EJfTLl
 ddaTsp8H402f+Vz3zk345KI1qtsqVyqO+eRsRxEnTde5E1OQ6l+2JrKMiQTyP+YEEIH9uaoArxA
 revxSwQmGAqTD/1mY7k0u6kIPFndbs3iu/Ojor3+XpALHQUW2oQST3BUNPATJLDQM+toYvcO6kr
 vkLbLctccZgdNafO9xEj8oOzC5gUBUkNzHefUD/K5ABbJRo4b4iNWby7thgMDrUlYnZIV6Tv2uP
 9r6idt7JuW+pnjw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8353

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index eae15fd62..bc98e2575 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -9,12 +9,13 @@ amongst multiple recipe (``.bb``) files. To use a class file, you simply
 make sure the recipe inherits the class. In most cases, when a recipe
 inherits a class it is enough to enable its features. There are cases,
 however, where in the recipe you might need to set variables or override
-some default behavior.
+some default behavior. A class can also be inherit globally (in every recipe)
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
+:term:`OpenEmbedded-Core (OE-Core)`. You can reference the ``.bbclass`` files
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
2.51.0


