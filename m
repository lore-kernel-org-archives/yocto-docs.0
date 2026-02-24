Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A298E9B265
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:03:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20941.1771941794625684891
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 06:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UIvbKZUv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9B9C64E41085;
	Tue, 24 Feb 2026 14:03:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71DE85FD9D;
	Tue, 24 Feb 2026 14:03:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1596910368F2C;
	Tue, 24 Feb 2026 15:03:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771941787; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tM1Rzz95PFwaCUJOokuUOkqARZRBb2mw8+fAkuyh4Z0=;
	b=UIvbKZUvzZVdGj2iRQlogC5kPo86aXQtzu6MAldSmd+rJAkp5lnOl/vmtL2O2AU+4kfpRr
	rMLNH8/HqHwRiGlFFgEBsBLh8byZ8WVVrGbIfHU7J9J4vACYBaSP9BfSKozHweBr5YY8+D
	pzVWGsV5b0Tbyy8I5zLgpx9wismtJHbO/o+wYjo9HQLFVBLhgrz0sIC/Zcb+oXZ/PIJhke
	9tjl+n7v9xQjLf/LZUcUf/Sie/iruEfQpkiXT1WLLCNspcmDYtsqnI786myajwjJr4ZTzi
	GYuQFq6AKbRNyCvvUEkEjzT7y8alkMZkJJBP020iL/6iB5YBblfUwC2IGzBp1A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 15:03:05 +0100
Message-Id: <DGN8XUHPDACG.38WXZGBEQ8LTK@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, <foss@0leil.net>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v4 1/3] use a venv for installing packages with
 pip
References: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
 <20260216-fix-make-multi-target-v4-1-749e588cb7f5@cherry.de>
 <DGHXUDE510VH.1JG9S6P90SNTG@bootlin.com>
 <e41bdc41-be0f-4c85-bcbd-e00b10433336@cherry.de>
 <DGN1TVXRNHW7.2TYSX3YXZYQB5@bootlin.com>
 <808a63f9-77c1-4d61-8856-87277af3b894@cherry.de>
 <72be7e47-abc9-4c4b-8e4d-6604bf154f31@cherry.de>
In-Reply-To: <72be7e47-abc9-4c4b-8e4d-6604bf154f31@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 14:03:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8971

Hi,

On Tue Feb 24, 2026 at 2:55 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 2/24/26 1:52 PM, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>=20
>> On 2/24/26 9:28 AM, Antonin Godard wrote:
>>> Hi,
>>>
>>> On Mon Feb 23, 2026 at 6:33 PM CET, Quentin Schulz wrote:
>>>> Hi Antonin,
>>>>
>>>> On 2/18/26 9:18 AM, Antonin Godard wrote:
>>>>> Hi,
>>>>>
>>>>> On Mon Feb 16, 2026 at 12:26 PM CET, Quentin Schulz via=20
>>>>> lists.yoctoproject.org wrote:
>
> [...]
>
>> So... I'll be working on fixing sphinxcontrib-svg2pdfconverter and=20
>> hopefully we don't have to wait too long for a v2.0.1 (or whatever the=
=20
>> next version will be). This means we'll be able to use --system-site-=20
>> packages again, which I think is neat.
>>=20
>
> See=20
> https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter/=
pull/34
>
> Do we want to wait for this to be merged before having a look at this=20
> series again? This prevents us from using --system-site-packages, but we=
=20
> could decide to not have it and force all Python packages for building=20
> the docs to be taken only from the venv (which is what happens when=20
> --system-site-packages is *NOT* passed to venv at creation time).
>
> What do you think?

Let's go for python3 -m sphinx in the Makefile and no --system-site-package=
s
package option for the time being, and improve later if we can.

Thanks for taking the time to dig!
Antonin

