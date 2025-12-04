Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450CFD20688
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 13:19:06 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43199.1764854343305885883
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 05:19:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gtQjD1Bn;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C44461A1F46
	for <docs@lists.yoctoproject.org>; Thu,  4 Dec 2025 13:19:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E9926068C;
	Thu,  4 Dec 2025 13:19:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7569E119224D3;
	Thu,  4 Dec 2025 14:19:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764854340; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=B5rrM29tL0jfpiFXI4CGzvhsFipFPqmoRZKEQijNZig=;
	b=gtQjD1BnwuAHoJ/M9jZ6Zp5+dkvYYxnY9mE60Ug1pSEB+gYjnx/dkTOadxDcsAsV/hamQC
	qiTWxAbbm3YxDNMzngP9dENazWGdq88FcCk/awBf2nh+HfhlkUYZfq5VMfa5+0VVzhe15F
	vJQhpmh2e0xcYXI926aqO46ng4LXTmDZDtIGIUwOBuGTUhQLREtKETMHwKAQ+zh5465b4Y
	Ai0VfI0A9Zd6M0dKEGBgM6m1SJd4RM198eVv+xtLj44aPqhfbeTJ8z21nkzKOlXjyk55uS
	d723rT9LDU4k7nAh1upSD8SdETnb0dJ4Oud2VFAsdd0AKteO/YXu/BRgiA8ZLQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 14:19:00 +0100
Message-Id: <DEPGNF6KKP7K.3EVVKMYM7C664@bootlin.com>
Subject: Re: [docs] [PATCH 3/4] set_versions.py: add wrynose as devbranch
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
References: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
 <20251202-release-updates-v1-3-889513ccc384@bootlin.com>
 <261fa295-2ba9-4d9c-a0c8-a9dbf2f77fbb@cherry.de>
In-Reply-To: <261fa295-2ba9-4d9c-a0c8-a9dbf2f77fbb@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Dec 2025 13:19:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8213

Hi,

On Wed Dec 3, 2025 at 4:00 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/2/25 5:14 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Update set_versions.py after whinlatter release.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/set_versions.py | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/documentation/set_versions.py b/documentation/set_versions.=
py
>> index d146f93bb..0d199a885 100755
>> --- a/documentation/set_versions.py
>> +++ b/documentation/set_versions.py
>> @@ -26,9 +26,9 @@ ourversion =3D None
>>   if len(sys.argv) =3D=3D 2:
>>       ourversion =3D sys.argv[1]
>>  =20
>> -activereleases =3D ["walnascar", "scarthgap", "kirkstone"]
>> -devbranch =3D "whinlatter"
>> -ltsseries =3D ["scarthgap", "kirkstone"]
>> +activereleases =3D ["whinlatter", "scarthgap", "kirkstone"]
>> +devbranch =3D "wrynose"
>> +ltsseries =3D ["wrynose", "scarthgap", "kirkstone"]
>>  =20
>>   # used by run-docs-builds to get the default page
>>   if ourversion =3D=3D "getlatest":
>> @@ -36,6 +36,7 @@ if ourversion =3D=3D "getlatest":
>>       sys.exit(0)
>>  =20
>>   release_series =3D collections.OrderedDict()
>> +release_series["wrynose"] =3D "5.3"
>
> 6.0?

Good catch, thanks, will fix :)

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


