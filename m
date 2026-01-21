Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9868CC44502
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 10:18:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8637.1768990693863043583
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 02:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GIoKcy+t;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A005AC21A83;
	Wed, 21 Jan 2026 10:17:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CFB366070A;
	Wed, 21 Jan 2026 10:18:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EFB8119B1011;
	Wed, 21 Jan 2026 11:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768990691; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vuq02HvWUH74kwkZam+MPXYkQonOIjm7q16ZL1RPBJ0=;
	b=GIoKcy+ts8Xy3fNEn4TbqRhwTIJ87aeesG6jINPUpcSms2g7MxZQDpSmy9Okjva0EOTLJK
	YBLAPa1WFZsxUmPW5U3vpM/6Fm+5ZNNJRpj4YE3LNyPn+1Alj2ZWKo988skaqNqTJIrK3K
	Nm/X8a1nNoDWiOVowO36aSiNwOlx7QNDWu/2zbOKxPFMJIbkAd5zMpXY4PhGA3CooNufpq
	mQYyTNJyU7Ieg4kw3SYmI+pg4QkxjunlCcJ2RBHGE53UOBp7IeOviQHRHaRpD6zq36kJA8
	YBa0Hz9gvyY/su7+YdezBV7QA5hUeJdfSQbokRjMPOAxkrcJsfCfD5rQvV/opA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 11:18:09 +0100
Message-Id: <DFU6V40164JK.1PP12WN7VYF21@bootlin.com>
Subject: Re: [docs] [PATCH 6/9] sdk-manual: appendix-obtain: replace
 directory structure PNG with a code-block
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, "Quentin Schulz" <foss@0leil.net>,
 <docs@lists.yoctoproject.org>
References: <20260114-code-block-misc-20260114-v1-0-174a6e5dba69@cherry.de>
 <20260114-code-block-misc-20260114-v1-6-174a6e5dba69@cherry.de>
 <DFTJ0YCI8UK2.PFT9J6BRS18Z@bootlin.com>
 <0fdf95e9-3f6b-4293-80ed-69872a0798cc@cherry.de>
In-Reply-To: <0fdf95e9-3f6b-4293-80ed-69872a0798cc@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Jan 2026 10:18:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8610

On Tue Jan 20, 2026 at 4:55 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
> Hi Antonin,
>
> On 1/20/26 4:37 PM, Antonin Godard wrote:
>> Hi,
>>=20
>> On Wed Jan 14, 2026 at 1:56 PM CET, Quentin Schulz wrote:
>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>
>>> This PNG is totally unnecessary and makes accessibility much worse, so
>>> let's simply replace the PNG with a text code-block showing the same
>>> directory layout.
>>=20
>> Thanks, I agree completely. There are more across the documentation IIRC=
, this
>> is easy to replace, I should get it to it when I have some time.
>>=20
>
> I think this may be a good place to use the parsed-literal block that=20
> Robert suggested, so that we can highlight "placeholders".
>
> What do you think?

Yes, if I understood how it worked, I think it is appropriate here or in ot=
her
places, definitely.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


