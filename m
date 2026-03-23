Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E057EC01AA
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 09:13:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13041.1774257208903642382
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 02:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qlkvDr4J;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 022A64E427AC;
	Mon, 23 Mar 2026 09:13:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBC505FEF6;
	Mon, 23 Mar 2026 09:13:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAA5C10371BD4;
	Mon, 23 Mar 2026 10:13:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774257191; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1HjZzAlGFzUxsSfDFPkD3JsnYsJHjkgpdEsrexR5G7Y=;
	b=qlkvDr4J2SgkiU2zuOpvV1FYUYolSvk7xfUOk+t1fOaJQOgFQcbiO4xflw8U9w5vNejjia
	M1QN9h/W3bmSdXXZDEKkw3ZDJM9/EFN0nzdIbfdRIKKu6sx0JKsMWjZ/Ia4KIBumzy9wLt
	qDaL9PEOJDH1qt3Eg2nKNnavK8Gpp9elJgMVhlGOqw1QZ9iz4430y96R4wWajxNvlUg/li
	/uPcu89UR+OVbcpJwaUI1+AA9LDMIa1ufbIuetEtH1ntXo2urQjrKjkYd78ZgNB061Vgby
	LrpdQMuB52N//oX2+G9bYm9EnY162SBpdGowkO0PbU1zablf96ZiFPz9lVxa2g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 10:13:09 +0100
Message-Id: <DHA1OKHRR4RC.1VHE1TL5HS96C@bootlin.com>
Cc: <Peter.Marko@siemens.com>, <adrian.freihofer@siemens.com>,
 <jpewhacker@gmail.com>, <stefano.tondo.ext@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <stondo@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v2] ref-manual/dev-manual: document new SPDX variables
 and capabilities
References: <20260317085735.32664-1-stondo@gmail.com>
 <20260320125636.65856-1-stondo@gmail.com>
In-Reply-To: <20260320125636.65856-1-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 09:13:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9122

Hi,

