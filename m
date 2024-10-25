Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA56D1170E
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 07:26:55 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.6754.1729841209109352266
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 00:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lzVGaLtH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C951220003;
	Fri, 25 Oct 2024 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729841207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9StntbwicLczRfw4rvv/HSfHBkGMus+IgQTqsNySLY=;
	b=lzVGaLtHv9gUDPmvAs4ZxFU/2JUXBnO8YTnQTk/Aw/VsFltZliqg0+Yo8+2yQMCJargXo/
	TWhOyifX/JBwr9L4TG0yKzyD1k2I5cDpFO0oFewlh15s5bj7qGnQNQfkAlJ9oSHvHT1Cki
	5aKrOJmN+p39A630K8Qjf2BLcTnr6PsjF4CByWBc6CdRneu45PrPTthj+c9kgQCZqfJ4fs
	zzeKrNlGAwdApc8pEgnMepo0602fp8SM0NXtdqWTOdBV25tJYG7ox8zXHSq3/LIPQH1LuG
	XNJLFVCuf6d/2rkFpY7wiE4sxw3DS3k6m4s/grEVPvuZCTWQiQui6Xv760tklQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Oct 2024 09:26:46 +0200
Message-Id: <D54PJ3JG92BY.1X5J15YOKC5Z6@bootlin.com>
Subject: Re: [docs] [PATCH] migration-guide: add release notes for 4.0.22
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Lee Chee Yang" <chee.yang.lee@intel.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241025033820.1778269-1-chee.yang.lee@intel.com>
In-Reply-To: <20241025033820.1778269-1-chee.yang.lee@intel.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 07:26:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5584

Hi Lee Chee Yang,

On Fri Oct 25, 2024 at 5:38 AM CEST, Lee Chee Yang wrote:
> +Security Fixes in Yocto-4.0.22
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  cups: Fix :cve:`2024-35235` and :cve:`2024-47175`
> +-  curl: Fix :cve:`2024-8096`
> +-  expat: Fix :cve:`2024-45490`, :cve:`2024-45491` and :cve:`2024-45492`
> +-  gnupg: Ignore :cve:`2022-3219`
> +-  libpcap: Fix :cve:`2023-7256` and :cve:`2024-8006`
> +-  linux-yocto/5.10: Fix :cve:`2022-48772`, :cve:`2023-52434`, :cve:`202=
3-52447`, :cve:`2023-52458`, :cve:`2024-0841`, :cve:`2024-26601`, :cve:`202=
4-26882`, :cve:`2024-26883`, :cve:`2024-26884`, :cve:`2024-26885`, :cve:`20=
24-26898`, :cve:`2024-26901`, :cve:`2024-26903`, :cve:`2024-26907`, :cve:`2=
024-26934`, :cve:`2024-26978`, :cve:`2024-27013`, :cve:`2024-27020`, :cve:`=
2024-35972`, :cve:`2024-35978`, :cve:`2024-35982`, :cve:`2024-35984`, :cve:=
`2024-35990`, :cve:`2024-35997`, :cve:`2024-36008`, :cve:`2024-36270`, :cve=
:`2024-36489`, :cve:`2024-36902`, :cve:`2024-36971`, :cve:`2024-36978`, :cv=
e:`2024-38546`, :cve:`2024-38547`, :cve:`2024-38549`, :cve:`2024-38552`, :c=
ve:`2024-38555`, :cve:`2024-38583`, :cve:`2024-38590`, :cve:`2024-38597`, :=
cve:`2024-38598`, :cve:`2024-38627`, :cve:`2024-38633`, :cve:`2024-38661`, =
:cve:`2024-38662`, :cve:`2024-38780`, :cve:`2024-39292`, :cve:`2024-39301`,=
 :cve:`2024-39468`, :cve:`2024-39471`, :cve:`2024-39475`, :cve:`2024-39476`=
