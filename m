Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F07CFD313
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 15:48:48 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19771.1763999323952528543
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Nov 2025 07:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=v/HpnYH5;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8CC634E41862;
	Mon, 24 Nov 2025 15:48:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 622E9606FC;
	Mon, 24 Nov 2025 15:48:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6784010371D33;
	Mon, 24 Nov 2025 16:48:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763999320; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6SsMLYAji3jArvuQV286mCCQV0gozUJXRLR5OQcbQuM=;
	b=v/HpnYH50C0vW901dmnpohAr/jS2eLAaV1aABZ4NEQPiDXtGOvmB9RmllSwsj6GoveQOtx
	i9vIKE/0iszOk09QGGiik2vV8hNJ1/n2nvx/APRpYf+BFUgrGYQabzn+E/zGUeyQafYzfw
	O3bSz5rm2SpfrCmy3cCg9eae9390iD3Bmqy8t7BqZ5eJsLwHDfRy6cXoceqN7qxkzU0CGs
	QxrbJFefVo2e914p/KmIwAErAHK+wXw9KOAYeSrvN3hr/7nELkg+6+lSspSdIpooPGtsYE
	ARpTRWUFVoRZzqhj8oKYQuu43vKIZwG7vJ6JDxSJCmS2CDxkqv3gn2E9beGwMg==
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 16:48:38 +0100
Message-Id: <DEH1KJTN0DXL.1KH0Q0N5KXRGP@bootlin.com>
Cc: "Stefano Tondo" <stefano.tondo.ext@siemens.com>,
 <peter.marko@siemens.com>, <adrian.freihofer@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <stondo@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs][PATCH v2] ref-manual: Document SPDX 3.0.1 variables
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20251114145220.71823-1-stondo@gmail.com>
 <20251114151255.74797-1-stondo@gmail.com>
In-Reply-To: <20251114151255.74797-1-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Nov 2025 15:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8108

Hi,

On Fri Nov 14, 2025 at 4:12 PM CET, Stefano Tondo via lists.yoctoproject.or=
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
> Updated existing variables with SPDX 3.0.1 data:
> - SPDX_INCLUDE_SOURCES: Added concrete SPDX 3.0.1 size data
>   (~260 MB without sources, ~2.5-2.6 GB with sources)
> - SPDX_INCLUDE_COMPILED_SOURCES: Updated with SPDX 3.0.1 format informati=
on
>
> The size information is based on building core-image-minimal for
> qemux86-64 with SPDX 3.0.1 JSON-LD format. The uncompressed SBOM
> file is approximately 260 MB without sources and increases to
> ~2.5-2.6 GB when sources are included (approximately 10x increase).
>
> Note: SPDX 3.0.1 uses uncompressed JSON-LD format by default,
> unlike the tar.zst compression used in SPDX 2.2.
>
> These variables are defined in meta/classes/spdx-common.bbclass.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>
> Changes in v2:
> - Fixed unintended removal of non-SPDX variables (CCACHE_DISABLE,
>   IMAGE_EXTRA_PARTITION_FILES, REQUIRED_*_FEATURES)
> - Fixed unintended change to LAYERDEPENDS description
> - Only SPDX-related variables are now modified
>
>  documentation/ref-manual/variables.rst | 72 +++++++++++++++++++++++---
>  1 file changed, 66 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index a80ef364e..c098227f2 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8962,10 +8962,21 @@ system and gives an overview of their function an=
d contents.
> =20
>           SPDX_INCLUDE_COMPILED_SOURCES =3D "1"
> =20
> -      According to our tests, building ``core-image-minimal`` for the
> -      ``qemux86-64`` machine, enabling this option compared with the
> -      :term:`SPDX_INCLUDE_SOURCES` reduces the size of the  ``tmp/deploy=
/spdx``
> -      directory from 2GB to 1.6GB.
> +      According to our tests on release 4.1 "langdale" (SPDX 2.2 format)=
, building

Did you really test this on langdale, or did you add langdale here because =
it
was mentioned in the other variable definitions?

> +      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling th=
is
> +      option compared with the :term:`SPDX_INCLUDE_SOURCES` reduced the =
size
> +      of the ``tmp/deploy/spdx`` directory from 2GB to 1.6GB.
> +
> +      With SPDX 3.0.1 JSON-LD format, the uncompressed image SBOM file

I'm not sure it's worth mentioning JSON-LD here, as it can add confusion. I
would just go with JSON.

> +      (``core-image-minimal-qemux86-64.rootfs.spdx.json``) is approximat=
ely
> +      **260 MB without sources** (``SPDX_INCLUDE_SOURCES =3D "0"``), and=
 increases to
> +      **~2.5-2.6 GB when sources are included** (either ``SPDX_INCLUDE_S=
OURCES =3D "1"``
> +      or ``SPDX_INCLUDE_COMPILED_SOURCES =3D "1"``). This represents app=
roximately

So SPDX_INCLUDE_COMPILED_SOURCES has the same impact on size compared to
SPDX_INCLUDE_SOURCES? I thought the point of that variable was to optimize
what's included in the file.

