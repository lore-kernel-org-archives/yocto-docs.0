Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51985E9E310
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 14:12:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19678.1770819137211833946
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 06:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CUF+uGg4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 68EC24E40C5B;
	Wed, 11 Feb 2026 14:12:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DF61606B1;
	Wed, 11 Feb 2026 14:12:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E583F11948E1C;
	Wed, 11 Feb 2026 15:12:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770819133; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6D0msiSgAT0G5flrEnToUQ2SULS1ajmSP0zl2kDOpLo=;
	b=CUF+uGg4bNM9vpEHINxKHoc4z+xAfwIePjjRKBFTafjMKmLA1C1g2QSWLupFH0xYKSzFbT
	YuQXNHruCW4hbZd0PeEPat9R7moR/2LuxbdR+VNa4DgZ1l8YGBLW2CnACza4ZZev13LOWB
	29rHTpJ34dNaYaXSc2+j+H6nPOxPtmsHwrRfQ5ssoebhWTDSuRl/gRoeKBV8bBgvf/x2WO
	A6qRhSo0WJj7TqKClFoqNXiRFlbhxY2FEUWdbaShlkDUxpGJJblzbUrvvG3NZp9lzuhr65
	U4doVJ7+ZL6mXkkw25Ehp9ejLVy1kfs3y4kVaPySuXowjuwcxdiiFbEx9Mk1ig==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 15:12:12 +0100
Message-Id: <DGC6ZQW0WKWO.UYER9BNZNZ7T@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, "Quentin Schulz" <foss+yocto@0leil.net>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] convert SVGs to PDF and PNG using
 sphinxcontrib.rsvgconverter plugin
References: <20251202-fix-make-multi-target-v2-1-7eea1d64cf6b@cherry.de>
 <b3fedc48-fb69-451d-ab52-f170be87d013@cherry.de>
 <DEZIV7OT5YSJ.2GQ6UQM0O1Y4O@bootlin.com>
 <ce268dbc-882e-4079-ad92-3a601baead4f@cherry.de>
In-Reply-To: <ce268dbc-882e-4079-ad92-3a601baead4f@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Feb 2026 14:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8881

Hi,

On Tue Dec 16, 2025 at 10:54 AM CET, Quentin Schulz via lists.yoctoproject.=
org wrote:
[...]
>> Sadly, I can't merge this until [1] is updated. I was waiting for 5.3 to=
 release
>> to update this URL. The closest milestone that will include your new rec=
ipe is
>> 6.0M1. This will be available in https://downloads.yoctoproject.org/rele=
ases/yocto/milestones/.
>>=20
>
> Ah shoot, I had completely forgotten about the autobuilder. Sorry for=20
> the ping!
>
>> So we'll have to delay this until this milestone, unless we manually hij=
ack a
>> custom built tarball before.
>>=20
>
> It's been broken for a few releases, one more isn't going to hurt anyone =
:)

I've updated the release tarball to use 6.0_M1, so this is ready for
rebasing/resending :)

Cheers,
Antonin

