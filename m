Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB25CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:06:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.71308.1756796807131728843
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Sep 2025 00:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rU9Chn4P;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C8968C8EC76
	for <docs@lists.yoctoproject.org>; Tue,  2 Sep 2025 07:06:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B823760695;
	Tue,  2 Sep 2025 07:06:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53AB11C22DA85;
	Tue,  2 Sep 2025 09:06:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756796804; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H1qFIGWmh9R149FQ/i+PuLEKfl17PagoDaLNfvu/CTg=;
	b=rU9Chn4PIGqpIlk3pN6NLzxUDIJHxP3tTXoMNUQ42xMkVWRPbCwz2N75wCZIuqR1+Nt685
	D9QE/nIWl585HTSGjB3pVVVxb7lOQ81mTZ7V/iZLH1crXPAUdmMXIy2PTHv1xRLIG7FwdR
	Z7ZBawwJCGGLg3OXDiYk/Yl7fWGp2oTpggX18jya/NX+s9iZMOvOvmV2YSkVkPj8NWpC6n
	scQ7TY0vNVpFPVJEeFteSnElr8m2bdgvSNqTx+KDfyRC8cscxS8+zVaeuRfMvoJAyOriCB
	H7wrt85bHGVGgob5oDOYTgI2Pidy8TkTS4hvBzaY33TDP+nDuE+zuqK3FyZLUg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Sep 2025 09:06:42 +0200
Message-Id: <DCI4HPNGMKTB.1NCT4AGVSGSF0@bootlin.com>
Subject: Re: [docs] [PATCH] dev-manual/security-subjects.rst: update mailing
 lists
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
References: <20250829-update-security-lists-v1-1-42d02ed2eb24@bootlin.com>
 <d790220a-b0bd-425c-92b4-9e6b9a1c3293@cherry.de>
In-Reply-To: <d790220a-b0bd-425c-92b4-9e6b9a1c3293@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Sep 2025 07:06:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7480

On Mon Sep 1, 2025 at 1:35 PM CEST, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
> Hi Antonin,
>
> On 8/29/25 11:08 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Update mailing lists following changes by Michael Halstead
>> (https://lists.yoctoproject.org/g/yocto-security/message/1478).
>>=20
>> Also fix formatting/spacing.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/dev-manual/security-subjects.rst | 23 ++++++++++++++----=
-----
>>   1 file changed, 14 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/documentation/dev-manual/security-subjects.rst b/documentat=
ion/dev-manual/security-subjects.rst
>> index 1b02b6a9e9..6785b5a16a 100644
>> --- a/documentation/dev-manual/security-subjects.rst
>> +++ b/documentation/dev-manual/security-subjects.rst
>> @@ -52,19 +52,24 @@ for them for significant issues.
>>   Security-related discussions at the Yocto Project
>>   -------------------------------------------------
>>  =20
>> -We have set up two security-related mailing lists:
>> +We have set up two security-related emails/mailing lists:
>>  =20
>> -  -  Public List: yocto [dash] security [at] yoctoproject[dot] org
>> +  -  Public Mailing List: yocto [dash] security [at] yoctoproject[dot] =
org
>>  =20
>> -    This is a public mailing list for anyone to subscribe to. This list=
 is an
>> -    open list to discuss public security issues/patches and security-re=
lated
>> -    initiatives. For more information, including subscription informati=
on,
>> -    please see the  :yocto_lists:`yocto-security mailing list info page=
 </g/yocto-security>`.
>> +     This is a public mailing list for anyone to subscribe to. This lis=
t is an
>> +     open list to discuss public security issues/patches and security-r=
elated
>> +     initiatives. For more information, including subscription informat=
ion,
>> +     please see the  :yocto_lists:`yocto-security mailing list info pag=
e
>> +     </g/yocto-security>`.
>>  =20
>> -  - Private List: security [at] yoctoproject [dot] org
>> +     This list requires moderator approval for new topics to be posted,=
 to avoid
>> +     private security reports to be posted by mistake.
>>  =20
>> -    This is a private mailing list for reporting non-published potentia=
l
>> -    vulnerabilities. The list is monitored by the Yocto Project Securit=
y team.
>> +  -  Yocto Project Security Team: security [at] yoctoproject [dot] org
>> +
>> +     This is an email for reporting non-published potential vulnerabili=
ties.
>> +     Emails sent to this address are forwarded to the Yocto Project Sec=
urity
>> +     Team members.
>>  =20
>
> Matches what Michael said on the ML, so I guess
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Please also backport wherever appropriate (maybe we should think about=20
> having this under the same mechanism we use for migration manuals so=20
> it's never outdated even in old release manuals?).

I think the idea is good.

One tricky point is that this is part of the development manual which has b=
een
split in multiple documents not so long ago, so it wouldn't apply to old
releases =E2=86=92 maybe we should move this out of the development manual =
and make it a
distinct (and more visible) section? What do you think? This is about secur=
ity,
not really a development task.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


