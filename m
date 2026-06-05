Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F629CD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 14:18:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9257.1780669089650275882
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 07:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ft2f1G/O;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B51C84E408EA
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 14:18:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78F9B5FED1;
	Fri,  5 Jun 2026 14:18:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24E6A106A2425;
	Fri,  5 Jun 2026 16:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780669086; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R/XYt82Ka/QWaIfQNC43Zo67oQJB4MZ2qFD7rf0l1Ms=;
	b=Ft2f1G/O/oqyLT0qhDOfqV75KShPL5+Pv+hwanGXDm0Wf5DNgLZBVjEHZ5Bx0Mvce3I1p4
	AZ2TvLmGcC56vhu2cF/XIvmmabb4I7zHnFQB+5+3FlY2Or31F/tUPZQsNFnH9UQav98OL4
	c53P7ZEF3IjiNWUbiGTgiqJEbgY22EpiG18MvRSKDuc4GSIBkTvKJKMIljdfPQDrPl87z7
	fulq2Y8T0GMDk8moJPMJ9RlzFbH25YCyAaue1XQfLSHJ75Z8Vmkvbsccqeu90gUHaMrqE5
	tGGMikUWmJoK7xxNQ0t3DKS8Qwo4EZNJ6Hcj+KAa8LyWEy8J5M3vyIXFCebXFA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 16:18:05 +0200
Message-Id: <DJ16ICUL4B42.2ZEFA8MW8FNEA@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <bruce.ashfield@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs][PATCH] kernel-dev: document patch handling for
 discovered BSP descriptions
References: <20260605115821.2909728-1-bruce.ashfield@gmail.com>
In-Reply-To: <20260605115821.2909728-1-bruce.ashfield@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 14:18:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9607

Hi,

On Fri Jun 5, 2026 at 1:58 PM CEST, Bruce Ashfield via lists.yoctoproject.o=
rg wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Users adding a recipe-space BSP commonly list their machine ``.scc``
> directly on SRC_URI as a ``file://*.scc`` fragment. That fragment is
> processed in both the configuration and patch phases, so any ``patch``
> directives it (or the arch/bsp descriptions it includes) reference are
> applied to the kernel source. When the branch being built already
> contains those commits, do_patch fails -- a confusing result with no
> documentation explaining it.
>
> The kernel tools only inhibit patch application for the *discovered*
> BSP description (the one located via KMACHINE/LINUX_KERNEL_TYPE), on the
> assumption that its commits are already in the branch's history. Nothing
> in the manual states this, nor that delivering the description as a
> type=3Dkmeta directory is what makes it discoverable rather than a plain
> fragment.
>
> Document the discovered-BSP patch-skip behavior, show the KMACHINE +
> type=3Dkmeta form required to trigger it, and describe the
> KMETA_EXTERNAL_BSP opt-in for genuinely out-of-tree BSPs whose patches
> must still be applied.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>
> Hi all,
>
> This is my first direct patch to the docuentation after all these
> years.
>
> So I'm sure I've got something wrong!
>
> Cheers,
>
> Bruce
>
>  documentation/kernel-dev/advanced.rst | 58 +++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel=
-dev/advanced.rst
> index 97cb66322..12473cbb3 100644
> --- a/documentation/kernel-dev/advanced.rst
> +++ b/documentation/kernel-dev/advanced.rst
> @@ -719,6 +719,18 @@ form from your kernel append file::
>         file://myplatform;type=3Dkmeta;destsuffix=3Dmyplatform \
>         "
> =20
> +The ``type=3Dkmeta`` attribute is significant: it adds the directory to =
the
> +kernel Metadata that the tools search to *discover* the BSP description
> +matching :term:`KMACHINE` and ``LINUX_KERNEL_TYPE``. A ``.scc`` file lis=
ted
> +directly on :term:`SRC_URI` (for example ``file://myplatform.scc``) is i=
nstead
> +treated as a configuration fragment and is processed in both the configu=
ration
> +and the patch phases. Any ``patch`` directives that such a fragment refe=
rences,
> +or that are reached through files it ``include``\ s (such as an ``arch/`=
` or
> +``bsp/`` description), are then applied to the kernel source and will fa=
il if
> +those patches are already present in the branch. See the
> +":ref:`kernel-dev/advanced:patch application for bsp descriptions`" sect=
ion for
> +the reasoning behind this.
> +
>  Metadata Outside the Recipe-Space
>  ---------------------------------
> =20
> @@ -750,6 +762,52 @@ wish to use. Changing the data in these branches and=
 not updating the
>  :term:`SRCREV` statements to match will cause the build to fetch an olde=
r
>  commit.
> =20
> +Patch Application for BSP Descriptions
> +--------------------------------------
> +
> +During the build, the kernel tools search the kernel Metadata for the BS=
P
> +description that most closely matches the :term:`KMACHINE` and
> +``LINUX_KERNEL_TYPE`` values passed in from the recipe, and use the firs=
t
> +description they find that matches both. This is referred to as the
> +*discovered* BSP description.
> +
> +For a discovered BSP description, the tools deliberately do **not** appl=
y the
> +``patch`` directives reachable from it, either directly or through any f=
iles it
> +``include``\ s. The kernel source branch you are building (:term:`KBRANC=
H`) is
> +assumed to already contain those commits as part of its history, so re-a=
pplying
> +them would fail. Configuration fragments (``kconf`` directives) are alwa=
ys
> +applied. In other words, a discovered BSP contributes *configuration*, n=
ot

s/discovered BSP/discovered BSP description/ ?

> +*patches*.
> +
> +This is why a recipe-space BSP description must be delivered as a
> +``type=3Dkmeta`` directory rather than as an individual ``file://*.scc``=
 entry on
> +:term:`SRC_URI` (see the
> +":ref:`kernel-dev/advanced:recipe-space metadata`" section). To have you=
r
> +description discovered, place it in a ``type=3Dkmeta`` directory and set
> +:term:`KMACHINE` so the tools locate it::
> +
> +   KMACHINE:myplatform ?=3D "myplatform"
> +
> +   SRC_URI:append:myplatform =3D " \
> +       file://myplatform;type=3Dkmeta;destsuffix=3Dmyplatform \
> +       "
> +
> +Here, the ``myplatform`` directory contains the BSP description (for exa=
mple
> +``myplatform-standard.scc``, beginning with ``define KMACHINE myplatform=
`` and
> +``define KTYPE standard``). Because the description is discovered rather=
 than
> +supplied as a fragment, its ``patch`` directives, and those of everythin=
g it
> +``include``\ s, are inhibited, while its configuration is still applied.
> +
> +If your BSP genuinely lives outside the kernel source history (the branc=
h you
> +build does **not** already contain the BSP commits, and the patches *mus=
t* be
> +applied), the BSP description can opt back in to patch application by ad=
ding the
> +following directive to the description itself::
> +
> +   define KMETA_EXTERNAL_BSP t

Just making sure, but you meant to add that "t", right? What does it stand =
for?
Maybe you could quickly explain it below.

> +
> +With that directive present, the discovered BSP description is also inje=
cted
> +into the patch phase and its ``patch`` directives are applied.
> +
>  Organizing Your Source
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20

Otherwise the explanation is clear to me although I don't have much experie=
nce
with advanced kernel metadata.

Thanks,
Antonin

