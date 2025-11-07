Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E749CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 14:34:42 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12992.1762526078997220326
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 06:34:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tybcBsIe;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 40BFE1A1922
	for <docs@lists.yoctoproject.org>; Fri,  7 Nov 2025 14:34:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E588606A6;
	Fri,  7 Nov 2025 14:34:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A041E118527BB;
	Fri,  7 Nov 2025 15:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762526076; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qXKv+xG94C69tynllpFxWKK8macmZepu6iZf0Y2/P0s=;
	b=tybcBsIeNPvf5dHEpa9Ld+b06DNFokOY17eBBFxxd/Ne63EnqmTjhb9cqeJZV7pZrDeUcX
	MJ8Ki3S/fhRpvV4kxetkYGhLlrf1f5PIuefLUDGf9PQAzznOtWUuC98KUiILrE/VRSIqyC
	yRgQGRyJfnXpdwchcuW8X8TQfzxVr7QSbORxSPst4/Vx4A+3ukFhbsxeCZDX+eeqohPCEf
	8jWdrWiMHmq9Txgb3DGMkhF2/fUOCgzWvF2xiIEJK4Kg3wayLorfjYNjBaY8mrsWuyAs+0
	RtgxziPGXUFLO+EWvZhQVBcc9b4QHDMb19UV99hGBmyGRwA5r0/C1oslXY252A==
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Nov 2025 15:34:34 +0100
Message-Id: <DE2JCKHEFP5Z.3NANCCDBW5NAN@bootlin.com>
Subject: Re: [docs] [PATCH] vulnerabitilies: add section for kernel CVEs
 vulnerabilities
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <daniel.turull@ericsson.com>, <docs@lists.yoctoproject.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20251028094138.2607929-1-daniel.turull@ericsson.com>
In-Reply-To: <20251028094138.2607929-1-daniel.turull@ericsson.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Nov 2025 14:34:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8015

Hi,

For the whole patch, please wrap lines to 80 chars as described here:
https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md#n50

On Tue Oct 28, 2025 at 10:41 AM CET, Daniel Turull via lists.yoctoproject.o=
rg wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Documentation to include how to use scripts that can help
> with kernel CVEs introduce by:
>
> e60b1759c1 improve_kernel_cve_report: add script for postprocesing of ker=
nel CVE data
> 12612e8680 linux/generate-cve-exclusions: use data from CVEProject
>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  documentation/dev-manual/vulnerabilities.rst | 108 +++++++++++++++++++
>  1 file changed, 108 insertions(+)
>
> diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation=
/dev-manual/vulnerabilities.rst
> index 6cc7f0494..065d853d6 100644
> --- a/documentation/dev-manual/vulnerabilities.rst
> +++ b/documentation/dev-manual/vulnerabilities.rst
> @@ -335,3 +335,111 @@ When analyzing CVEs, it is recommended to:
>  -  follow public `open source security mailing lists <https://oss-securi=
ty.openwall.org/wiki/mailing-lists>`__ for
>     discussions and advance notifications of CVE bugs and software releas=
es with fixes.
> =20
> +Linux kernel vulnerabilities
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +Since the Linux kernel became a CVE Numbering Authority (CNA), the numbe=
r of associated CVEs has increased dramatically. Security teams must addres=
s these CVEs to meet regulatory and customer requirements. Automation on id=
entifying issue helps to reduce their workload.
> +
> +OpenEmbedded-core has two scripts that helps to characterize and filter =
CVEs that affects the Linux kernel, which use one of the following CVE sour=
ces:
> +
> +- https://git.kernel.org/pub/scm/linux/security/vulns.git
> +- https://github.com/CVEProject/cvelistV5
> +
> +The scripts' location are:

> +
> +-  ``openembedded-core/meta/recipes-kernel/linux/generate-cve-exclusions=
.py``
> +-  ``openembedded-core/scripts/contrib/improve_kernel_cve_report.py`

I would suggest rephrasing as follows:

"""
:term:`OpenEmbedded-Core (OE-Core)` has two scripts that help to characteri=
ze
and filter CVEs that affect the Linux kernel:

-  ``meta/recipes-kernel/linux/generate-cve-exclusions.py``
-  ``scripts/contrib/improve_kernel_cve_report.py`

Which use one of the following CVE sources:

