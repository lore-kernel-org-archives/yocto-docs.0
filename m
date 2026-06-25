Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDEACDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 08:11:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6480.1782375103648036858
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 01:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FLfD5H9T;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 462FD1A0987;
	Thu, 25 Jun 2026 08:11:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 191235FF03;
	Thu, 25 Jun 2026 08:11:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B4C5106C8415;
	Thu, 25 Jun 2026 10:11:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782375100; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w6KxLXPV7E8ZphM5EJ9iM9XpaDbs61iggF5+pQO6UEE=;
	b=FLfD5H9TC/fqZmC1ZwFuF8DwfVwTFwa1HSL7grWHbSzkOd0qZkOZhaqtJamxh67tS3iF5x
	Q2gATRmhVV5Sr5qKR/rJ1nBZHDVvjqHxCKGHUCz5u2JZkQedRCc0o8kDNmfx5zBZWIVdVY
	gsGiEB3vDkoWkPNIAyEB+1l1QuM3MNZh9xq7amjaHZvozT2id1ftI1QxNGSJu0/P5fOrge
	UfLtiUyF8mn5ODNv6UGKYMPmMNOgnnj5IX1C8jKVU7R42/3wBLOBF1ttgTcbn8EcoFsTk0
	8ewQ9pZU76REt2M4F0MMeRp3RMcLzCzqjiIsjK4b0WLiHgxi7lH2RhCSoobx4w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 10:11:36 +0200
Message-Id: <DJHZ8NO9H30L.21LIRZ1HGY82W@bootlin.com>
To: <quentin.schulz@cherry.de>, <jaekyu.lee@lge.com>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] migration-guide: 5.1: Remove duplicated typo
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260624094747.3447103-1-jaekyu.lee@lge.com>
 <d2292a79-16a9-4786-9b69-30d7d320de50@cherry.de>
In-Reply-To: <d2292a79-16a9-4786-9b69-30d7d320de50@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 08:11:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9874

Hi,

On Wed Jun 24, 2026 at 11:50 AM CEST, Quentin Schulz via lists.yoctoproject=
.org wrote:
> Hi jaekyu.lee, Antonin,
>
> On 6/24/26 11:47 AM, Jaekyu Lee via lists.yoctoproject.org wrote:
>> [You don't often get email from jaekyu.lee=3Dlge.com@lists.yoctoproject.=
org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentifi=
cation ]
>>=20
>> From: "jaekyu.lee" <jaekyu.lee@lge.com>
>>=20
>> - Remove duplicated typo, do_compile
>>=20
>> Signed-off-by: jaekyu.lee <jaekyu.lee@lge.com>
>> ---
>>   documentation/migration-guides/migration-5.1.rst | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/documentation/migration-guides/migration-5.1.rst b/document=
ation/migration-guides/migration-5.1.rst
>> index 94b527bdc..f1c953c7e 100644
>> --- a/documentation/migration-guides/migration-5.1.rst
>> +++ b/documentation/migration-guides/migration-5.1.rst
>> @@ -23,8 +23,8 @@ supported, and an error will be issued. The recipe sho=
uld be changed to::
>>       S =3D "${UNPACKDIR}"
>>=20
>>   Any :term:`WORKDIR` references where files from :term:`SRC_URI` are re=
ferenced
>> -should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-c=
ompile`,
>> -:ref:`ref-tasks-compile`, :ref:`ref-tasks-install` and :term:`LIC_FILES=
_CHKSUM`.
>> +should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-c=
ompile`,
>> +:ref:`ref-tasks-install` and :term:`LIC_FILES_CHKSUM`.
>>=20
>
> Asking the same question since it was ignored on v1 such that Antonin is=
=20
> aware of it. I am wondering whether we didn't rather mean configure,=20
> compile and install tasks instead of the compile task being duplicated.

You're right, can you or jaekyu send a patch to fix this?

Antonin

