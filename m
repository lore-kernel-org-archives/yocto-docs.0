Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD50C61DD6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 07:31:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2502.1788247900227423696
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 00:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HyLL6j3f;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1F3BE4E4148E;
	Tue,  1 Sep 2026 07:31:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6F3B6053C;
	Tue,  1 Sep 2026 07:31:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 662B711C78C5E;
	Tue,  1 Sep 2026 09:31:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788247893; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EYhVgb0vGqlp2pu6wBz3dDyxTegJNfAbT1ejgKD8NmI=;
	b=HyLL6j3f2VVAHz8bUa0yH+Hv4KuuxbvuPDsU8btt125faq9bPFxl6f/C1RFdeT5/My1s7g
	tJjhNWMxsy9fMYLsbl9+qqer6MfHD7AMNtke6fcg4UGKAVlqVPIHzV+F0XFtCWzuoXBrTg
	M4+oj/8My9sduk91VVvKprKsEhcciH4AtVhlchW6A6Hamej+SetHfACMLQpcdN8E10vxcL
	rlgCwmU/GB5xYheekLQbNdU0MZWhXDNHKJH/xIXyPyOBkhIVzdtLGuqOD1CUlyGfDykjw5
	cjasa8RNChe5uNSKy3zDyCRFPG/+pec+tsBmf8zBxsYyc0VZtO0oB6aJhEywAQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 09:31:31 +0200
Message-Id: <DL3SZ0DCHVQP.1E0KWSZQCNBVS@bootlin.com>
To: "Trevor Woerner" <twoerner@gmail.com>
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
 <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
 <ao7pU4NN4uuZDzS1@localhost.localdomain>
 <66624f77-ae0d-4670-bd99-c6ea9d2b2a54@cherry.de>
 <ao9E-I2EAyMrtlIR@localhost.localdomain>
 <121fe43e-bdec-4f2b-9f54-e92dfa887e33@cherry.de>
 <DL309JI7KO5S.31U2Y9LIHSH9Q@bootlin.com>
 <apWMw3x1EIVv7ADz@localhost.localdomain>
 <DL38AV9O6NJE.MZON26TNFFQZ@bootlin.com>
 <apWj2I_HZ99AN3Uy@localhost.localdomain>
In-Reply-To: <apWj2I_HZ99AN3Uy@localhost.localdomain>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Sep 2026 07:31:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10428

On Mon Aug 31, 2026 at 5:55 PM CEST, Trevor Woerner wrote:
> On Mon 2026-08-31 @ 05:19:37 PM, Antonin Godard wrote:
>> On Mon Aug 31, 2026 at 4:16 PM CEST, Trevor Woerner wrote:
>> > On Mon 2026-08-31 @ 11:01:44 AM, Antonin Godard wrote:
>> >> Hi Quentin, Trevor,
>> >>=20
>> >> After having thought about this a bit more, I think there are pros an=
d cons to
>> >> both approaches, but I'm leaning towards Quentin's approach. The othe=
r approach
>> >> may feel "safe", and doesn't leave room to errors, but I'm afraid tha=
t 1. most
>> >> contributors will forget about it and 2. it might make the process mo=
re painful
>> >> for them.
>> >>=20
>> >> So here what we should do:
>> >>=20
>> >> - set `hightlight_language =3D "bitbake"` in conf.py.
>> >>=20
>> >> - remove file-wide lexer enforcing (.. highlight:: directive at the t=
op of the
>> >>   file) (in a separate patch)
>> >>=20
>> >> - use the appropriate lexer for each code-block that is _not_ bitbake=
 code.
>> >>=20
>> >> - fix any parsing error from the bitbake lexer (I did have some when =
trying it).
>> >>   If this happens, use "none" and *add a identifiable comment* above =
it to
>> >>   explain that there's an issue with the lexer. This way we can track=
 them and
