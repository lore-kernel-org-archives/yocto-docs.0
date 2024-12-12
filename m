Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14015E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 13:22:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.19461.1734009711756433418
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Dec 2024 05:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MF0TJdFm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA45A4000B;
	Thu, 12 Dec 2024 13:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734009710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1afMWlysLlg8gi/inCMO6K4OzG+PPSEOxyAPcHiIB8=;
	b=MF0TJdFmcDffX20JkMgfC6oAikStK212BIzgTOWZRIZDc6THiMuXGNZYEFOTLjuXEN3XHV
	SIRurywAOG8zjGl32UP/AFFFcJr7SPDDlGk04und+AE/xiSLfmzJCmEBxRByxsq04k8J9j
	1nZ6K4okb+dUzmcEW+aSBQz2yAYOQn++Tkac0GNAOCA2/huSld79qySHgJQ3XEgtpNUp3Y
	xt7LfhL0/ZMX0AeOlrIFIIdkH6oavuW8J4sBy0buAPn1c80l372SoybNITwZ7neHgTuoSJ
	lTJn1yUtGlk6TA+jFFYAL/7Cf0WAv5tnZCdvhtnFDb9g9Fb6TNp8GhTt4OaZaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Dec 2024 14:21:49 +0100
Message-Id: <D69R53AV50J4.WC4FQ8BHWX76@bootlin.com>
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 5.1.1
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <chee.yang.lee@intel.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241212122725.361920-1-chee.yang.lee@intel.com>
In-Reply-To: <20241212122725.361920-1-chee.yang.lee@intel.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Dec 2024 13:22:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5928

Hi Lee Chee Yang,