, :cve:`2024-39480`, :cve:`2024-39482`, :cve:`2024-39484`, :cve:`2024-39487=
`, :cve:`2024-39489`, :cve:`2024-39495`, :cve:`2024-39506`, :cve:`2024-4090=
2`, :cve:`2024-40904`, :cve:`2024-40905`, :cve:`2024-40912`, :cve:`2024-409=
32`, :cve:`2024-40934`, :cve:`2024-40958`, :cve:`2024-40959`, :cve:`2024-40=
960`, :cve:`2024-40961`, :cve:`2024-40980`, :cve:`2024-40981`, :cve:`2024-4=
0995`, :cve:`2024-41000`, :cve:`2024-41006`, :cve:`2024-41007`, :cve:`2024-=
41012`, :cve:`2024-41040`, :cve:`2024-41046`, :cve:`2024-41049`, :cve:`2024=
-41059`, :cve:`2024-41063`, :cve:`2024-41064`, :cve:`2024-41070`, :cve:`202=
4-41087`, :cve:`2024-41089`, :cve:`2024-41092`, :cve:`2024-41095`, :cve:`20=
24-41097`, :cve:`2024-42070`, :cve:`2024-42076`, :cve:`2024-42077`, :cve:`2=
024-42082`, :cve:`2024-42090`, :cve:`2024-42093`, :cve:`2024-42094`, :cve:`=
2024-42101`, :cve:`2024-42102`, :cve:`2024-42104`, :cve:`2024-42131`, :cve:=
`2024-42137`, :cve:`2024-42148`, :cve:`2024-42152`, :cve:`2024-42153`, :cve=
:`2024-42154`, :cve:`2024-42157`, :cve:`2024-42161`, :cve:`2024-42223`, :cv=
e:`2024-42224`, :cve:`2024-42229`, :cve:`2024-42232`, :cve:`2024-42236`, :c=
ve:`2024-42244` and :cve:`2024-42247`
> +-  linux-yocto/5.15: Fix :cve:`2023-52889`, :cve:`2024-41011`, :cve:`202=
4-42114`, :cve:`2024-42259`, :cve:`2024-42271`, :cve:`2024-42272`, :cve:`20=
24-42277`, :cve:`2024-42280`, :cve:`2024-42283`, :cve:`2024-42284`, :cve:`2=
024-42285`, :cve:`2024-42286`, :cve:`2024-42287`, :cve:`2024-42288`, :cve:`=
2024-42289`, :cve:`2024-42301`, :cve:`2024-42302`, :cve:`2024-42309`, :cve:=
`2024-42310`, :cve:`2024-42311`, :cve:`2024-42313`, :cve:`2024-43817`, :cve=
:`2024-43828`, :cve:`2024-43854`, :cve:`2024-43856`, :cve:`2024-43858`, :cv=
e:`2024-43860`, :cve:`2024-43861`, :cve:`2024-43863`, :cve:`2024-43871`, :c=
ve:`2024-43873`, :cve:`2024-43882`, :cve:`2024-43889`, :cve:`2024-43890`, :=
cve:`2024-43893`, :cve:`2024-43894`, :cve:`2024-43902`, :cve:`2024-43907`, =
:cve:`2024-43908`, :cve:`2024-43909`, :cve:`2024-43914`, :cve:`2024-44934`,=
 :cve:`2024-44935`, :cve:`2024-44944`, :cve:`2024-44947`, :cve:`2024-44952`=
, :cve:`2024-44954`, :cve:`2024-44958`, :cve:`2024-44960`, :cve:`2024-44965=
`, :cve:`2024-44966`, :cve:`2024-44969`, :cve:`2024-44971`, :cve:`2024-4498=
2`, :cve:`2024-44983`, :cve:`2024-44985`, :cve:`2024-44986`, :cve:`2024-449=
87`, :cve:`2024-44988`, :cve:`2024-44989`, :cve:`2024-44990`, :cve:`2024-44=
995`, :cve:`2024-44998`, :cve:`2024-44999`, :cve:`2024-45003`, :cve:`2024-4=
5006`, :cve:`2024-45011`, :cve:`2024-45016`, :cve:`2024-45018`, :cve:`2024-=
45021`, :cve:`2024-45025`, :cve:`2024-45026`, :cve:`2024-45028`, :cve:`2024=
-46673`, :cve:`2024-46674`, :cve:`2024-46675`, :cve:`2024-46676`, :cve:`202=
4-46677`, :cve:`2024-46679`, :cve:`2024-46685`, :cve:`2024-46689`, :cve:`20=
24-46702` and :cve:`2024-46707`
> +-  openssl: Fix :cve:`2024-6119`
> +-  procps: Fix :cve:`2023-4016`
> +-  python3: Fix :cve:`2023-27043`, :cve:`2024-4030`, :cve:`2024-4032`, :=
cve:`2024-6923`, :cve:`2024-6232`, :cve:`2024-7592` and :cve:`2024-8088`
> +-  qemu: Fix :cve:`2024-4467`
> +-  rust: Ignore :cve:`2024-43402`
> +-  webkitgtk: Fix :cve:`2024-40779`
> +-  wpa-supplicant: Ignore :cve:`2024-5290`
> +-  wpa-supplicant: Fix :cve:`2024-3596`

Thanks for the release note!

For the next would it be possible for you to enclose the recipe names with
double ticks? E.g.:

-  ``wpa-supplicant``: Fix :cve:`2024-3596`

But it's fine for this one.

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

