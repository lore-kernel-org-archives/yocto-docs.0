Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B600C4450F
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 12:30:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4930.1784118645284130518
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 05:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QX9YO2N6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6B6964E40DC1
	for <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 12:30:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 320A36035C;
	Wed, 15 Jul 2026 12:30:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D41E11BD3AD3;
	Wed, 15 Jul 2026 14:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784118642; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R8Ebt6h0JxET/YaLF0S+SH2iRpS9mIrJuU8f2H1U2m8=;
	b=QX9YO2N6BPmB5AhF27Vaf0Y0L2d7sBUe2TsOOG9/O5zBk9BBaq46ccmKHr47sa+3U7J7Fp
	N1XtyT68BpCK8E1lcJSCDTxbdhmjzoGGcIfijFFYmOAF+eC3uK57l535Mj6mwmUHnXURsb
	WDO1pkkOZsEXiuacSm1pSmcDSAzqx1t5KbVMXGKy43pdPUdqkugOmkjyHb5IToST1MaVlX
	NAwS/Y03A1N7GWWuvMqjYBvCTzfR+B8wFeXqGHpfW6CKA3S3teUPo06dl4dl3ybT500gT5
	GxbgVhT+ei0/g2prQSPNRFSCDlSppf/8dHaRQ0bYRadnVv7Z89e3BAHYxPgbeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 14:30:42 +0200
Message-Id: <DJZ59XB4NE8D.HK9TEXCAZTAI@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 2/8] conf.py: add extra links known to be broken
References: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
 <20260710-linkcheck-v1-2-999168371d5e@bootlin.com>
 <8e57cf03-7e35-499b-8528-068e518f60ca@cherry.de>
In-Reply-To: <8e57cf03-7e35-499b-8528-068e518f60ca@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 12:30:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10073

Hi,

On Fri Jul 10, 2026 at 5:13 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 7/10/26 4:46 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Those links are broken, yet our documentation still has references to th=
em
>> we want to keep, namely in release notes. Make the linkcheck ignore them=
.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/conf.py | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>=20
>> diff --git a/documentation/conf.py b/documentation/conf.py
>> index aff01c1ed..a5b0add8f 100644
>> --- a/documentation/conf.py
>> +++ b/documentation/conf.py
>> @@ -156,6 +156,16 @@ linkcheck_ignore =3D [
>>       r'https?://mirrors\.edge\.kernel\.org.*'
>>   ]
>>  =20
>> +# Those link are known to be dead, yet we want to keep them in our docu=
mentation
>> +# because they still hold value in the context in which they were used =
(e.g. in
>> +# release notes).
>> +linkcheck_ignore +=3D [
>> +    r'https?://linuxkernelcves\.com.*',
>> +    r'https?://gpe\.linuxtogo\.org.*',
>> +    r'https?://jk\.ozlabs\.org/projects/patchwork.*',
>> +    r'https?://rlbl\.me/prelink.*',
>> +]
>> +
>
> How about we replace them with archive links instead? e.g. from=20
> web.archive.org?
>
> For patchwork, point at https://patchwork.ozlabs.org/project/patchwork/=
=20
> instead maybe or https://github.com/getpatchwork/patchwork?

Good point, I'll try and replace those in a separate series, thanks!

Antonin

