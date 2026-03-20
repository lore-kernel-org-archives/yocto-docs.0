Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC96108B91C
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:40:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11673.1774010431958351610
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 05:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=c2xzA2Zf;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0094AC56682
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 12:40:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8626A600E0;
	Fri, 20 Mar 2026 12:40:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42DCB10369993;
	Fri, 20 Mar 2026 13:40:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774010429; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6Cuo41mtyzpegd2P31vzetu+N8Nk1u53/xPWODQEkGk=;
	b=c2xzA2Zfw3bRWYjIXjoUhpdNTmGTsyUfdg1clozvPB8/PkHtepusZ6mq+qiO8T4IgDyl+X
	4OrxgCIu5/yLejdkTu8gbeeKR8lCKKkaXfUImZon4bNoHV+zPqpHyU7xRRJjf/7DcUXbN1
	yZ93XhSFzRHVBjLiCrMEU3XjeZ2zib944zJYwC9Kg2O3/G9kN7z+xeBoSnwJBc6vJ9L5+R
	Wqtd6ockz7w7nX9l3VQe7WN0uxvJ+5CimpxRONRXOnboyc6ksOosDezSmvri3qgOc3pNBB
	Kg+YNQ5EozeRIabOpgQJVtHiyAyqrPgi4gFrVr1kaQKb3TM60JmuLD+G7fBaag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 13:40:27 +0100
Message-Id: <DH7M7NPJYBV5.22PK35JKFGVQQ@bootlin.com>
Subject: Re: [docs] [PATCH 6/8] migration-guides: update 6.0 (Wrynose)
 release notes
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
 <20260302-release-notes-6-0-v1-6-9662dee58591@bootlin.com>
 <d76013e1-535b-4cf8-a83c-11a1cf093bd2@cherry.de>
 <DH7JQPJL9D74.1L6371MBQQPAJ@bootlin.com>
 <55807352-b0e9-4551-9f5b-18710c7a8048@cherry.de>
In-Reply-To: <55807352-b0e9-4551-9f5b-18710c7a8048@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 12:40:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9111

Hi,

On Fri Mar 20, 2026 at 1:19 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
> Hi Antonin,
>
> On 3/20/26 11:44 AM, Antonin Godard wrote:
>> Hi,
>>=20
>> On Thu Mar 5, 2026 at 12:42 PM CET, Quentin Schulz via lists.yoctoprojec=
t.org wrote:
>> [...]
>>>> +-  Support for the `CVS` fetcher (:bitbake_rev:`5427500e4f23`).
>>>> +
>>>
>>> Missing verb. I'm assuming we want "was dropped" here.
>>>
>>> Also, I'm hoping we won't have sha collision on the first 12 hex digits=
.
>>> Wondering if we should't put the whole sha instead of only the first 12
>>> hex digits?
>>=20
>> Ideally I would have preferred to be able to pass-in the full hash and h=
ave only
>> the short one be displayed, but I don't think this is possible with the =
extlinks
>> extension. If we come up with an idea later, I think we could always scr=
ipt
>
> 'bitbake_rev': (f'{bitbake_git}/commit/?id=3D%s', '%.12s'),
>
> It's not explicitly listed as supported by the sphinx-extlinks docs but=
=20
> the code does
>
> caption % part
>
> c.f.=20
> https://github.com/sphinx-doc/sphinx/blob/master/sphinx/ext/extlinks.py#L=
115=20
> (and seemingly always had it implemented this way, checking the git log=
=20
> of this file)
>
> so you can have anything valid for a variable that is passed to the %=20
> operator on a string, see=20
> https://docs.python.org/3/library/stdtypes.html#old-string-formatting.

Very nice, I'll try that and convert the links, thank you!

Antonin

