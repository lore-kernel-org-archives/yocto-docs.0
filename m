Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BFFE776DE
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123191.1766593918562805266
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IBXtAyMo;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 19CE21A23E2
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4A726073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E62E10AB1378;
	Wed, 24 Dec 2025 17:31:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593916; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9rXbmi+pXbwoBsZf9sie/zVf3pxqpn3q0xT9aueXStw=;
	b=IBXtAyMoVhq7cAT0xk30jw9oWrI7iCKAk6sQc0jYdLBX2qiVQ4Ujqa28v3NNa7Uzp83gak
	IfgZvHuUYF+QOuoa5YYlPxgadz7QKlHhCZmUtDnFmrJspc6RIwfphhf5iMuGGWpYRWqD6e
	0uPpW0KnITKgiecjMb/xC0Naa/vmvJlNwXBre3qNBaEcflklfgvvbaa0Mq0R7c593T5pxq
	COAhrsXjsWkQrdrUze2cViNWjHYQOScqBwtJI97Z24MMla+5OfQ8nGil618TzMgLBr2uBE
	AOGPeWvqGXfFUtw2vm3SmrB05xzbj79yIOX9HUNAcWmyMZIguXBvwMb2Z75Cpg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:40 +0100
Subject: [PATCH 14/53] dev-manual/new-recipe.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-14-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2996;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Ez/DYSVz6JaaGbF1LP3kFPpnvBj8qaqVV6JWU1IkQLY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVpmUsgyScYk1PxoEYyiPviEv1iwRWEybueN
 l6RSEV/rO6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVaQAKCRDRgEFAKaOo
 NsXCD/9iTG7PPKKvgOQTu8MqLyjEcv6hk2oXjRuc1wqAIjPQ6hn08KKCRDDeEp+hEQyZUXYcoMv
 ESP3TEvpJ8PZvRJnKTop924qSAgJ8rVbjLbk8cXTOxG03evdxDR/VrDnjuD/GLxIK8qrnKym/m1
 Bvq/p2oEhJ7wqX7tCo8hF/knQ8KEBszGHplqxO3es/MLA3X/kwUnidEsdD+vm6lx5Y6nUEkqAEZ
 FuB+ept9R42vuDoob4TUjznaMxaBk6aCZWe4yrp5zq32xxlMbCOD9kOR/29ut45Y1L8WbxxqejC
 rvemIlFQ2qn4fjQft9HetSnXW27/nLyZ7do9bA0XYOsVaYZJFo3AMFF0Y+nZ7apmhXqiuULkR5+
 9i878ljnttJEpieS4CByxE2aKiTIqjZiPQ4MnK5SGbfpwI7U/UaDksomrnA8IBd/MCkpV0izs4d
 BiySx1yjBk/5so3emugv5PjcxdKCDGxM0w6tnG3cD+EysaGLrj/JScPln37VJFp/mmFT4g5+zbT
 RtQQRCwiJJ8vv/8sOagpsWSqYlT1Rk9F2SVIP0UmPFRsckNDJBsOkE8h9UepIYPT4RjldHVu14v
 l/xCAqQM6dr8OM9IS9a2TrP1TlxEEiaObHg195sTj3vpeVMch6cJMmJY+fZAwJUQlgg+xy9uTdR
 3BSyXCSfEMyQL4Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8343

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index ee0f6aaf6..38485da7e 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -224,14 +224,14 @@ is to use the ``bitbake-getvar`` utility::
 
    $ bitbake-getvar -r basename WORKDIR
 
-As an example, assume a Source Directory
-top-level folder named ``poky``, a default :term:`Build Directory` at
-``poky/build``, and a ``qemux86-poky-linux`` machine target system.
+As an example, assume a :term:`Source Directory`
+top-level folder named ``work``, a default :term:`Build Directory` at
+``project/build``, and a ``qemux86-poky-linux`` machine target system.
 Furthermore, suppose your recipe is named ``foo_1.3.0.bb``. In this
 case, the work directory the build system uses to build the package
 would be as follows::
 
-   poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
+   project/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
 
 Inside this directory you can find sub-directories such as ``image``,
 ``packages-split``, and ``temp``. After the build, you can examine these
@@ -240,7 +240,7 @@ to determine how well the build went.
 .. note::
 
    You can find log files for each task in the recipe's ``temp``
-   directory (e.g. ``poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0/temp``).
+   directory (e.g. ``project/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0/temp``).
    Log files are named ``log.taskname`` (e.g. ``log.do_configure``,
    ``log.do_fetch``, and ``log.do_compile``).
 
@@ -830,7 +830,7 @@ different ways:
 
    To enable a service using systemd, your recipe needs to inherit the
    :ref:`ref-classes-systemd` class. See the ``systemd.bbclass`` file
-   located in your :term:`Source Directory` section for more information.
+   located in :term:`OpenEmbedded-Core (OE-Core)` section for more information.
 
 Packaging
 =========
@@ -974,8 +974,8 @@ being able to provide the ``virtual/kernel`` item.
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
2.51.0


