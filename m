Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2811CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 08:53:05 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.13496.1760950382320082087
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 01:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=V444eeio;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8C083C0AFEC;
	Mon, 20 Oct 2025 08:52:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F9D8606DC;
	Mon, 20 Oct 2025 08:53:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30650102F23AC;
	Mon, 20 Oct 2025 10:52:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760950377; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5eQUa5OXhciFMuUHSwEdl2xA9VBA2MFjGT2YRaolZ7o=;
	b=V444eeio1hOGLZMMkNITQ1+CVQ3GLSkB84NCb2QWMJNQoPYTYVU0G5xOE75z4YexbA1unw
	qvxS3r2ZJPy/9Rcr9Dg657L5GFr3QJcJd7jdzwig8bN1aVC/4/2t2aUB55J9LCZrpuz0QN
	z31e2YtpuOP4KfeW4QKB7WZsUOsBd2sPNu5JJBbMwBoYEyjy2drAq8Say880Vui6KqEAH+
	t21m1ucuVMj6atY3BtgKi8/xr/sXqf4fSJbTrE5PTXKpBcwizCFX7yaaGJ+iBWlbi61qsD
	fTNpwVAqt2cgJ6nCZsZp18yVLTkX7HeTKF9iM/eh2WDLsl8zRGnYPwSUzGlKNw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 10:52:56 +0200
Message-Id: <DDN0T777T36V.3VTU8P3CNGR2P@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 10/17] ref-manual/variables.rst: document the
 USE_NLS variable
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com> <20251016-release-note-5-3-second-hunk-v1-10-20f21db1f93c@bootlin.com> <ab7f8415-16fd-4abf-8cab-8c3245541f1c@cherry.de>
In-Reply-To: <ab7f8415-16fd-4abf-8cab-8c3245541f1c@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:53:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7753

On Thu Oct 16, 2025 at 12:25 PM CEST, Quentin Schulz via lists.yoctoproject=
.org wrote:
> Hi Antonin,
>
> On 10/16/25 10:54 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Part of bitbake.conf, this variable allowing to enable or disable
>> translation was undocumented. Add a entry to the glossary.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/variables.rst | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>=20
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index bb24f2583..f16ef9aae 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -11117,6 +11117,19 @@ system and gives an overview of their function =
and contents.
>>         the Yocto Project Development Tasks Manual for information on ho=
w to
>>         use this variable.
>>  =20
>> +   :term:`USE_NLS`
>> +      Determines if translations should be built for recipes that can b=
uild
>> +      language translations. This variable can be equal to:
>
> Suggesting:
>
> Determine if language translations should be built for recipes that can=
=20
> build them.
>
>> +
>> +      -  ``yes``: translations are enabled.
>> +      -  ``no``: translation are disabled.
>> +
>> +      The :ref:`ref-classes-gettext` class uses this variable to enable
>> +      :wikipedia:`Gettext <Gettext>` in recipes that use this class. Re=
cipes can
>
> Suggesting:
>
> It is used to enable :wikipedia:`Gettext <Gettext>` in recipes=20
> inheriting the :ref:`ref-classes-gettext`.
>
>> +      also use the :term:`USE_NLS` variable directly to override the de=
fault
>> +      value of the variable, and configure themselves according to the =
value of
>> +      the variable.
>
> I mean.... the same can be said about any variable? But the "magic"=20
> documented stuff that happens when setting USE_NLS only happens if you=20
> inherit the class, so I would simply not document using this variable=20
> "manually"?

You're right, initially I had in mind that some recipes explicitely set thi=
s to
"no" to skip this feature unconditionally, but it doesn't seem to be the ca=
se.
Misunderstanding on my part. I will correct this to say that this is not
supposed to be set from a recipe.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


