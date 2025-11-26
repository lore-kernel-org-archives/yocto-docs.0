Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C381D10F4F
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:20:36 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12702.1764163230049087260
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:20:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EXC3rOCN;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AD8AFC15D79;
	Wed, 26 Nov 2025 13:20:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AE1760721;
	Wed, 26 Nov 2025 13:20:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A71F102F08EB;
	Wed, 26 Nov 2025 14:20:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764163226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w7ugOVrbAGu/fxLzyr8unobVl5/WrYvWFN1jF3XTSK8=;
	b=EXC3rOCN7ST8ZapEjIqIVYjSOPe1hkLpDwGSQKYHo4FMrqARJMXxhRMa5uNnJez/ReLOcZ
	gfria5YFLNEyYdnfzMan6ho3/GJ5qrL/8xfJczBGc5OKKRGFcvIAu+YZL3u7XG5ZPPT6iE
	L5B4hSLBaMZjGPFqCXix66v839m1BVbxD7oQPu5FN40WbJ2ARs4g/lB0BW18zflnErGPsi
	d+DvwSFBze9TEJOcQU2xx5cjZJFlMNTFDLoGh6P/5mnvpw6RG1Ogh3SbJK0Sp7EHvRR9Cg
	3Xm8ioW8xT8K2WC3ZrmTDv5Ju1pTiimdZEdsZy+I9ztZxWE74xY3Xs41Nrmlew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Nov 2025 14:20:24 +0100
Message-Id: <DEINO55V5PAF.PLIBNY18E3YB@bootlin.com>
Subject: Re: [docs] [PATCH v6] ref-manual: Document SPDX 3.0.1 variables
Cc: <peter.marko@siemens.com>, <adrian.freihofer@siemens.com>, "Stefano
 Tondo" <stefano.tondo.ext@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <stondo@gmail.com>, <docs@lists.yoctoproject.org>
References: <20251125135218.55721-1-stondo@gmail.com>
In-Reply-To: <20251125135218.55721-1-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:20:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8142

Hi,

I still can't apply the patch :(

Patch failed at 0001 ref-manual: Document SPDX 3.0.1 variables
error: corrupt patch at line 95
error: could not build fake ancestor

See my other comments below otherwise.

On Tue Nov 25, 2025 at 2:52 PM CET, Stefano Tondo via lists.yoctoproject.or=
g wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Add comprehensive documentation for SPDX-related variables in the
> Yocto reference manual. This includes documenting previously
> undocumented variables and updating existing documentation with
> SPDX 3.0.1 specific information.
>
> New variables documented:
> - SPDX_LICENSES: Path to SPDX license identifier mapping file
> - SPDX_MULTILIB_SSTATE_ARCHS: Architecture list for dependency collection
> - SPDX_UUID_NAMESPACE: Namespace for UUID generation in SPDX documents
>
> Updated existing variables:
> - SPDX_INCLUDE_SOURCES: Added SPDX 3.0.1 format information
> - SPDX_INCLUDE_COMPILED_SOURCES: Clarified relationship with SPDX_INCLUDE=
_SOURCES
>
> Note: The langdale (SPDX 2.2) information was already present in the
> documentation. This patch adds corresponding information for SPDX 3.0.1
> format based on testing with the master branch.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  documentation/ref-manual/variables.rst | 77 ++++++++++++++++++++++++--
>  1 file changed, 72 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index f0a99aafb..8e2a4d8f3 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9000,10 +9000,28 @@ system and gives an overview of their function an=
d contents.
> =20
>           SPDX_INCLUDE_COMPILED_SOURCES =3D "1"
> =20
> -      According to our tests, building ``core-image-minimal`` for the
> -      ``qemux86-64`` machine, enabling this option compared with the
> -      :term:`SPDX_INCLUDE_SOURCES` reduces the size of the  ``tmp/deploy=
/spdx``
> -      directory from 2GB to 1.6GB.
> +      For SPDX 2.2 format (release 4.1 "langdale"), building
> +      ``core-image-minimal`` for the ``qemux86-64`` machine, this option
> +      reduced the size of the ``tmp/deploy/spdx`` directory from 2GB to
> +      1.6GB compared to :term:`SPDX_INCLUDE_SOURCES`, as it includes onl=
y
> +      compiled objects without original source files.
> +
> +      With SPDX 3.0.1 JSON format, enabling this option includes both
> +      compiled sources and original source files (same as
> +      ``SPDX_INCLUDE_SOURCES =3D "1"``), which significantly increases
> +      the SBOM size. For example, with ``core-image-minimal`` on
> +      ``qemux86-64``, the uncompressed SBOM file can grow from hundreds
> +      of megabytes to several gigabytes.
> +
> +      .. note::
> +
> +         SPDX 3.0.1 JSON files are not compressed by default, unlike the
> +         tar.zst format used in SPDX 2.2. You can compress the output
> +         files manually::
> +
> +            zstd core-image-minimal-qemux86-64.rootfs.spdx.json
> +
> +         This typically achieves 94-97% compression ratios.

Sorry, my previous comment was probably not clear. I thought you used a
*built-in* way to compress the resulting JSON file and that it would be wor=
th
mentioning it here.

So I would remove this note, and perhaps contribute to OE-Core to add suppo=
rt
for compression of this file, and then document that (if it doesn't exist
already).

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