>> >>   fix them when Pygments gets an update.
>> >
>> > The pygments releases occur on a rather slow timeline, I predict the n=
ext
>> > release will probably be in Dec if not Jan 2027, if history is any
>> > indicator.
>> >
>> > There's a problem (Quentin mentioned it in one of his replies): users
>> > don't use the tarball that the AB uses (in general, I assume) and
>> > versions are not pinned. So users are free to use whatever is on their
>> > system but hopefully have created a venv. But even if they're using a
>> > venv there's no guarantee that they're updating their tools regularly.
>>=20
>> We can pin the version required to build the docs in
>> documentation/tools/host_packages_scripts/pip3_docs.sh. This will become=
 the
>> minimum version of Pygments required to build the docs.
>>=20
>> > So we're left with the following situation:
>> > - the AB has to wait until the tarball is updated
>> > - users might be using older versions of pygments
>> >
>> > And then on top of that you layer on the situation of trying to genera=
te
>> > docs for older releases not to mention backports.
>>=20
>> The change in conf.py will not impact older releases, so they should be =
safe to
>> build, even if Pygments is updated with the bitbake lexer: it simply won=
't be
>> used, because highlight_language is still "default" on these.
>
> If we set:
>
> 	highlight_language =3D "bitbake"
>
> in conf.py right now, anyone who is not running pygments 2.21.0 will get
> warnings which translate to build failures via the Makefile's -W
> setting.

We're on the master branch, having such changes is acceptable, and we can s=
tate
the version of pygments needed in our requirements.

>> Note: I think this change is big enough that I don't consider it candida=
te for
>> backport on stable branches.
>>=20
>> > However, I can add a shim so that everything works out of the box
>> > today. The shim can be smart enough to examine the bitbake support
>> > independently (at runtime) and only load itself when it is needed
>> > (either an older version of pygments that has no support, or the 2.21.=
0
>> > version that needs additional support). If/when pygments is updated
>> > (after the next release and either because the user has updated their
>> > tools or the tarball has been updated) the shim will not load itself.
>> >
>> > Carrying a bitbake language shim in the docs repository itself:
>> > - the AB doesn't have to wait for an update, bitbake works today on al=
l
>> >   valid snippets
>> > - backports can start working today too, since tooling doesn't have to
>> >   be updated, the shim knows how to highlight bitbake independent of
>> >   tools or versions
>> > - we don't have to wait for the next release (5-6 months) for all
>> >   the bitbake snippets to parse correctly
>> >
>> > The nice thing about the shim (the way I've designed it) is it is
>> > dynamic. It will look for any bitbake support in the currently used
>> > tools. After running a tiny bit of testing it will load itself only:
>> > - if there is no bitbake support
>> > - if the bitbake support is incomplete
>> > Otherwise it won't load and won't interfere.
>> >
>> > Even once the next release of pygments occurs and full bitbake support
>> > exists, it will still be a good idea to carry the shim so that older
>> > docs, users with older tools, and the AB doesn't have to wait for a ne=
w
>> > tarball to get full bitbake highlighting.
>> >
>> > Also, this way we don't have to skip the non-working snippets today
>> > with a comments, all snippets will highlight today, no need to go back
>> > and fix things up in 6 months if someone remembers, etc. Full bitbake
>> > highlighting for everyone under any circumstance starting today and
>> > available forever across all versions of docs and tools.
>>=20
>> Considering what I've said above, do you really think that's necessary? =
To me it
>> feels like increased complexity considering we'll only add this feature =
on
>> master, and it should be straightforward from there to fix future stable
>> releases with backport patches when Pygments gets updated.
>
> What's the complexity? The shim is written, it's done, it works
> regardless of which pygments version anyone (AB, users) are using and it
> doesn't install if the conditions are met. No waiting, everyone gets all
> bitbake highlighted today.
>
> If anything not adding the shim *is* where the complexity lies. Once you
> accept the default conf.py patch the AB must be using the new pygments,
> and users will see build errors, and report them, until we point out
> they have to update their tools.

Please send it - perhaps as a separate patch - so I can review it.

Thanks,
Antonin

