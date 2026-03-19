Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94851075278
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 08:47:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6476.1773910072034658420
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 01:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=J/QSTQJo;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 30BF34E42713;
	Thu, 19 Mar 2026 08:47:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 00BE15FDEB;
	Thu, 19 Mar 2026 08:47:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15FA51045094D;
	Thu, 19 Mar 2026 09:47:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773910069; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1X1Vo+LZO5dIKEF+0P623Iu3UXa1upJAVSPwpgXf3lM=;
	b=J/QSTQJoeoDivWB5/ZQcEqFZex+OOzLHeftM9Owm+HFuuwZq7ZwcFO7q0Co96/HWAb3evS
	Ibxs0eg/hYKdyY1TkQDmtAPASyjfr7C2MOJDQbsyi3wjZUqeCxbjcYP1vf8Xg9jATAmDAv
	1eBoOEdbzFLKrpsbkJX/tHXfEqV0d8bVvyBhKm+Kvyq8T8n6pb8ZouqH5htgT5hpK0braP
	KPCFSsZfQh/GYlFjzM8BsGBNrPfOm4MkdjmprdsLJ6eVhTIq3tu9HfCairmwK0/bpe2GM/
	mGe+76mC3qGrIYH3s9zgYaNCM8Lt0jUukkf/FOeyeLsRY94NAbEmt+mLlHqIBg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 09:47:47 +0100
Message-Id: <DH6MMYTW9EGG.1Y32J8PZPX2T8@bootlin.com>
Subject: Re: [docs][PATCH] ref-manual/dev-manual: document new SPDX
 variables and capabilities
Cc: <Peter.Marko@siemens.com>, <adrian.freihofer@siemens.com>,
 <jpewhacker@gmail.com>, <stefano.tondo.ext@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <stondo@gmail.com>, <docs@lists.yoctoproject.org>
References: <20260317085735.32664-1-stondo@gmail.com>
In-Reply-To: <20260317085735.32664-1-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Mar 2026 08:47:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9097

Hi,

On Tue Mar 17, 2026 at 9:57 AM CET, Stefano Tondo via lists.yoctoproject.or=
g wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Document the new variables and features introduced by the SPDX
> enrichment patch series merged in OE-Core:
>
> New variables in ref-manual/variables.rst:
> - SPDX_FILE_EXCLUDE_PATTERNS: regex-based file exclusion from SBOM
> - SPDX_IMAGE_SUPPLIER: supplier agent for image SBOMs
> - SPDX_SDK_SUPPLIER: supplier agent for SDK SBOMs
> - SPDX_PACKAGE_SUPPLIER: supplier agent for individual packages
> - SPDX_INVOKED_BY: agent that invoked the build
> - SPDX_ON_BEHALF_OF: agent on whose behalf the build runs
>
> Updated dev-manual/sbom.rst:
> - Add bullet points for file exclusion patterns, supplier
>   information, and ecosystem-specific PURL enrichment via
>   bbclasses (cargo_common, go-mod, pypi, npm, cpan)
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  documentation/dev-manual/sbom.rst      | 13 +++++
>  documentation/ref-manual/variables.rst | 78 ++++++++++++++++++++++++++
>  2 files changed, 91 insertions(+)
>
> diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual=
/sbom.rst
> index 95303ed..6aa771e 100644
> --- a/documentation/dev-manual/sbom.rst
> +++ b/documentation/dev-manual/sbom.rst
> @@ -64,6 +64,19 @@ more information in the output :term:`SPDX` data:
> =20
>  -  Add archives of these source files themselves (:term:`SPDX_ARCHIVE_SO=
URCES`).
> =20
> +-  Exclude specific files from the SPDX output using Python regular expr=
essions
> +   (:term:`SPDX_FILE_EXCLUDE_PATTERNS`).
> +
> +-  Attach supplier information to the image SBOM, SDK SBOM, or individua=
l
> +   packages (:term:`SPDX_IMAGE_SUPPLIER`, :term:`SPDX_SDK_SUPPLIER`,
> +   :term:`SPDX_PACKAGE_SUPPLIER`).
> +
> +-  Enrich source downloads with ecosystem-specific Package URLs (PURLs),=
 using