On Fri Mar 20, 2026 at 1:56 PM CET, stondo wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Document the new variables and features introduced by the SPDX
> enrichment patch series merged in OE-Core:
>
> New variables in ref-manual/variables.rst:
> - SPDX_FILE_EXCLUDE_PATTERNS: regex-based file exclusion from SBOM
> - SPDX_INCLUDE_BITBAKE_PARENT_BUILD: enable parent build tracking
> - SPDX_IMAGE_SUPPLIER: supplier agent for image SBOMs
> - SPDX_SDK_SUPPLIER: supplier agent for SDK SBOMs
> - SPDX_PACKAGE_SUPPLIER: supplier agent for individual packages
> - SPDX_INVOKED_BY: agent that invoked the build
> - SPDX_ON_BEHALF_OF: agent on whose behalf the build runs
>
> Updated dev-manual/sbom.rst:
> - Add bullet points for file exclusion patterns, supplier
>   information, ecosystem-specific PURL enrichment via bbclasses
>   (cargo_common, go-mod, pypi, npm, cpan), and build invocation
>   traceability (SPDX_INVOKED_BY/SPDX_ON_BEHALF_OF)
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
> Changes in v2:
> - SPDX_FILE_EXCLUDE_PATTERNS: clarify it only applies when
>   SPDX_INCLUDE_SOURCES is enabled (Antonin)
> - SPDX_INCLUDE_BITBAKE_PARENT_BUILD: add new glossary entry (Antonin)
> - SPDX_IMAGE_SUPPLIER: rewrite to explain the agent PREFIX mechanism
>   clearly, add shared-prefix example, state where to set it (Antonin)
> - SPDX_INVOKED_BY: use :term: reference for SPDX_INCLUDE_BITBAKE_PARENT_B=
UILD,
>   add CI pipeline example, convert note to warning (Antonin)
> - SPDX_ON_BEHALF_OF: add full example, convert note to warning (Antonin)
> - SPDX_PACKAGE_SUPPLIER: state where to set it (local.conf / recipe) (Ant=
onin)
> - SPDX_SDK_SUPPLIER: clarify it applies to both populate_sdk and
>   meta-toolchain (Antonin)
> - dev-manual/sbom.rst: add bullet for build invocation traceability (Anto=
nin)
>
>  documentation/dev-manual/sbom.rst      |  18 +++
>  documentation/ref-manual/variables.rst | 163 +++++++++++++++++++++++++
>  2 files changed, 181 insertions(+)
>
> diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual=
/sbom.rst
> index 95303ed..e0c3ed6 100644
> --- a/documentation/dev-manual/sbom.rst
> +++ b/documentation/dev-manual/sbom.rst
> @@ -64,6 +64,24 @@ more information in the output :term:`SPDX` data:
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
> +-  Record which agent invoked the build and on whose behalf it ran, enab=
ling
> +   CI/CD traceability in the SBOM
> +   (:term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD`, :term:`SPDX_INVOKED_BY`,
> +   :term:`SPDX_ON_BEHALF_OF`).
> +
>  Though the toplevel :term:`SPDX` output is available in
>  ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`, ancil=
lary
>  generated files are available in ``tmp/deploy/spdx/MACHINE`` too, such a=
s:
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 9e0c5b0..84715af 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9063,6 +9063,41 @@ system and gives an overview of their function and=
 contents.
>             }
>           ],
> =20
> +   :term:`SPDX_FILE_EXCLUDE_PATTERNS`
> +      A space-separated list of Python regular expressions used to exclu=
de files
> +      from the SPDX output when :term:`SPDX_INCLUDE_SOURCES` is enabled.
> +      Files whose paths match any of the patterns (via ``re.search``) wi=
ll be
> +      filtered out from the generated SBOM.
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
> +   :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD`
> +      When set to ``"1"``, the SPDX output will include a :term:`Build` =
object

:term:`Build` is not a valid term (valid terms are in
documentation/ref-manual/terms.rst). I think ``Build`` would be more approp=
riate
here instead.

> +      representing the parent bitbake invocation. This allows consumers =
of the

s/bitbake/:term:`BitBake`/

> +      SBOM to trace which CI/CD job or orchestration system triggered th=
e build.
> +
> +      This variable is required for :term:`SPDX_INVOKED_BY`,
> +      :term:`SPDX_ON_BEHALF_OF`, and :term:`SPDX_BUILD_HOST` to have any

SPDX_BUILD_HOST is not documented so this creates a docs build error:

/data/yoctoproject/ws/repos/yocto-docs/documentation/ref-manual/variables.r=
st:9080: WARNING: term not in glossary: 'SPDX_BUILD_HOST' [ref.term]
/data/yoctoproject/ws/repos/yocto-docs/documentation/ref-manual/variables.r=
st:9093: WARNING: term not in glossary: 'SPDX_BUILD_HOST' [ref.term]

Could you include a definition for it in this patch?

> +      effect.
> +
> +      .. warning::
> +
> +         Enabling this variable will result in non-reproducible SPDX out=
put,
> +         because the build invocation identity changes with every run.
> +
> +      Enable as follows::
> +
> +         SPDX_INCLUDE_BITBAKE_PARENT_BUILD =3D "1"
> +
> +      See also :term:`SPDX_INVOKED_BY`, :term:`SPDX_ON_BEHALF_OF`,
> +      :term:`SPDX_BUILD_HOST`.
> +
>     :term:`SPDX_INCLUDE_COMPILED_SOURCES`
>        This option allows the same as :term:`SPDX_INCLUDE_SOURCES` but in=
cluding
>        only the sources used to compile the host tools and the target pac=
kages.
> @@ -9161,6 +9196,72 @@ system and gives an overview of their function and=
 contents.
>        increases the SBOM size (potentially by several gigabytes for typi=
cal
>        images).
> =20
> +   :term:`SPDX_IMAGE_SUPPLIER`
> +      The name of an agent variable prefix describing the organization o=
r
> +      person who supplies the image SBOM. When set, the supplier is atta=
ched
> +      to all root elements of the image SBOM using the ``suppliedBy`` pr=
operty.
> +
> +      The value of this variable is the BASE PREFIX used to look up the
> +      agent's details. The following sub-variables are read using that p=
refix:
> +
> +      - ``<PREFIX>_name`` =E2=80=94 display name of the supplier (requir=
ed)
> +      - ``<PREFIX>_type`` =E2=80=94 agent type: ``organization``, ``pers=
on``,
> +        ``software``, or ``agent`` (optional, defaults to ``agent``)
> +      - ``<PREFIX>_comment`` =E2=80=94 free-text comment (optional)
> +      - ``<PREFIX>_id_email`` =E2=80=94 contact e-mail address (optional=
)
> +
> +      The simplest approach is to use the variable itself as its own pre=
fix
> +      (set it to its own name), so that the sub-variable names follow
> +      directly from ``SPDX_IMAGE_SUPPLIER``:
> +
> +      Example (set in the image recipe or in ``local.conf``)::=20
> +
> +         SPDX_IMAGE_SUPPLIER =3D "SPDX_IMAGE_SUPPLIER"
> +         SPDX_IMAGE_SUPPLIER_name =3D "Acme Corp"
> +         SPDX_IMAGE_SUPPLIER_type =3D "organization"
> +
> +      Alternatively, you can use any other prefix name, which is useful =
for
> +      sharing an agent definition across multiple supplier variables::
> +
> +         MY_COMPANY_name =3D "Acme Corp"
> +         MY_COMPANY_type =3D "organization"
> +         SPDX_IMAGE_SUPPLIER =3D "MY_COMPANY"
> +         SPDX_SDK_SUPPLIER   =3D "MY_COMPANY"
> +
> +      Typically set in the image recipe or in ``local.conf`` to apply it=
 to

s/in ``local.conf``/in a :term:`configuration file`/

> +      all images.
> +
> +      If not set, no supplier information is added to the image SBOM.
> +
> +      See also :term:`SPDX_PACKAGE_SUPPLIER` and :term:`SPDX_SDK_SUPPLIE=
R`.
> +
> +   :term:`SPDX_INVOKED_BY`
> +      The base variable name describing the Agent that invoked the build=
.
> +      Each Build object in the SPDX output will be linked to this agent

s/Build/``Build``/

> +      with an ``invokedBy`` relationship. Requires
> +      :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD` to be set to ``"1"``.
> +
> +      The sub-variables follow the same agent prefix convention as
> +      :term:`SPDX_IMAGE_SUPPLIER`:
> +
> +      - ``SPDX_INVOKED_BY_name`` =E2=80=94 display name of the invoking =
agent
> +      - ``SPDX_INVOKED_BY_type`` =E2=80=94 agent type (e.g. ``software``=
 for a CI system)
