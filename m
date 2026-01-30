Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305C1E6BF0F
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 13:29:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10077.1769779779781360309
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 05:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gJbM+VR5;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9C9D94E42352
	for <docs@lists.yoctoproject.org>; Fri, 30 Jan 2026 13:29:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D66B6075A;
	Fri, 30 Jan 2026 13:29:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBDBB119A8885;
	Fri, 30 Jan 2026 14:29:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769779777; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j00d/AXjUOopfkToCXZFxrl1+8qKz6QbbISfdBpWr5s=;
	b=gJbM+VR5Lt4KzJGyQZ89UKal1H8+SYyS4IRX3DFNqcgCbH6zReYTvdLibO3qLE7V2d9Qp9
	jKXUYW7++DH1etuoXVNf9jRLMYPX4T840G9dy98lt8zlclgNQgVR0IAEG7xC4pRocnYJDR
	mpgynYDwOQK3KDBNkcg/GLN98XUpmb1E264UyTAtlLro2RiVPsgCds8bA0rmfp52vDwPVA
	IHsuNvF2gnaCrmCKmsI67y6GtJbKHKVYzrGexAhzqaqSXCP8cRdfd7pL7JloWPxQuVXUDe
	ADOo5VqVoNmEqzpW80gEiQhpJ4SOJxflegUaP5N/pRBCATaykCZf+7jD6jM2kA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 14:29:34 +0100
Message-Id: <DG1YKKEBYK3R.1RDFPILOIHIOP@bootlin.com>
Subject: Re: [docs] [PATCH v2] ref-manual: Document updated UBOOT_CONFIG
 flow
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <reatmon@ti.com>, <docs@lists.yoctoproject.org>
References: <20260127225706.25153-1-reatmon@ti.com>
In-Reply-To: <20260127225706.25153-1-reatmon@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 30 Jan 2026 13:29:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8848

Hi,

Thanks, I'll merge this patch with the following typo fixes:

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 595b90f87..a7c92e326 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10692,7 +10692,7 @@ system and gives an overview of their function and =
contents.
       the "sd..." configurations define an individual name for
       :term:`UBOOT_CONFIG_BINARY`.
=20
-      For more information on how the :term:`UBOOT_CONFIG` is handled, see=
 the
+      For more information on how the :term:`UBOOT_CONFIG` variable is han=
dled, see the
       :ref:`ref-classes-uboot-config` class.
=20
    :term:`UBOOT_CONFIG_BINARY`
@@ -10725,15 +10725,15 @@ system and gives an overview of their function an=
d contents.
          UBOOT_CONFIG_FRAGMENTS[foo] =3D "frag1 frag2"
          UBOOT_CONFIG_FRAGMENTS[bar] =3D "frag3"
=20
-      Specify a list of fragments from the source tree that should be comb=
ined
+      It specifies a list of fragments from the source tree that should be=
 combined
       with the defconfig from :term:`UBOOT_CONFIG` that are used during ``=
do_configure()``
-      to configure the build.  These fragments are located in same=20
+      to configure the build.  These fragments are located in same
       ``${S}/configs/`` directory as the defconfig.
=20
       This option is not required and you only need to specify it for
       configs that need them.
=20
-      For more information on how the :term:`UBOOT_CONFIG_FRAGMENTS` is ha=
ndled, see the
+      For more information on how the :term:`UBOOT_CONFIG_FRAGMENTS` varia=
ble is handled, see the
       :ref:`ref-classes-uboot-config` class.
=20
    :term:`UBOOT_CONFIG_IMAGE_FSTYPES`
@@ -10750,8 +10750,8 @@ system and gives an overview of their function and =
contents.
       This option is not required and you only need to specify flag settin=
gs for
       configs that need them.
=20
-      For more information on how the :term:`UBOOT_CONFIG_IMAGE_FSTYPES` i=
s handled, see the
-      :ref:`ref-classes-uboot-config` class.
+      For more information on how the :term:`UBOOT_CONFIG_IMAGE_FSTYPES`
+      variable is handled, see the :ref:`ref-classes-uboot-config` class.
=20
    :term:`UBOOT_CONFIG_MAKE_OPTS`
       This variable cannot be set to a value in a config, it is a placehol=
der

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


