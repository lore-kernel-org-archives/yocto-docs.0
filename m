Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCAE2C44503
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:09:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9259.1768993753769630160
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 03:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vYTUaay3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B0D751A29A3
	for <docs@lists.yoctoproject.org>; Wed, 21 Jan 2026 11:09:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8755A6070A;
	Wed, 21 Jan 2026 11:09:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DF0F119B1212;
	Wed, 21 Jan 2026 12:09:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768993751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DrSdztHJoaIp47WKYe+dYwbMbWxalJSWLUXrGmrSgT0=;
	b=vYTUaay3X7p9YYMEu46p9vFKPBbRHYVpDEcpMLq5eIddhHvAutT5lFz0UMG3Gs2PTyHHvt
	LdU0PBVEuWR0w8Bj8jOSzyKSeE1nUMH1WnqPmrtI5dI62yYikLPPlCDGT7eI6zyrRENmkt
	7+0PCphRy8Ld9WSIDVG4zlyBkq7E4R7YiHnmdm/FibiBILqWt5eCbMBvea1OAGwIXKtNfO
	DdASFcl3JqLcdS8XiUrHokmSJEkCAPHIsDWlXYPK8C72IAK17EcGcA4gbcnHiVtIW1yh0E
	8BIm6dktft7EDTDbA4yw1b5cQsjQROUL1lxA6nonBwSp5HkS0CxkNt18L2jlHg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 12:09:09 +0100
Message-Id: <DFU7Y5JEHK10.W5DRDEEA69TO@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, "docs@lists.yoctoproject.org"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 3/5] ref-manual/terms.rst: simplify the Source
 Directory definition
References: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
 <20260120-terms-refresh-v2-3-fa49d15b209f@bootlin.com>
 <bcbc66da-7d35-41a3-a3f7-6f27ce4785e5@cherry.de>
In-Reply-To: <bcbc66da-7d35-41a3-a3f7-6f27ce4785e5@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Jan 2026 11:09:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8611

Hi,

On Tue Jan 20, 2026 at 5:42 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
> Hi Antonin,
>
> On 1/20/26 4:17 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Now that we no longer have Poky around, simplify the Source Directory
>> definition:
>>=20
>> - Make references to existing documents that show how to create this
>>    Source Directory.
>>=20
>> - This directory contains sources, the layout in which they are
>>    presented does not matter so much, as it can be different and/or
>>    freeform depending on whether we use bitbake-setup or not.
>>=20
>>    The definition chooses "project" as the name of the source directory
>>    and is the one that should be used when showing examples in the
>>    documentation.
>>=20
>>    A typical Source Directory would look like the following:
>>=20
>>    project/
>>    =E2=94=9C=E2=94=80=E2=94=80 build/
>>    =E2=94=94=E2=94=80=E2=94=80 layers/
>>=20
>> Other parts of the documentation referencing to this as the Poky
>> repository still have to be updated.
>>=20
>> This will also mean that this definition will be used a lot less across
>> the documentation: in most cases, when the "Source Directory" is
>> referenced as the Poky repository, it can be replaced by
>> OpenEmbedded-Core, Bitbake, the documentation, or meta-yocto. We'll keep
>
> Not really? The Source Directory will be project/layers/ no?

No, even though I do find it confusing too to call it Source Directory, it =
is
meant to represent the whole project/ directory as a whole. It was probably=
 more
meaningful when poky was there as poky was some source itself.

We could rename this term by something else but that would mean replacing i=
t
everywhere.

> [...]
>
>> -     For more information on concepts related to Git repositories,
>> -     branches, and tags, see the
>> -     ":ref:`overview-manual/development-environment:repositories, tags,=
 and branches`"
>> -     section in the Yocto Project Overview and Concepts Manual.
>> +     The Source Directory contains BitBake, OpenEmbedded-Core (OE-Core)=
,
>> +     Documentation, Metadata and other files that all support the Yocto=
 Project.
>> +     Consequently, you must have the Source Directory in place on your
>> +     development system in order to do any development using the Yocto =
Project.
>>  =20
>
> You didn't discuss my feedback on v1 here and it's unchanged, so pasting=
=20
> the same here:

I think I've missed it, sorry :/

> Isn't Metadata what we used to say about the content of OE-Core? This
> way of listing implies to me OE-Core isn't metadata (it is).

For me metadata is what OpenEmbedded-Core contains but could be
what meta-openembedded contains: it's recipes, classes, etc. But here I agr=
ee it
doesn't make sense to be listed.

> Also, it doesn't necessarily need to contain the Documentation (e.g. via
> a manual setup).

True, I'll remove it.

> Finally, we should probably also
>
> s/Source Directory/:term:`Source Directory`/

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


