Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050F1FD3761
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 14:10:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45918.1772028627635865739
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 06:10:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=G/YjnSG8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7463D1A12E7
	for <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 14:10:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 470F55FDE6
	for <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 14:10:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB0C9103692A6;
	Wed, 25 Feb 2026 15:10:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772028624; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9OHoBEUPWApG7nOOOTVftl+voinrdFAAspBduo+40qY=;
	b=G/YjnSG8xveoIfG63D1r78Kd9GvzS3/8XjUE7hlhHKUuxfiGGt5qKy6F5yFDrpjFm1j4Jq
	Sw9EbqWcd8MYMnzmwt/wi80mCTatlagIFIlrM9Fg8ABGnmSgKxXSLQbtHstnAfGn61X/P8
	9JMfHvylq8rQVhkoJhuKIoFD+tC9TRQO8/dYQgKXLayE4pKvk2uHBm+mY5uNKEUnye1ut1
	IV2eHVuOVHYKff9d2W5qBt+jwliWgePaul5+LAsBKl5YIAObtmyvdQKCXJH4QBNmUch5vR
	X/4SI+S+pRbv1IrVyyVlAi4J0k0GN8UmCQjB5nAdjKni1k36p4rkzxExHpQseg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 15:10:23 +0100
Message-Id: <DGO3PZFM5WDO.3C92IW83D5RXA@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <kamel.bouhara@bootlin.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add SPDX_INCLUDE_KERNEL_CONFIG and
 SPDX_INCLUDE_PACKAGECONFIG
References: <20260225110800.126491-1-kamel.bouhara@bootlin.com>
In-Reply-To: <20260225110800.126491-1-kamel.bouhara@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 14:10:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8989

Hi,

Thanks! This looks good to me.

I've just fixed the alphabetical order in variables.rst locally:

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 2e812d02d..45073d8a0 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9096,31 +9096,6 @@ system and gives an overview of their function and c=
ontents.
       ``qemux86-64``, the uncompressed SBOM file can grow from hundreds
       of megabytes to several gigabytes.
=20
-   :term:`SPDX_INCLUDE_SOURCES`
-      This option allows to add a description of the source files used to =
build
-      the host tools and the target packages, to the ``spdx.json`` files i=
n
-      ``tmp/deploy/spdx/MACHINE/recipes/`` under the :term:`Build Director=
y`.
-      As a consequence, the ``spdx.json`` files under the ``by-namespace``=
 and
-      ``packages`` subdirectories in ``tmp/deploy/spdx/MACHINE`` are also
-      modified to include references to such source file descriptions.
-
-      Enable this option as follows::
-
-         SPDX_INCLUDE_SOURCES =3D "1"
-
-      For SPDX 2.2 format (release 4.1 "langdale"), building
-      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
-      this option multiplied the total size of the ``tmp/deploy/spdx``
-      directory by a factor of 3  (+291 MiB for this image),
-      and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
-      ``tmp/deploy/images/MACHINE`` by a factor of 130 (+15 MiB for this
-      image), compared to just using the :ref:`ref-classes-create-spdx` cl=
ass
-      with no option.
-
-      With SPDX 3.0.1 JSON format, including source files significantly
-      increases the SBOM size (potentially by several gigabytes for typica=
l
-      images).
-
    :term:`SPDX_INCLUDE_KERNEL_CONFIG`
       This option allows exporting the Linux kernel configuration
       (the contents of the ``.config`` file) into the recipe's SPDX
@@ -9164,6 +9139,31 @@ system and gives an overview of their function and c=
ontents.
       the SPDX SBOM to determine which optional features were
       enabled or disabled in a given build.
=20
+   :term:`SPDX_INCLUDE_SOURCES`
+      This option allows to add a description of the source files used to =
build
+      the host tools and the target packages, to the ``spdx.json`` files i=
n
+      ``tmp/deploy/spdx/MACHINE/recipes/`` under the :term:`Build Director=
y`.
+      As a consequence, the ``spdx.json`` files under the ``by-namespace``=
 and
+      ``packages`` subdirectories in ``tmp/deploy/spdx/MACHINE`` are also
+      modified to include references to such source file descriptions.
+
+      Enable this option as follows::
+
+         SPDX_INCLUDE_SOURCES =3D "1"
+
+      For SPDX 2.2 format (release 4.1 "langdale"), building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      this option multiplied the total size of the ``tmp/deploy/spdx``
+      directory by a factor of 3  (+291 MiB for this image),
+      and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
+      ``tmp/deploy/images/MACHINE`` by a factor of 130 (+15 MiB for this
+      image), compared to just using the :ref:`ref-classes-create-spdx` cl=
ass
+      with no option.
+
+      With SPDX 3.0.1 JSON format, including source files significantly
+      increases the SBOM size (potentially by several gigabytes for typica=
l
+      images).
+
    :term:`SPDX_LICENSES`
       Path to the JSON file containing SPDX license identifier mappings.
       This file maps common license names to official SPDX license

Antonin