> +      a **10x size increase** when including source files.
> +
> +      Note: SPDX 3.0.1 JSON-LD files are not compressed by default, unli=
ke the
> +      tar.zst format used in SPDX 2.2. Compression (e.g. zstd) can signi=
ficantly
> +      reduce the file size.

We could use a ..note :: block here and in the other notes:

"""
.. note::

   SPDX 3.0.1 JSON files are not compressed by default, unlike the tar.zst
   format used in SPDX 2.2. Compression (e.g. zstd) can significantly reduc=
e the
   file size.
"""

Also, how can one enable compression? If you know, it would be worth adding=
 it
the note. Either the way to do it or a link to the variable that controls t=
his.

> =20
>     :term:`SPDX_INCLUDE_SOURCES`
>        This option allows to add a description of the source files used t=
o build
> @@ -8979,8 +8990,8 @@ system and gives an overview of their function and =
contents.
> =20
>           SPDX_INCLUDE_SOURCES =3D "1"
> =20
> -      According to our tests on release 4.1 "langdale", building
> -      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
> +      According to our tests on release 4.1 "langdale" (SPDX 2.2 format)=
,
> +      building ``core-image-minimal`` for the ``qemux86-64`` machine, en=
abling
>        this option multiplied the total size of the ``tmp/deploy/spdx``
>        directory by a factor of 3  (+291 MiB for this image),
>        and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
> @@ -8988,6 +8999,42 @@ system and gives an overview of their function and=
 contents.
>        image), compared to just using the :ref:`ref-classes-create-spdx` =
class
>        with no option.
> =20
> +      With SPDX 3.0.1 JSON-LD format, the uncompressed image SBOM file
> +      (``core-image-minimal-qemux86-64.rootfs.spdx.json``) is approximat=
ely
> +      **260 MB without sources** (default: ``SPDX_INCLUDE_SOURCES =3D "0=
"``),
> +      and increases to **~2.5-2.6 GB when sources are included**
> +      (``SPDX_INCLUDE_SOURCES =3D "1"``). This represents approximately =
a
> +      **10x size increase** when including source files.
> +
> +      Note: SPDX 3.0.1 JSON-LD files are not compressed by default, unli=
ke the
> +      tar.zst format used in SPDX 2.2. Compression (e.g. zstd) can signi=
ficantly
> +      reduce the file size.
> +
> +   :term:`SPDX_LICENSES`
> +      Path to the JSON file containing SPDX license identifier mappings.=
 This
> +      file maps common license names to official SPDX license identifier=
s used
> +      during SBOM generation.
> +
> +      The default value is::
> +
> +         SPDX_LICENSES =3D "${COREBASE}/meta/files/spdx-licenses.json"

I would avoid hardcoding a path in the docs, to decrease the maintenance
effort. Perhaps:

"""
The default value points to a copy of the license mappings defined by SPDX
(https://github.com/spdx/license-list-data) stored in :term:`OpenEmbedded-C=
ore
(OE-Core)`.
"""

Same remark for SPDX_MULTILIB_SSTATE_ARCHS and SPDX_UUID_NAMESPACE.

> +
> +      You can override this variable to use a custom license mapping fil=
e if
> +      your organization uses different license naming conventions.
> +
> +   :term:`SPDX_MULTILIB_SSTATE_ARCHS`
> +      The list of sstate architectures to consider when collecting SPDX
> +      dependencies. This includes multilib architectures when multilib i=
s
> +      enabled.
> +
> +      The default value is::
> +
> +         SPDX_MULTILIB_SSTATE_ARCHS =3D "${SSTATE_ARCHS}"
> +
> +      This variable is used internally by the SPDX generation classes to
> +      ensure all relevant dependencies are included in the SBOM, regardl=
ess
> +      of whether multilib is enabled or not.
> +
>     :term:`SPDX_NAMESPACE_PREFIX`
>        This option could be used in order to change the prefix of ``spdxD=
ocument``
>        and the prefix of ``documentNamespace``. It is set by default to
> @@ -9015,6 +9062,19 @@ system and gives an overview of their function and=
 contents.
>        this option is recommended if you want to inspect the SPDX
>        output files with a text editor.
> =20
> +   :term:`SPDX_UUID_NAMESPACE`
> +      The namespace used for generating UUIDs in SPDX documents. This sh=
ould
> +      be a domain name or unique identifier for your organization to ens=
ure
> +      globally unique SPDX IDs across different builds and organizations=
.
> +
> +      The default value is::
> +
> +         SPDX_UUID_NAMESPACE =3D "sbom.openembedded.org"
> +
> +      You can override this variable to use your organization's domain::
> +
> +         SPDX_UUID_NAMESPACE =3D "sbom.example.com"
> +
>     :term:`SPDXLICENSEMAP`
>        Maps commonly used license names to their SPDX counterparts found =
in
>        ``meta/files/common-licenses/``. For the default :term:`SPDXLICENS=
EMAP`


Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


