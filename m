Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A8DC9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 12:20:44 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6545.1790252434374935920
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 05:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=p10hdA/0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1447F4E41057;
	Thu, 24 Sep 2026 12:20:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D0F760341;
	Thu, 24 Sep 2026 12:20:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1A3D10328BFC;
	Thu, 24 Sep 2026 14:20:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790252426; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sZvnOAWOJJaOl/dPZ4uiiIIAIjPezgZsqFuVFH+2y7c=;
	b=p10hdA/0aJsPlWx7gPMYsNPD67wtGJgh+AMMmWgl4CActBKdZXS+iVv6M6YI19Lv6Of9N4
	Vptu40L6KOjIRDuksAMRMNB+1evztHesAQhYw4ZCIs3XqwzBoy5jGjku2ayxCTnOOD+67x
	zS2k9soqsRvGYYNP+zq/gaiZEybG5uJBuDByqTQNPHi+49atV0NM0RZ0p2vxf/T5Qm6UNk
	DZFl70mHUSIMhIFqFvHI/xFzj6H1qncYPX28Dpa4FpZoGISvnkTGVPaYO25C3G659vPJ7K
	x/RMq1Mtczvhfz76Y45neO7WKVWRoYUjvrfCq1/dWELJGNZP9ppVsMBWvKXY8A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 14:20:24 +0200
Message-Id: <DLNJIQ4RMJ1S.N1ME7KHU8U7M@bootlin.com>
Subject: Re: [docs] [PATCH 2/2] docs-wide: recommend a minimum of 16 CPU
 cores
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
References: <20260924-min-cpu-requirements-v1-0-003fc136e9c4@bootlin.com>
 <20260924-min-cpu-requirements-v1-2-003fc136e9c4@bootlin.com>
 <49266b2f-b949-46ba-a87a-a4bfe454f10a@cherry.de>
In-Reply-To: <49266b2f-b949-46ba-a87a-a4bfe454f10a@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 12:20:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10617

Hi,

On Thu Sep 24, 2026 at 2:10 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 9/24/26 1:48 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Add the MIN_CPU_CORES macro to poky.yaml.in and use it in places where
>> we list minimum host requirements.
>>=20
>
> Are those supposed to be real cores or do we also count "virtual" cores=
=20
> from e.g. HyperThreading on Intel?

Real cores only, I would say. I'm not sure we need to be that precise here,=
 it's
just a recommendation, and it might not even be enough for some recipes lik=
e
chromium (first that came to mind).

> Can you link at where this minimum number of cores comes from? (ML=20
> discussion, commit, etc.).

From a discussion with Richard:
https://lore.kernel.org/r/5f70fb6ea6d2c9a4a24f476f463ab1adf02aa7e5.camel@li=
nuxfoundation.org

>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/brief-yoctoprojectqs/index.rst     | 6 +++---
>>   documentation/dev-manual/start.rst               | 3 ++-
>>   documentation/poky.yaml.in                       | 2 ++
>>   documentation/ref-manual/system-requirements.rst | 8 ++++----
>>   4 files changed, 11 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentatio=
n/brief-yoctoprojectqs/index.rst
>> index f7e4606f1..dcdf7803a 100644
>> --- a/documentation/brief-yoctoprojectqs/index.rst
>> +++ b/documentation/brief-yoctoprojectqs/index.rst
>> @@ -43,9 +43,9 @@ following requirements:
>>      much more will help to run multiple builds and increase
>>      performance by reusing build artifacts.
>>  =20
>> --  At least &MIN_RAM; Gbytes of RAM, though a modern build host with as
>> -   much RAM and as many CPU cores as possible is strongly recommended t=
o
>> -   maximize build performance.
>> +-  At least &MIN_RAM; Gbytes of RAM and &MIN_CPU_CORES; CPU cores, thou=
gh a
>> +   modern build host with as much RAM and as many CPU cores as possible=
 is
>> +   strongly recommended to maximize build performance.
>>  =20
>>   -  Runs a supported Linux distribution (i.e. recent releases of Fedora=
,
>>      openSUSE, CentOS, Debian, or Ubuntu). For a list of Linux
>> diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manu=
al/start.rst
>> index 5f0bb37b7..8fa32d473 100644
>> --- a/documentation/dev-manual/start.rst
>> +++ b/documentation/dev-manual/start.rst
>> @@ -56,7 +56,8 @@ particular working environment and set of practices.
>>       get the hardware together. Ideally, any development, build, or tes=
t
>>       engineer uses a system that runs a supported Linux distribution.
>>       These systems, in general, should be high performance (e.g. a mini=
mum
>> -    of &MIN_RAM; Gbytes of RAM and at least &MIN_DISK_SPACE; Gbytes of =
disk space).
>> +    of &MIN_RAM; Gbytes of RAM, at least &MIN_DISK_SPACE; Gbytes of dis=
k space
>> +    and a minimum of &MIN_CPU_CORES; CPU cores).
>>       You can help ensure efficiency by having any machines used for tes=
ting
>>       or that run Autobuilders be as high performance as possible.
>>  =20
>
> Reiterating what I said in v1 from Robert in case it was missed (not a=20
> blocker, just a suggestion), I think we could simply link here to=20
> documentation/brief-yoctoprojectqs/index.rst instead of duplicating=20
> instructions (and forgetting to sync them in the future).

I mean the purpose of the macro is to avoid these type of sync issues, and =
the
phrasing here is different. I'm not sure it's an issue leaving this as-is h=
ere
as it will get updated from the macro.

> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks,
Antonin

