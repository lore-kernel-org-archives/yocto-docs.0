Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13867C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 08:17:11 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.70974.1747124228434938863
 for <docs@lists.yoctoproject.org>;
 Tue, 13 May 2025 01:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PVfVHD2P;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FA7A4326A;
	Tue, 13 May 2025 08:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747124226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlZsPiJRf/A3xZIrB9/z4w4Xcpdnsfa6wdDprsvIM4k=;
	b=PVfVHD2PuGHFNLqH8Sw8sf9bok5a8dtoAOd3ivNwihFqGimTg8L6mL6hESwFPD8MGdWQXS
	38Q84cxRTMaqIFa3HGF9DfG1k+5Y1HMy2F9iLg0HWT5KSAGsybmAZ/phcfJm1zISl9BaGH
	jKK4vZDVg/YosX+prT54xGy7k+gIwU/PDe0wdNCRcNjKzPb+hhE+Zw/XEXeI8sjYddKbJY
	Y5XPXO/e4XFtMNP2gH4Ux1A6moi0igGejMhP24iQBJqQiaQ/AyeagP2lCHjFcnFrAXu4YT
	H+k5u/zx5qOgMKKtuGwadjkZBOinDyvlDPbaoLB0pyzGtOkXFnsNLoszMFU3BA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 May 2025 10:17:05 +0200
Message-Id: <D9UVUL1RJXK9.HT6YMHKRHD36@bootlin.com>
Subject: Re: [docs] [PATCH] sphinx-lint: various fixes
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, "Quentin Schulz" <quentin.schulz@cherry.de>
References: <20250506180301.32610-1-twoerner@gmail.com>
 <d7d0d319-581a-486b-bffb-7ddf0f771d9b@cherry.de>
 <20250512210330.GB25174@localhost>
In-Reply-To: <20250512210330.GB25174@localhost>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdefieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfffgkeeiueefieevkeekveejteevleekjeeigfefiefhgefhgefhuddvjeduvddvnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehtfihovghrnhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtp
 hhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 May 2025 08:17:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6814

On Mon May 12, 2025 at 11:03 PM CEST, Trevor Woerner via lists.yoctoproject=
.org wrote:
> On Mon 2025-05-12 @ 09:50:07 AM, Quentin Schulz wrote:
>> Hi Trevor,
>>=20
>> On 5/6/25 8:03 PM, Trevor Woerner via lists.yoctoproject.org wrote:
>> > A 'make sphinx-lint' pass found the following issues:
>> > 	trailing-whitespace
>> > 	missing-space-after-literal
>> > 	role-with-double-backticks
>> > 	missing-space-before-role (role missing opening tag colon)
>> >=20
>>=20
>> I'll let Antonin confirm but I assume it would be a good idea to have
>> separate commits so we could easily backport them to earlier releases? O=
r
>> maybe you/someone can run sphinx-lint on older releases and send patches=
 for
>> those too?
>
> okay, waiting on Antonin

Ultimately the best approach would be to run sphinx-lint on each branch, be=
cause
we might miss some lint warnings by simply backporting this patch.

Do you want to take care of it?

>>=20
>> The changes look fine (and necessary) to me :)
>>=20
>> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>>=20
>> [...]
>>=20
>> > diff --git a/documentation/dev-manual/start.rst b/documentation/dev-ma=
nual/start.rst
>> > index 0f015d434041..21d3dce58c14 100644
>> > --- a/documentation/dev-manual/start.rst
>> > +++ b/documentation/dev-manual/start.rst
>> > @@ -860,7 +860,7 @@ Initializing the Build Environment
>> >   Before you can use Yocto you need to setup the build environment.
>> >   From within the ``poky`` directory, source the :ref:`ref-manual/stru=
cture:\`\`oe-init-build-env\`\`` environment
>> >   setup script to define Yocto Project's build environment on your bui=
ld host::
>> > -
>> > -    $ source oe-init-build-env
>> > +
>> > +    $ source oe-init-build-env
>>=20
>> You could also remove one whitespace before the $ to respect the
>> "code-blocks are aligned by three whitespaces" rule we have (and which s=
eems
>> to not be part of our documentation/standards.md :) ).
>
> ok

I can do it when applying your patch on master-next if that's ok to you, th=
at's
an easy enough change. :)

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


