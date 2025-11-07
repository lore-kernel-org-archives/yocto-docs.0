Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080A2CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 15:31:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1311.1762529456848370740
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 07:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gMkACoal;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 352C14E4159A
	for <docs@lists.yoctoproject.org>; Fri,  7 Nov 2025 15:30:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 049F1606A6;
	Fri,  7 Nov 2025 15:30:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CE3F11852013;
	Fri,  7 Nov 2025 16:30:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762529454; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gWZUFDckq2XMCacMEE7E61ivLNReNh85G6ikzughvQI=;
	b=gMkACoal5Wm9H45ApXNI4mQUXYWWvoGEIjK36oO3ULouvd9VADW5TH/p88kfQBP+fD+WpV
	ZwTB6yXA+7tmsoay4AQOWsRX/9NMu3Ze3Ot5EFeXQYwAJ0rhJtmy5c4E7P2R4ucjLcQlDL
	KTxS32rAyvckcDsLI+nvakW+GuAq+6BauOulEwohUQ63XpIeVnmkztANKbvQLDLnd7S/Rs
	M1SjAwNL+8CQyfa/qBGKV67DWxl6gYf09RDqiQ3Y9VTNtiucTPP9kERQhwmHz878zjwbdI
	uhZUdpgcfpqAL+2nOHa0zF3dMQ2ax8H7mNGE1yrklIRfr7uobPkwes4cIjc6Sg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Nov 2025 16:30:52 +0100
Message-Id: <DE2KJOONLUNK.33S10Z69BBMF8@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Quentin Schulz"
 <foss@0leil.net>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH RFC 3/3] convert SVGs to PDF and PNG using
 rsvgconverter plugin
References: <20251030-fix-make-multi-target-v1-0-213616ed1f0a@cherry.de>
 <20251030-fix-make-multi-target-v1-3-213616ed1f0a@cherry.de>
 <DE2JZQ0TYUAH.3A1ZWC5RN5WER@bootlin.com>
 <c725410d-0ac3-45dc-9990-d5ae1f5e9a6a@cherry.de>
In-Reply-To: <c725410d-0ac3-45dc-9990-d5ae1f5e9a6a@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Nov 2025 15:31:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8018

On Fri Nov 7, 2025 at 4:22 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/7/25 4:04 PM, Antonin Godard wrote:
>> Hi,
>>=20
>> On Thu Oct 30, 2025 at 4:17 PM CET, Quentin Schulz wrote:
> [...]
>>> The epub target is removed as the catch-all target contains the same
>>> instructions as the epub target we remove in this commit.
>>=20
>> So with your patch will the epub target include SVGs or PNGs? Apparently=
 there
>
> I haven't checked but no intended change made to what the epub target=20
> will get compared to today, that is you should still have PNGs instead=20
> of SVGs. The overridden supported image/figures types are stored in=20
> conf.py at the end of the file, I don't modify them so should have the=20
> same behavior.
>
>> were issues rendering SVGs in EPUBs as per Michael's commit:
>>=20
>>      conf.py: use PNG first in EPUB output
>>=20
>>      SVG directly included in EPUB output has multiple issues,
>>      in particular font size and alignment ones (tested on two
>>      EPUB readers). Instead, using PNG, generated from SVG when availabl=
e
>>      as the primary format for images. GIF and JPEG are fine too.
>>=20
>>> Ideally, we shouldn't use our in-tree fork but the upstream project
>>> sphinxcontrib.rsvgconverter, though it currently only supports
>>> generating PDFs from SVGs and we also need PNGs. A merge request to add
>>> support for this is pending[5].
>>=20
>> Are you willing to send a patch to OE-Core to add a recipe for it?
>>=20
>
> Yes, I will need to figure out how to build and test this docs toolchain=
=20
> first though :)

It's built with this recipe:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/meta/=
buildtools-docs-tarball.bb

You use it like a regular SDK afterwards.

>> Otherwise: I'm all for using this instead of our Makefile rules, this is=
 much
>> cleaner.
>>=20
>> But I can't say whether BSD / IANAL is fine to include in out repo thoug=
h. I'd
>> rather have a recipe for it if possible! (possibly with your patch on to=
p, if it
>> doesn't get applied?)
>>=20
>
> No, I will not do that as it'll prevent us from building without the=20
> docs toolchain.
>
> If we want to fork the plugin, we'll need to have this made available in=
=20
> a publicly accessible git repo (on git.yoctoproject.org I guess?) so=20
> that we can simply pip install the git repo when building without the=20
> toolchain (can be done in the Pipfile and=20
> documentation/tools/host_packages_scripts/pip3_docs.sh). Then the recipe=
=20
> for the toolchain can be for that fork. I would rather wait for upstream=
=20
> feedback before this happens, hopefully all goes well and we get a new=20
> version tagged soon after.

Let's wait for upstream feedback, but in any case I was thinking of adding =
to
the buildtools-docs-tarball recipe (that's for the autobuilder, mainly), an=
d
also to documentation/tools/host_packages_scripts/pip3_docs.sh.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