> +   the :ref:`ref-classes-cargo_common`, :ref:`ref-classes-go-mod`,
> +   :ref:`ref-classes-pypi`, :ref:`ref-classes-npm`, and
> +   :ref:`ref-classes-cpan` classes to automatically populate PURL identi=
fiers
> +   for the corresponding language ecosystems.
> +

No mention of SPDX_INVOKED_BY/SPDX_ON_BEHALF_OF/SPDX_INCLUDE_BITBAKE_PARENT=
_BUILD?

>  Though the toplevel :term:`SPDX` output is available in
>  ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`, ancil=
lary
>  generated files are available in ``tmp/deploy/spdx/MACHINE`` too, such a=
s:
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 9e0c5b0..6f1b5a9 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9063,6 +9063,19 @@ system and gives an overview of their function and=
 contents.
>             }
>           ],
> =20
> +   :term:`SPDX_FILE_EXCLUDE_PATTERNS`
> +      A space-separated list of Python regular expressions used to exclu=
de files
> +      from the SPDX output. Files whose paths match any of the patterns =
(via

I assume this variable only makes sense with SPDX_INCLUDE_SOURCES is set, r=
ight?

Maybe you could make that clear by saying it in the first sentence explicit=
ly?

"""
A space-separated list of Python regular expressions used to exclude files
from the SPDX output when :term:`SPDX_INCLUDE_SOURCES` is enabled.
"""

> +      ``re.search``) will be filtered out from the generated SBOM.
> +
> +      By default this variable is empty, meaning no files are excluded.
> +
> +      Example usage::
> +
> +         SPDX_FILE_EXCLUDE_PATTERNS =3D "\.patch$ \.diff$ /test/ \.pyc$ =
\.o$"
> +
> +      See also :term:`SPDX_INCLUDE_SOURCES`.
> +
>     :term:`SPDX_INCLUDE_COMPILED_SOURCES`
>        This option allows the same as :term:`SPDX_INCLUDE_SOURCES` but in=
cluding
>        only the sources used to compile the host tools and the target pac=
kages.
> @@ -9161,6 +9174,41 @@ system and gives an overview of their function and=
 contents.
>        increases the SBOM size (potentially by several gigabytes for typi=
cal
>        images).
> =20
> +   :term:`SPDX_IMAGE_SUPPLIER`
> +      The base variable name describing the Agent (organization or perso=
n) who
> +      supplies the image SBOM. When set, the supplier will be attached t=
o all
> +      root elements of the image SBOM using the ``suppliedBy`` property.
> +
> +      This variable acts as a prefix for a group of sub-variables that t=
ogether
> +      describe the supplier agent. For example, setting
> +      ``SPDX_IMAGE_SUPPLIER =3D "SPDX_IMAGE_SUPPLIER"`` enables the foll=
owing
> +      variables:
> +
> +      - ``SPDX_IMAGE_SUPPLIER_name`` =E2=80=94 display name of the suppl=
ier
> +      - ``SPDX_IMAGE_SUPPLIER_type`` =E2=80=94 agent type (``organizatio=
n`` or ``person``)
> +
> +      Example::
> +
> +         SPDX_IMAGE_SUPPLIER =3D "SPDX_IMAGE_SUPPLIER"
> +         SPDX_IMAGE_SUPPLIER_name =3D "Acme Corp"
> +         SPDX_IMAGE_SUPPLIER_type =3D "organization"

From this I have a hard time understanding if I'm really supposed to set
SPDX_IMAGE_SUPPLIER to "SPDX_IMAGE_SUPPLIER" (a variable that contains its
variable name as a value)? Why is this needed?

Isn't setting:

SPDX_IMAGE_SUPPLIER_name =3D "Acme Corp"
SPDX_IMAGE_SUPPLIER_type =3D "organization"

enough?

Would setting SPDX_IMAGE_SUPPLIER to any other value work?

Maybe I'm missing something! :)

> +
> +      If not set, no supplier information is added to the image SBOM.
> +
> +      See also :term:`SPDX_PACKAGE_SUPPLIER` and :term:`SPDX_SDK_SUPPLIE=
R`.
> +
> +   :term:`SPDX_INVOKED_BY`
> +      The base variable name describing the Agent that invoked the build=
.
> +      Builds will be linked to this agent if specified. Requires
> +      ``SPDX_INCLUDE_BITBAKE_PARENT_BUILD`` to be set.

"""
Requires :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD` to be set to "1".
"""

We would also need a quick description of SPDX_INCLUDE_BITBAKE_PARENT_BUILD=
 in
the glossary, which can be a copy of the class' [doc] flag + references to =
all
dependent variables (SPDX_ON_BEHALF_OF/SPDX_INVOKED_BY/SPDX_BUILD_HOST. Wou=
ld
you mind adding it to your patch?

Also, could you provide an example?

> +
> +      .. note::

Reading the sentence below, I'd convert this to a '.. warning::' block.

> +
> +         Setting this variable will likely result in non-reproducible SP=
DX
> +         output, because the invoking agent identity will vary across bu=
ilds.
> +
> +      See also :term:`SPDX_ON_BEHALF_OF`.
> +
>     :term:`SPDX_LICENSES`
>        Path to the JSON file containing SPDX license identifier mappings.
>        This file maps common license names to official SPDX license
> @@ -9189,12 +9237,31 @@ system and gives an overview of their function an=
d contents.
>        and the prefix of ``documentNamespace``. It is set by default to
>        ``http://spdx.org/spdxdoc``.
> =20
> +   :term:`SPDX_ON_BEHALF_OF`
> +      The base variable name describing the Agent on whose behalf the in=
voking
> +      Agent (:term:`SPDX_INVOKED_BY`) is running the build. Requires
> +      ``SPDX_INCLUDE_BITBAKE_PARENT_BUILD`` to be set.

Could you provide an example?

> +
> +      .. note::

Again, reading the sentence below, I'd convert this to a '.. warning::' blo=
ck.

> +
> +         Setting this variable will likely result in non-reproducible SP=
DX
> +         output.
> +
> +      See also :term:`SPDX_INVOKED_BY`.
> +
>     :term:`SPDX_PACKAGE_URL`
>        Provides a place for the SPDX data creator to record the package U=
RL
>        string (``software_packageUrl``, in accordance with the Package UR=
L
>        specification) for a software Package. The default value of this v=
ariable
>        is an empty string.
> =20
> +   :term:`SPDX_PACKAGE_SUPPLIER`
> +      The base variable name describing the Agent who supplies the artif=
acts
> +      produced by the build. Works identically to :term:`SPDX_IMAGE_SUPP=
LIER`
> +      but applies to individual packages rather than the image SBOM.

One question for me here is: where should I set these variables?

I would guess:

- SPDX_IMAGE_SUPPLIER in the image recipe
- SPDX_PACKAGE_SUPPLIER in any software recipe
- SPDX_SDK_SUPPLIER in the image recipe

?

This would need to be stated in the definitions.

> +
> +      See also :term:`SPDX_IMAGE_SUPPLIER` and :term:`SPDX_SDK_SUPPLIER`=
.
> +
>     :term:`SPDX_PACKAGE_VERSION`
>        This variable controls the package version as seen in the SPDX 3.0=
 JSON
>        output (``software_packageVersion``). The default value for this v=
ariable
> @@ -9211,6 +9278,17 @@ system and gives an overview of their function and=
 contents.
>        this option is recommended if you want to inspect the SPDX
>        output files with a text editor.
> =20
> +   :term:`SPDX_SDK_SUPPLIER`
> +      The base variable name describing the Agent who supplies the SDK S=
BOM.
> +      When set, the supplier will be attached to all root elements of th=
e SDK
> +      SBOM using the ``suppliedBy`` property.
> +
> +      Works identically to :term:`SPDX_IMAGE_SUPPLIER` but for SDK build=
s.

You mean image-based SDKs, right? (-c populate_sdk).

You can also build generic SDKs with `bitbake meta-toolchain`. Would that
variable apply to it too?

> +
> +      If not set, no supplier information is added to the SDK SBOM.
> +
> +      See also :term:`SPDX_IMAGE_SUPPLIER` and :term:`SPDX_PACKAGE_SUPPL=
IER`.
> +
>     :term:`SPDX_UUID_NAMESPACE`
>        The namespace used for generating UUIDs in SPDX documents. This
>        should be a domain name or unique identifier for your organization

Thanks a lot!
Antonin

