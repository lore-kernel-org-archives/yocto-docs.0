Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3803CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 08:53:05 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.13495.1760950381921032949
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 01:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AVJUdA9G;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2FFCC4E411E1
	for <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:53:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0584F606D5;
	Mon, 20 Oct 2025 08:53:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7394102F23A9;
	Mon, 20 Oct 2025 10:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760950377; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Do1iUSFw+WYNIHsHOiczUREB8Kn6o+a6+mJgPzuqrso=;
	b=AVJUdA9GEJ871JCjCI6gf8LnC7HSxpscy//7QNcyi9MUAuyQPAL/PcSpxacAGXwUKPkj1m
	sug2peF1Hqttpteigd+dYxcahOEjMMae7w/ZbWC2Tqp3pIOXWSk4nbY0fk8qIPznnUqwei
	DHfjJMoBOa3jVZk/UtzmBZzuJdO2uNzUMU2Fl1NfM0Xcj45kDylTwltjkGXzx+bd+KDJFD
	At5mIVptoO9f1jKnU6zNH27Jg25YxH0WRbbWPZUIVPC+CyOkjIeBAzWAUESnZ5bIiwsYGR
	Lu/9I3OzIoC7B/h0kPoun9OnvLbI2yCMsduzj4aUv38nzjY/CfWkTyJ7x279Cw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 10:52:56 +0200
Message-Id: <DDN0T6ZKEYAW.10EJGR9OCQ5MY@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>, <docs@lists.yoctoproject.org>
Subject: Re: [PATCH 17/17] migration-guides/release-notes-5.3: updates
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com> <20251016-release-note-5-3-second-hunk-v1-17-20f21db1f93c@bootlin.com> <ae9751dcf85b11592bde525aa84b51c83e96b3aa.camel@pbarker.dev>
In-Reply-To: <ae9751dcf85b11592bde525aa84b51c83e96b3aa.camel@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:53:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7752

On Thu Oct 16, 2025 at 12:57 PM CEST, Paul Barker wrote:
> On Thu, 2025-10-16 at 10:54 +0200, Antonin Godard wrote:
>> Update the release notes and migration manual for 5.3.
>>=20
>> This covers commits from bd4625cd4db0 ("build-appliance-image: Update to
>> master head revision") to 4a1f38dd8db1 ("bitbake: knotty, uihelper:
>> Remove running_pids and lastpids") in Poky.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>  documentation/migration-guides/migration-5.3.rst   |  46 ++-
>>  .../migration-guides/release-notes-5.3.rst         | 341 ++++++++++++++=
+++++--
>>  2 files changed, 364 insertions(+), 23 deletions(-)
>>=20
>> diff --git a/documentation/migration-guides/migration-5.3.rst b/document=
ation/migration-guides/migration-5.3.rst
>> index 985712cb2..485002e0e 100644
>> --- a/documentation/migration-guides/migration-5.3.rst
>> +++ b/documentation/migration-guides/migration-5.3.rst
>> @@ -134,10 +134,19 @@ To set back the "mac" policy in systemd (version 2=
57.8 at the time of writing
>>  this note), you should set the ``NamePolicy`` and ``AlternativeNamesPol=
icy`` as
>>  detailed in :manpage:`systemd.link(5)`.
>> =20
>> +Removal of unlicensed Linux kernel firmwares
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +The ``linux-firmware`` recipe now has a way of excluding firmwares that=
 do not
>> +provide any license information. The recipe holds an internal list of f=
irmwares
>> +to exclude via a variable named ``REMOVE_UNLICENSED``. See :oe_git:`the=
 recipe
>> +</openembedded-core/tree/meta/recipes-kernel/linux-firmware>` for a com=
plete
>> +overview of the removed firmwares.
>
> I think we should be more explicit about the default behaviour, perhaps:
>
>     By default, the ``linux-firmware`` recipe now excludes firmwares that=
 do not
>     provide any license information. The recipe holds an internal list of=
 firmwares
>     to exclude via a variable named ``REMOVE_UNLICENSED``, this variable =
may be
>     overridden if unlicensed firmware is needed. See :oe_git:`the recipe
>     </openembedded-core/tree/meta/recipes-kernel/linux-firmware>` for a c=
omplete
>     overview of the removed firmwares.

Indeed this is clearer, thanks!

And thanks for the other reviews, it is appreciated. I'll apply your sugges=
tions in v2.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