> +
> +      Example (CI pipeline invoking the build)::
> +
> +         SPDX_INCLUDE_BITBAKE_PARENT_BUILD =3D "1"
> +         SPDX_INVOKED_BY =3D "SPDX_INVOKED_BY"
> +         SPDX_INVOKED_BY_name =3D "GitLab CI"
> +         SPDX_INVOKED_BY_type =3D "software"
> +
> +      .. warning::
> +
> +         Setting this variable will likely result in non-reproducible SP=
DX
> +         output, because the invoking agent identity will vary across bu=
ilds.
> +
> +      See also :term:`SPDX_ON_BEHALF_OF`,
> +      :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD`.
> +
>     :term:`SPDX_LICENSES`
>        Path to the JSON file containing SPDX license identifier mappings.
>        This file maps common license names to official SPDX license
> @@ -9189,12 +9290,58 @@ system and gives an overview of their function an=
d contents.
>        and the prefix of ``documentNamespace``. It is set by default to
>        ``http://spdx.org/spdxdoc``.
> =20
> +   :term:`SPDX_ON_BEHALF_OF`
> +      The base variable name describing the Agent on whose behalf the in=
voking
> +      agent (:term:`SPDX_INVOKED_BY`) is running the build. Requires
> +      :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD` to be set to ``"1"``.
> +      Has no effect if :term:`SPDX_INVOKED_BY` is not also set.
> +
> +      The sub-variables follow the same agent prefix convention as
> +      :term:`SPDX_IMAGE_SUPPLIER`:
> +
> +      - ``SPDX_ON_BEHALF_OF_name`` =E2=80=94 display name of the commiss=
ioning agent
> +      - ``SPDX_ON_BEHALF_OF_type`` =E2=80=94 agent type (e.g. ``organiza=
tion``)
> +
> +      Example (CI system building on behalf of a customer organization):=
:
> +
> +         SPDX_INCLUDE_BITBAKE_PARENT_BUILD =3D "1"
> +         SPDX_INVOKED_BY =3D "SPDX_INVOKED_BY"
> +         SPDX_INVOKED_BY_name =3D "GitLab CI"
> +         SPDX_INVOKED_BY_type =3D "software"
> +         SPDX_ON_BEHALF_OF =3D "SPDX_ON_BEHALF_OF"
> +         SPDX_ON_BEHALF_OF_name =3D "Acme Corp"
> +         SPDX_ON_BEHALF_OF_type =3D "organization"
> +
> +      .. warning::
> +
> +         Setting this variable will likely result in non-reproducible SP=
DX
> +         output, because the agent identity will vary across builds.
> +
> +      See also :term:`SPDX_INVOKED_BY`,
> +      :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD`.
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
> +
> +      Typically set in ``local.conf`` to apply globally to all packages,=
 or

s/in ``local.conf``/in a :term:`configuration file`/

> +      in a specific software recipe (or a ``.bbappend``) to apply only t=
o
> +      packages of that recipe. Recipe-level overrides (``SPDX_PACKAGE_SU=
PPLIER:pn-<recipe>``) are also supported::
> +
> +         # local.conf =E2=80=94 apply to all packages

s/local.conf/distro configuration file/

(we try to encourage not to use local.conf for such things and instead enco=
urage
distro configuration files etc.)

> +         SPDX_PACKAGE_SUPPLIER =3D "SPDX_PACKAGE_SUPPLIER"
> +         SPDX_PACKAGE_SUPPLIER_name =3D "Acme Corp"
> +         SPDX_PACKAGE_SUPPLIER_type =3D "organization"
> +
> +      See also :term:`SPDX_IMAGE_SUPPLIER` and :term:`SPDX_SDK_SUPPLIER`=
.
> +
>     :term:`SPDX_PACKAGE_VERSION`
>        This variable controls the package version as seen in the SPDX 3.0=
 JSON
>        output (``software_packageVersion``). The default value for this v=
ariable
> @@ -9211,6 +9358,22 @@ system and gives an overview of their function and=
 contents.
>        this option is recommended if you want to inspect the SPDX
>        output files with a text editor.
> =20
> +   :term:`SPDX_SDK_SUPPLIER`
> +      The base variable name describing the Agent who supplies the SDK S=
BOM.
> +      When set, the supplier is attached to all root elements of the SDK
> +      SBOM using the ``suppliedBy`` property.
> +
> +      Works identically to :term:`SPDX_IMAGE_SUPPLIER` but applies to SD=
K
> +      builds. This includes image-based SDKs produced by
> +      ``bitbake <image> -c populate_sdk`` as well as toolchain SDKs prod=
uced
> +      by ``bitbake meta-toolchain``.
> +
> +      Typically set in the image recipe or in ``local.conf``.

s/in ``local.conf``/in a :term:`configuration file`/

> +
> +      If not set, no supplier information is added to the SDK SBOM.
> +
> +      See also :term:`SPDX_IMAGE_SUPPLIER` and :term:`SPDX_PACKAGE_SUPPL=
IER`.
> +
>     :term:`SPDX_UUID_NAMESPACE`
>        The namespace used for generating UUIDs in SPDX documents. This
>        should be a domain name or unique identifier for your organization

Also there is a bit of an ordering issue in variable.rst:

./tools/check-glossaries --docs-dir .
WARNING: ref-manual/variables.rst: entries are not properly sorted:
--- original_list
+++ sorted_list
@@ -712,19 +712,19 @@

 SPDX_ARCHIVE_SOURCES
 SPDX_CUSTOM_ANNOTATION_VARS
 SPDX_FILE_EXCLUDE_PATTERNS
+SPDX_IMAGE_SUPPLIER
 SPDX_INCLUDE_BITBAKE_PARENT_BUILD
 SPDX_INCLUDE_COMPILED_SOURCES
 SPDX_INCLUDE_KERNEL_CONFIG
 SPDX_INCLUDE_PACKAGECONFIG
 SPDX_INCLUDE_SOURCES
-SPDX_IMAGE_SUPPLIER
 SPDX_INVOKED_BY
 SPDX_LICENSES
 SPDX_MULTILIB_SSTATE_ARCHS
 SPDX_NAMESPACE_PREFIX
 SPDX_ON_BEHALF_OF
+SPDX_PACKAGE_SUPPLIER
 SPDX_PACKAGE_URL
-SPDX_PACKAGE_SUPPLIER
 SPDX_PACKAGE_VERSION
 SPDX_PRETTY
 SPDX_SDK_SUPPLIER


Thanks again, this is looking great!
Antonin