On Thu Dec 12, 2024 at 1:27 PM CET, Lee Chee Yang via lists.yoctoproject.or=
g wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  .../migration-guides/release-5.1.rst          |   1 +
>  .../migration-guides/release-notes-5.1.1.rst  | 289 ++++++++++++++++++
>  2 files changed, 290 insertions(+)
>  create mode 100644 documentation/migration-guides/release-notes-5.1.1.rs=
t
>
> diff --git a/documentation/migration-guides/release-5.1.rst b/documentati=
on/migration-guides/release-5.1.rst
> index 768edfa2b..581bbf14a 100644
> --- a/documentation/migration-guides/release-5.1.rst
> +++ b/documentation/migration-guides/release-5.1.rst
> @@ -7,3 +7,4 @@ Release 5.1 (styhead)
> =20
>     migration-5.1
>     release-notes-5.1
> +   release-notes-5.1.1
> diff --git a/documentation/migration-guides/release-notes-5.1.1.rst b/doc=
umentation/migration-guides/release-notes-5.1.1.rst
> new file mode 100644
> index 000000000..32488a973
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-5.1.1.rst
> @@ -0,0 +1,289 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release notes for Yocto-5.1.1 (Styhead)
> +---------------------------------------
> +
> +Security Fixes in Yocto-5.1.1
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  go: Fix :cve_nist:`2024-34155`, :cve_nist:`2024-34156` and :cve_nist:=
`2024-34158`
> +-  linux-yocto/6.6: Fix :cve_nist:`2023-52917`, :cve_nist:`2024-46735`, =
:cve_nist:`2024-46737`, :cve_nist:`2024-46738`, :cve_nist:`2024-46739`, :cv=
e_nist:`2024-46740`, :cve_nist:`2024-46741`, :cve_nist:`2024-46742`, :cve_n=
ist:`2024-46743`, :cve_nist:`2024-46744`, :cve_nist:`2024-46746`, :cve_nist=
:`2024-46747`, :cve_nist:`2024-46749`, :cve_nist:`2024-46750`, :cve_nist:`2=
024-46755`, :cve_nist:`2024-46756`, :cve_nist:`2024-46757`, :cve_nist:`2024=
-46758`, :cve_nist:`2024-46759`, :cve_nist:`2024-46760`, :cve_nist:`2024-46=
761`, :cve_nist:`2024-46762`, :cve_nist:`2024-46763`, :cve_nist:`2024-46765=
`, :cve_nist:`2024-46768`, :cve_nist:`2024-46770`, :cve_nist:`2024-46771`, =
:cve_nist:`2024-46773`, :cve_nist:`2024-46776`, :cve_nist:`2024-46777`, :cv=
e_nist:`2024-46780`, :cve_nist:`2024-46781`, :cve_nist:`2024-46782`, :cve_n=
ist:`2024-46783`, :cve_nist:`2024-46784`, :cve_nist:`2024-46785`, :cve_nist=
:`2024-46786`, :cve_nist:`2024-46787`, :cve_nist:`2024-46788`, :cve_nist:`2=
024-46791`, :cve_nist:`2024-46794`, :cve_nist:`2024-46795`, :cve_nist:`2024=
-46796`, :cve_nist:`2024-46797`, :cve_nist:`2024-46798`, :cve_nist:`2024-46=
800`, :cve_nist:`2024-46822`, :cve_nist:`2024-46825`, :cve_nist:`2024-46826=
`, :cve_nist:`2024-46827`, :cve_nist:`2024-46828`, :cve_nist:`2024-46829`, =
:cve_nist:`2024-46830`, :cve_nist:`2024-46831`, :cve_nist:`2024-46832`, :cv=
e_nist:`2024-46835`, :cve_nist:`2024-46836`, :cve_nist:`2024-46838`, :cve_n=
ist:`2024-46840`, :cve_nist:`2024-46843`, :cve_nist:`2024-46844`, :cve_nist=
:`2024-46845`, :cve_nist:`2024-46846`, :cve_nist:`2024-46847`, :cve_nist:`2=
024-46848`, :cve_nist:`2024-46849`, :cve_nist:`2024-46852`, :cve_nist:`2024=
-46853`, :cve_nist:`2024-46854`, :cve_nist:`2024-46855`, :cve_nist:`2024-46=
857`, :cve_nist:`2024-46858`, :cve_nist:`2024-46859`, :cve_nist:`2024-46860=
`, :cve_nist:`2024-46861`, :cve_nist:`2024-46863`, :cve_nist:`2024-46864`, =
:cve_nist:`2024-47663`, :cve_nist:`2024-47664`, :cve_nist:`2024-47665`, :cv=
e_nist:`2024-47666`, :cve_nist:`2024-47667`, :cve_nist:`2024-47668`, :cve_n=
ist:`2024-47669`, :cve_nist:`2024-47670`, :cve_nist:`2024-47671`, :cve_nist=
:`2024-47672`, :cve_nist:`2024-47673`, :cve_nist:`2024-47674`, :cve_nist:`2=
024-47675`, :cve_nist:`2024-47678`, :cve_nist:`2024-47679`, :cve_nist:`2024=
-47681`, :cve_nist:`2024-47682`, :cve_nist:`2024-47683`, :cve_nist:`2024-47=
684`, :cve_nist:`2024-47685`, :cve_nist:`2024-47686`, :cve_nist:`2024-47688=
`, :cve_nist:`2024-47689`, :cve_nist:`2024-47690`, :cve_nist:`2024-47691`, =
:cve_nist:`2024-47692`, :cve_nist:`2024-47693`, :cve_nist:`2024-47695`, :cv=
e_nist:`2024-47696`, :cve_nist:`2024-47697`, :cve_nist:`2024-47698`, :cve_n=
ist:`2024-47699`, :cve_nist:`2024-47700`, :cve_nist:`2024-47701`, :cve_nist=
:`2024-47705`, :cve_nist:`2024-47706`, :cve_nist:`2024-47707`, :cve_nist:`2=
024-47710`, :cve_nist:`2024-47712`, :cve_nist:`2024-47713`, :cve_nist:`2024=
-47714`, :cve_nist:`2024-47715`, :cve_nist:`2024-47716`, :cve_nist:`2024-47=
718`, :cve_nist:`2024-47719`, :cve_nist:`2024-47720`, :cve_nist:`2024-47723=
`, :cve_nist:`2024-47727`, :cve_nist:`2024-47728`, :cve_nist:`2024-47730`, =
:cve_nist:`2024-47731`, :cve_nist:`2024-47734`, :cve_nist:`2024-47735`, :cv=
e_nist:`2024-47737`, :cve_nist:`2024-47738`, :cve_nist:`2024-47739`, :cve_n=
ist:`2024-47741`, :cve_nist:`2024-47742`, :cve_nist:`2024-47743`, :cve_nist=
:`2024-47744`, :cve_nist:`2024-47745`, :cve_nist:`2024-47747`, :cve_nist:`2=
024-47748`, :cve_nist:`2024-47749`, :cve_nist:`2024-47750`, :cve_nist:`2024=
-47751`, :cve_nist:`2024-47752`, :cve_nist:`2024-47753`, :cve_nist:`2024-47=
754`, :cve_nist:`2024-47757`, :cve_nist:`2024-49850`, :cve_nist:`2024-49851=
`, :cve_nist:`2024-49852`, :cve_nist:`2024-49853`, :cve_nist:`2024-49854`, =
:cve_nist:`2024-49855`, :cve_nist:`2024-49856`, :cve_nist:`2024-49858`, :cv=
e_nist:`2024-49859`, :cve_nist:`2024-49860`, :cve_nist:`2024-49861` and :cv=
e_nist:`2024-49862`

Nitpick, but for the next release note do you think your script could wrap =
these
to 80 characters? This is slightly above what our standards file recommends
using :)

[...]

> +Known Issues in Yocto-5.1.1
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +- N/A
> +
> +Contributors to Yocto-5.1.1
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~

Another nitpick for the next release note, but here could you add a line to=
 your
script, that says before the list: "Thanks to the following people who
contributed to this release:", so its same as other release notes we write
manually.

Looking good otherwise, thanks!

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

