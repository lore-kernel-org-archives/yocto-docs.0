Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4B6CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 15:21:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.270.1759936869256817286
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Oct 2025 08:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gIw2qim6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E06DA4E40F95;
	Wed,  8 Oct 2025 15:21:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B827D606E5;
	Wed,  8 Oct 2025 15:21:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97C29102F2182;
	Wed,  8 Oct 2025 17:21:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759936867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oHNo8mCLJr4x2Juwn8ZguP6wlOfh7AxBQkHJ4hBiTCg=;
	b=gIw2qim6KgFidZIoY7j+ts8DjHCVyAQuWOqNEwx4UOH6P4XJ3Z3e8L/omBVfWy6MrnOBht
	8dpWBvT/qv+HemCy35hJXEV00OJvDbe3bXgi/rDxEiwkm2HIzpQgbwsvFjkH20/T1k6Yuk
	gPXY6MjX/5JlAaJ4zv4P8dXIlYnkuJts89Ssj3cFpVM7zl5QyZzsK9z//AqPVsixG80bwp
	JQMixKa0Z1L4Ab4KEPGIZcpTP1PhYUf2xH6e67vnlBjzkTAFMznoBzKN3hXa7VAXLybPFD
	IvIG6ENBZTtNS0kn0wi+0gvmBDzi6YXaKJft6bFvpMPPKeEsPRn/0rBzlbAEBw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Oct 2025 17:21:06 +0200
Message-Id: <DDD1JURORMVW.31POTYS7MCXEF@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual/qa-checks.rst: fix references
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20251008-fix-qa-checks-doc-v1-1-5f92cb2a82ef@bootlin.com>
 <47ff3443-0965-4ba1-a59a-a6461bad613c@cherry.de>
In-Reply-To: <47ff3443-0965-4ba1-a59a-a6461bad613c@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Oct 2025 15:21:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7665

On Wed Oct 8, 2025 at 4:35 PM CEST, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
[...]
> For consistency sake, should we always have the error message in a list=
=20
> even if there's only one per section? e.g. ``arch`` has multiple entries=
=20
> in the subsection so we have a dash to specify the start of an item in=20
> the list, but ``already-stripped`` only has one, and with the current=20
> patch, we don't have a list. Which means a different indentation both in=
=20
> source and in rendered form.

I purposefully created lists only for sections that had multiple possibilit=
ies
of error messages. I figured it wasn't necessary to start a list with a sin=
gle
item.

> [...]
>
>>   .. _qa-check-configure-gettext:
>>  =20
>> --  ``AM_GNU_GETTEXT used but no inherit gettext [configure-gettext]``
>> +``configure-gettext``
>> +---------------------
>>  =20
>> -    If a recipe is building something that uses automake and the automa=
ke
>> -    files contain an ``AM_GNU_GETTEXT`` directive then this check will =
fail
>> -    if there is no ``inherit gettext`` statement in the recipe to ensur=
e
>> -    that gettext is available during the build. Add ``inherit gettext``=
 to
>> -    remove the warning.
>> +``AM_GNU_GETTEXT used but no inherit gettext [configure-gettext]``
>> +
>> + If a recipe is building something that uses automake and the automake
>> + files contain an ``AM_GNU_GETTEXT`` directive then this check will fai=
l
>> + if there is no ``inherit gettext`` statement in the recipe to ensure
>> + that gettext is available during the build. Add ``inherit gettext`` to
>> + remove the warning.
>
> Spurious leading whitespace for the whole paragraph.

Thanks! I tried to remove all of those but missed that one.
Looking for other "^ [a-zA-Z0-9]" patterns I couldn't find any other occure=
nces.

I'll send a v2.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


