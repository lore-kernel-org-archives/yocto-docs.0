Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43197C55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 08:57:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2623.1785488223217116994
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 01:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0gHZTzZO;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 911BE1A134E;
	Fri, 31 Jul 2026 08:57:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5FE876039A;
	Fri, 31 Jul 2026 08:57:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAEB611C165A3;
	Fri, 31 Jul 2026 10:56:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785488217; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cM6gU3toS/Q7D1cgk8jJsiPuxHIVBP2K/GY1jIez0vQ=;
	b=0gHZTzZO/T9VATj74Q1ijqeNl8PsXqad9TAQmhhdb0gTlUmxSqxi7mJO3VXWb55RM3Ztsi
	d7K84UKYDbWJ5CXpUZUM9hF5mnzfQXEyr81VSXhzy99XglUZO1o1xdIGyynqDHaEBBPcr1
	TFx5ZH20heq5Md76KKR53nvq3uOR+1Vw5YsgPmfaoGKV0XUsZU3TVx5Yha6TfJiiklEYPk
	qJw/7hUGDIk4b1EG510kB1a1SLG3rTCf/k5ii1ocm9Z8wV/r2EEF8Wb3Oc82oIOUwHiTVn
	3RIG1EHGjSFvAHDqxLFnW0rjNAjRZ9Z1mhUYnyA9TIXhoYxHZooSNBGGrsK4Hg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Jul 2026 10:56:56 +0200
Message-Id: <DKCMQZ20F20M.2LUWYRCX05YP2@bootlin.com>
Subject: Re: [docs] [PATCH 4/5] sdk-manual: rename the section to remove
 "extensible"
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
References: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
 <20260729-sdk-clarifications-v1-4-661e65201bc7@bootlin.com>
 <2b29f06b-5654-4f2d-9688-575e2516277e@cherry.de>
In-Reply-To: <2b29f06b-5654-4f2d-9688-575e2516277e@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 08:57:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10204

Hi,

On Thu Jul 30, 2026 at 12:29 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 7/29/26 12:02 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> The SDK manual covers both the standard and extensible SDKs yet the
>> title does not imply that, so rename the section to "Yocto Project
>> Application Development and the Software Development Kit (SDK) Manual".
>>=20
>
> Well, now it's the opposite :)

Not sure we understand this the same way, for me "SDK" could me either stan=
dard
or extensible.

>> As a consequence, rename the first section title and reword the intro.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/index.rst            | 2 +-
>>   documentation/sdk-manual/index.rst | 6 +++---
>>   documentation/sdk-manual/intro.rst | 8 ++++----
>>   3 files changed, 8 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/documentation/index.rst b/documentation/index.rst
>> index afabb6615..d8603c2f5 100644
>> --- a/documentation/index.rst
>> +++ b/documentation/index.rst
>> @@ -67,7 +67,7 @@ infrastructure.
>>      Linux Kernel Development Manual <kernel-dev/index>
>>      Security Manual <security-manual/index>
>>      Profile and Tracing Manual <profile-manual/index>
>> -   Application Development and the Extensible SDK (eSDK) <sdk-manual/in=
dex>
>> +   Application Development and SDK Manual <sdk-manual/index>
>>      Toaster Manual <toaster-manual/index>
>>      Test Environment Manual <test-manual/index>
>>      BitBake User Manual <bitbake>
>> diff --git a/documentation/sdk-manual/index.rst b/documentation/sdk-manu=
al/index.rst
>> index dc7186b91..477274ab9 100644
>> --- a/documentation/sdk-manual/index.rst
>> +++ b/documentation/sdk-manual/index.rst
>> @@ -1,8 +1,8 @@
>>   .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>>  =20
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> -Yocto Project Application Development and the Extensible Software Devel=
opment Kit (eSDK)
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Yocto Project Application Development and the Software Development Kit =
(SDK) Manual
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  =20
>
> Maybe "Software Development Kits (SDK/eSDK)"?

I like this too, makes it extra clear, I'll go with:

"Application Development and Software Development Kits (SDK/eSDK) Manual"

>>   |
>>  =20
>> diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manu=
al/intro.rst
>> index 53246bd9a..8ccbcfa20 100644
>> --- a/documentation/sdk-manual/intro.rst
>> +++ b/documentation/sdk-manual/intro.rst
>> @@ -4,11 +4,11 @@
>>   Introduction
>>   ************
>>  =20
>> -eSDK Introduction
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +SDK Introduction
>
> SDK/eSDK?

Or just "Introduction" :)

>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  =20
>> -Welcome to the Yocto Project Application Development and the Extensible
>> -Software Development Kit (eSDK) manual. This manual
>> +Welcome to the Yocto Project Application Development and the
>> +Software Development Kit (SDK) manual. This manual
>
> Ditto.
>
> It's a bit confusing to use SDK as 'either "standard" SDK or eSDK' and=20
> also '"standard" SDK'. I don't have anything to suggest though :/

With the new title this should fix the issue.

Antonin

