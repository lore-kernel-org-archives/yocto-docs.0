Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0495C5B574
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 08:01:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49789.1786435280830651636
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 01:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WoCiXz1l;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A26D61A1555
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 08:01:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76BC56033C;
	Tue, 11 Aug 2026 08:01:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1236811C4AF15;
	Tue, 11 Aug 2026 10:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786435278; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rMKh3R1qIqLQcKiGUcHKHUwaox7/0+8zPPdcrE6hKvI=;
	b=WoCiXz1lRyyA4pZOQvKAzrZUdNPBi+tecVH7lMR6ppnM5S4Uu+30ZTaSDRU8i941ktBTM/
	n7v/5WgQZ8fM7LZQsFkNjvHrZ7ZvSawi2fbkmeQKGJkIqcaGYFlzzzRlL7TDSM4tfzLI+t
	fTZCs0VSnMYrbWdq0E0xQEpbvbXVKM5ufA3fa14PECCZIR+Hp9GalTlHHIG+xiPLg48ool
	8Yjfilt6HtTC2eCnRzg9VKqlAi91yVLPMkkS+kbrHDyeU3aqXEnwZLp2zJgyctAfExHPR1
	tFjpdzuMMd18iY3SOXj0cLciaD5gD72Wqn9fWz8mIF3+58Ce8sdSUuePR8UWFQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 10:01:16 +0200
Message-Id: <DKLYGCFI5BZB.27DQCAPM6XT4F@bootlin.com>
Subject: Re: [docs] [PATCH] security-manual: Add information about how
 security is handled in builds
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <richard.purdie@linuxfoundation.org>, <docs@lists.yoctoproject.org>
References: <20260807164325.4083331-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260807164325.4083331-1-richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 08:01:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10247

Hi,

On Fri Aug 7, 2026 at 6:43 PM CEST, Richard Purdie via lists.yoctoproject.o=
rg wrote:
> We have no information about how security is handled within the builds
> themselves. Start to document this.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../security-manual/build-security.rst        | 41 +++++++++++++++++++
>  documentation/security-manual/index.rst       |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 documentation/security-manual/build-security.rst
>
> diff --git a/documentation/security-manual/build-security.rst b/documenta=
tion/security-manual/build-security.rst
> new file mode 100644
> index 000000000..5f15d5f64
> --- /dev/null
> +++ b/documentation/security-manual/build-security.rst
> @@ -0,0 +1,41 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +**************
> +Build Security

I suggest renaming it to "OpenEmbedded Build System Security", as "Build" a=
lone
could be interpreted in many different ways, including builds for specific
software components, etc.

> +**************
> +
> +OpenEmbedded is used to run the builds and careful consideration has gon=
e into

When you say "OpenEmbedded" I guess you mean the community? Or the build sy=
stem?

We have a :term:`OpenEmbedded Build System` that could be used here if rele=
vant.

> +how it does this with the aim of being both secure and reproducible. Lik=
e any
> +system, it does need to be used carefully and in keeping with the design=
 for
> +that to be true. Users of the system should consider that:
> +
> +-  The builds generally aim for any input into the build process being v=
erified in
> +   some form. For source code tarballs, these would have a checksum. Git=
 source
> +   trees would have a specific git revision. Metadata would also usually=
 be
> +   under source control and also have revisions.

Add a link to our fetching documentation here?

"""
See the :doc:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching` sec=
tion
of the BitBake User Manual for more information.
"""

> +
> +-  Some elements that can influence the build are not verified. It is as=
sumed
> +   that the operating system running the system is secure and of a known=
 setup and
> +   version. The system goes to signififant lengths to isolate against ho=
st
> +   contamination of the output but it is certainly possible, especially =
malicously.

typo: maliciously

Link to our supported distros here?

"""
See the :ref:`system-requirements-supported-distros` section of the Yocto
Project Reference Manual for more information on supported host distributio=
ns.
"""

> +
> +-  The builds assume DL_DIR is a safe location. Once things enter that l=
ocation

s/DL_DIR/:term:`DL_DIR`/

> +   there are not repeatedly re-verified. A user could edit the git trees=
 or
> +   tarballs there in ways the build might not detect.

I guess this will be better detailed with
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16102. Maybe the docume=
ntation
coming from this bug should be linked here then.

> +
> +-  The builds assume things from SSTATE_DIR or from a configured sstate =
mirror

s/SSTATE_DIR/:term:`SSTATE_DIR`/

s/sstate mirror/:doc:`sstate mirror </dev-manual/sstate-mirrors-setup>`

> +   are safe (with signature checks if configured).

s/signature checks/:doc:`signature checks </security-manual/sstate-signing>=
`/

> +-  The core build tool, BitBake is a execution engine and will execute c=
ode both

"""
The core build tool, :term:`BitBake`, ...
"""

> +   during builds and when parsing recipes. This is not a security issue,=
 it is an
> +   essential part of it's function and purpose.
> +
> +-  OE-Core is well tested for reproducibility issues but other layers an=
d their

s/OE-Core/:term:`OpenEmbedded-Core (OE-Core)`/

> +   recipes and code may not be as well tested. Those reproducilbity test=
s are

typo: reproducibility

> +   available for others to run against their own layers and code.
> +
> +-  The builds combine many different software components and we take it =
on trust
> +   that there aren't issues in those code bases. We'd recommend build en=
vironments
> +   being setup in such a way that if such an issue were ever discovered,=
 which at
> +   some point could happen, the build environments themselves could be s=
imply
> +   destroyed and rebuilt cleanly, i.e. they're disposable.
> diff --git a/documentation/security-manual/index.rst b/documentation/secu=
rity-manual/index.rst
> index a767cd9c6..328265be2 100644
> --- a/documentation/security-manual/index.rst
> +++ b/documentation/security-manual/index.rst
> @@ -11,6 +11,7 @@ Yocto Project Security Manual
>     :numbered:
> =20
>     intro
> +   build-security
>     securing-images
>     vulnerabilities
>     read-only-rootfs

Thanks,
Antonin

