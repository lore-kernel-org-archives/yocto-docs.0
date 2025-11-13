Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5A8CD5BD2
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:03:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22226.1763035387942315784
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 04:03:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Lat1dGJ/;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D494BC10F48
	for <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 12:02:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79C036068C;
	Thu, 13 Nov 2025 12:03:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60E62102F2398;
	Thu, 13 Nov 2025 13:03:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763035385; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AMt2pb4P3LliBV83B97O3eupGRO+n1r+gzenNsbblL4=;
	b=Lat1dGJ/gnNsD33h3l+hPZaWghJoKTNID8myAE356Z/iq3xjCvq+eVoMWMiKCWPzYJbTOe
	5+It/V0T0RURdDqWRcQ/KjWTpdjnQLSj26q3r++6WfOG0fLdY1OdT2y7GmeeZRfgqM8vp5
	GtnAC7iTjXPTT/YgkGYqb3u152F/c5t9gW8nYe0qXpTIjG5yjimHvmJPL6FvOSP4MQSZXG
	VOTbXH4Y40ui+lQgaIzAcv2Yg43cOHIF4K/gKEkneUXjpFtfaNXwIc46/QfDRHGIx2IuDV
	FyJzv5P+dEWavEF2be8mTFNcXia5HaEWm6m7ttjB9pqMjd6XOExTd+jJXKQerQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Nov 2025 13:03:03 +0100
Message-Id: <DE7JVU50DGHH.1SV7UKLZNZSFY@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: add ubuntu
 25.10 to supported distros
References: <20251113-add-ubuntu-25-10-v1-1-092133ab6d40@bootlin.com>
 <aab4e0ab-839a-4900-a91f-87bdcd322220@cherry.de>
In-Reply-To: <aab4e0ab-839a-4900-a91f-87bdcd322220@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 12:03:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8033

Hi,

On Thu Nov 13, 2025 at 11:07 AM CET, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 11/13/25 10:03 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> After it was added to meta-yocto/meta-poky's sanity.conf.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>> Note: merge when either is merged:
>> * https://lore.kernel.org/r/20251112224534.3094578-1-richard.purdie@linu=
xfoundation.org
>> * https://lore.kernel.org/r/20251111-contrib-mathieu-ubuntu_2510-v1-1-4e=
50cc96eb00@bootlin.com
>> ---
>>   documentation/ref-manual/system-requirements.rst | 1 +
>>   1 file changed, 1 insertion(+)
>>=20
>> diff --git a/documentation/ref-manual/system-requirements.rst b/document=
ation/ref-manual/system-requirements.rst
>> index fcefd6c7a..0860c7a3f 100644
>> --- a/documentation/ref-manual/system-requirements.rst
>> +++ b/documentation/ref-manual/system-requirements.rst
>> @@ -79,6 +79,7 @@ supported on the following distributions:
>>   -  Ubuntu 22.04 (LTS)
>>   -  Ubuntu 24.04 (LTS)
>>   -  Ubuntu 25.04
>> +-  Ubuntu 25.10
>>  =20
>
> We should probably update documentation/tools/build-docs-container to=20
> also be able to build for Ubuntu 25.10 (and make sure we can actually=20
> build stuff with it :) ).

Yes, thanks for reminding me, I tested it and the build worked fine with ub=
untu
25.10. Patch coming.

> https://lore.kernel.org/yocto-patches/CADfgfoZh_6cw3YnapQR3DfrWah3Prp1aj6=
-d5tJW_jJN5u28CQ@mail.gmail.com/=20
> adds fedora 43 workers as well, but I guess it's too early for marking=20
> that as tested distro :)

Ha yes indeed, they might be under test still, I'll keep an eye on that.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