-  https://git.kernel.org/pub/scm/linux/security/vulns.git
-  https://github.com/CVEProject/cvelistV5
"""

Are the two sources used by both scripts?

> +
> +generate-cve-exclusions.py

Enclose with ``:

``generate-cve-exclusions.py``

> +--------------------------
> +
> +When updating a kernel recipe, a helper script needs to be run manually =
to update the CVE_STATUS for the kernel recipe. The script can be used for =
custom kernels. Run it as follows::

Try to enclose yocto variables with :term:`...`, so readers can jump to its
definition easily. Here: :term:`CVE_STATUS`.

> +
> +   openembedded-core/meta/recipes-kernel/linux/generate-cve-exclusions.p=
y <datadir> <version> > cve-exclusion_<kernel_version>.inc

Can you elaborate on <datadir>? Does this directory need to be created
beforehand? Does it need to be populated with anything, or is it the direct=
ory
where some temporary data is stored?

> +Example::
> +
> +   cd openembedded-core/meta/recipes-kernel/linux/
> +   ./generate-cve-exclusions.py ~/cvelistV5 6.12.27 > cve-exclusion_6.12=
.inc

Maybe I would avoid showing an example that modifies openembedded-core?

Instead:

   ./openembedded-core/meta/recipes-kernel/linux/generate-cve-exclusions.py=
 ~/cvelistV5 6.12.27 > meta-custom/recipes-kernel/linux/cve-exclusion_6.12.=
inc

> +
> +Then the CVE information will automatically be added in the :ref:`ref-cl=
asses-cve-check` or :ref:`ref-classes-vex` report.

That's only if your kernel recipe is including the file, right? This is the=
 case
for linux-yocto, but since you mentioned above that custom kernels can be u=
sed,
I would add that this file needs to be included in the kernel recipe with:

   include cve-exclusion_6.12.inc

Unless I missed something!

> +improve_kernel_cve_report.py
> +-----------------------------

Enclose with ``:

``improve_kernel_cve_report.py``

> +
> +The script in ``openembedded-core/scripts/contrib/improve_kernel_cve_rep=
ort.py`` leverages CVE kernel metadata and the :term:`SPDX_INCLUDE_COMPILED=
_SOURCES`=20


the :term:`SPDX_INCLUDE_COMPILED_SOURCES` variable

> +to update the ``cve-summary.json``

file.

> +It reduces CVE false positives by 70%-80% and provide detailed responses=
 for all kernel-related CVEs, with the files used to build the kernel.=20

s/, with the files used to/by using the files used to/

> +The script is decoupled from the build and can be run outside BitBake.

Suggestion:

s/outside BitBake/outside of the :term:`BitBake` environment/

> +
> +The script uses the output from

the

> +:ref:`ref-classes-vex` or :ref:`ref-classes-cve-check` class as input, t=
ogether with CVE information from the Linux kernel CNA to enrich the ``cve-=
summary.json``

file.

What is this file? Where does it come from?=20

Maybe say "a ``cve-summary.json`` file with updated CVE information."

> +It creates a new json file with updated CVE information.=20

And remove this sentence, if this new JSON file is cve-summary.json?

> +Optionally, it can also use the list of compiled files from the kernel :=
term:`SPDX` to ignore CVEs that are not affected because the files are not =
compiled.
> +
> +BitBake uses the debug information to extract the sources used to build =
a

"For this, BitBake uses the debug information..."

> +binary. Therefore, it needs to be configured in the kernel to extract th=
e
> +kernel compiled files. Enable it by adding the following in your
> +``local.conf`` or kernel recipe::

"""
If you are using the ``linux-yocto`` recipe, enable it by adding the follow=
ing
in a :term:`configuration file` or in a ``.bbappend``::
"""

We try to avoid the bad practice of putting everything in local.conf.

> +
> +   KERNEL_EXTRA_FEATURES:append =3D " features/debug/debug-kernel.scc"
> +
> +Or by editing your kernel configuration to include DWARF4 debug informat=
ion.

Please add:

"""
See the :ref:`kernel-dev/common:Changing the Configuration` section of the =
Yocto
Project Linux Kernel Development Manual for more information.
"""

And:

"""
For the following example, we will consider that the kernel recipe used is
``linux-yocto``. Instructions also apply to other kernel recipes named
differently.
"""

> +
> +The sources for the kernel are stored under
> +``tmp/pkgdata/<MACHINE>/debugsources/linux-yocto-debugsources.json.zstd`=
`. In
> +order to include the information into the :term:`SPDX` file to filter ou=
t
> +source files that are not included in the binaries,=20

Suggestion:

s/not included in the binaries/not used to compile the kernel/

> +add the following in your ``local.conf``::

"""
add the following in a :term:`configuration file`::
"""

> +
> +   SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D "1"
> +
> +Finally, store either the ``recipe-linux-yocto.spdx.json`` or the ``linu=
x-yocto-debugsources.json.zstd`` outside the build directory.

s/build directory/:term:`build directory`/

> +
> +The :term:`SPDX` file is under ``tmp/deploy/spdx/3.0.1/<MACHINE>/recipes=
/recipe-linux-yocto.spdx.json``

"""
is stored in ``tmp/deploy/spdx/<spdx_version>/<MACHINE>/recipes/recipe-linu=
x-yocto.spdx.json``
(or ``
"""

Trying to avoid having to maintain the version here if it changes.

> +
> +Once you have the input data, first you need to clone or fetch the lates=
t CVE information from kernel.org::
> +
> +   git clone https://git.kernel.org/pub/scm/linux/security/vulns.git
> +
> +Finally, run the script by using one of the examples bellow. The most ex=
act

s/bellow/below/

> +are the first two examples, using the old cve-summary.json to identify t=
he
> +kernel version.

"old"=20

Maybe just "the ``cve-summary.json`` file" is enough?

> +
> +- Example using old-cve-report as input::

"""
Example using ``--old-cve-report``::
"""

> +
> +   python3 openembedded-core/scripts/contrib/improve_kernel_cve_report.p=
y --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.j=
son --datadir ./vulns --old-cve-report build/tmp/log/cve/cve-summary.json

Assuming, but add:

"""
   The ``./vulns`` directory will be created if it does not exist.
"""

> +
> +- Example using debug-sources file instead of SPDX kernel file::

"""
Example using ``--debug-sources``::
"""

> +
> +   python3 openembedded-core/scripts/contrib/improve_kernel_cve_report.p=
y --debug-sources tmp/pkgdata/qemux86_64/debugsources/linux-yocto-debugsour=
ces.json.zstd --datadir ./vulns --old-cve-report build/tmp/log/cve/cve-summ=
ary.json
> +
> +- Example using the kernel-version::

"""
Example using ``--kernel-version``::
"""

> +
> +   python3 openembedded-core/scripts/contrib/improve_kernel_cve_report.p=
y --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.j=
son --kernel-version 6.12.27 --datadir ./vulns
> +
> +Example of output for a CVE that the binary does not include the source =
code due to the kernel configuration::

Suggestion:

"""
Example output for a CVE for which the status was changed to "Ignored" beca=
use
the source files associated to the CVE were not compiled::
"""

Also nitpick but maybe you can use

.. code-block:: json
   {
     "id": "CVE-2025-38384",
     "status": "Ignored",
     "detail": "not-applicable-config",
     "summary": "In the Linux kernel, the following vulnerability has been =
resolved (...)",
     "description": "Source code not compiled by config. {'drivers/mtd/nand=
/spi/core.c'}"
   }

So these snippets render with highlighting.

> +
> +        {
> +          "id": "CVE-2025-38384",
> +          "status": "Ignored",
> +          "detail": "not-applicable-config",
> +          "summary": "In the Linux kernel, the following vulnerability h=
as been resolved (...),
> +          "description": "Source code not compiled by config. {'drivers/=
mtd/nand/spi/core.c'}"
> +        },
> +
> +Example of output for a CVE not in range::
> +
> +        {
> +          "id": "CVE-2025-40017",
> +          "status": "Patched",
> +          "detail": "fixed-version",
> +          "summary": "In the Linux kernel, the following vulnerability h=
as been resolved (...),
> +          "description": "only affects 6.15 onwards"
> +        }
> +
> +Example of output for a CVE that is vulnerable::
> +
> +        {
> +          "id": "CVE-2024-58093",
> +          "status": "Unpatched",
> +          "detail": "version-in-range",
> +          "summary": "In the Linux kernel, the following vulnerability h=
as been resolved (...),
> +          "description": "Needs backporting (fixed from 6.15)"
> +        }
> +
> +Example of output for a CVE rejected by the Linux CNA::
> +
> +        {
> +          "id": "CVE-2025-38380",
> +          "status": "Ignored",
> +          "detail": "rejected",
> +          "summary": "In the Linux kernel, the following vulnerability h=
as been resolved (...),
> +          "description": "Rejected by CNA"
> +        }
> +

Thanks for documenting this!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


