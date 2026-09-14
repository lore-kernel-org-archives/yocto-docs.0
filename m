Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA41C88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 08:31:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15666.1789374707875825735
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 01:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HTBqVUMj;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9A0C91A046E;
	Mon, 14 Sep 2026 08:31:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E0E660323;
	Mon, 14 Sep 2026 08:31:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7343411C7AFEC;
	Mon, 14 Sep 2026 10:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789374704; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vs/OtnV/CoGWscdDOk4ZqdlpqbQhXRXtIcFTZKvGZbg=;
	b=HTBqVUMjr2oPAOFB32ZQ582tRr5I8rPbDG8b5jEmOhFHVclBltOoShfRnIWznPKGIEdlU+
	SUlKaAHeNW+zOkIZB2PeW3SUhFdhWZAfqPsA22gwpNUMm4d6Yf+LIef9C1KKQUbewSwrbY
	qa8eI0FMm8xHj2IZV+JXa7W5soZpN88Z26ErFtUb5TMdQdx5YWIZX6SZSjMPBHcw+hA/tX
	wsAGx7G+Fk6NMLEcmGYTWhk4Izfqnbhp0C8QUfhjvZkOArYFc1QNBIkyRLfj9gqzo2Jbs6
	wGc26HyrNuWCVNzhEui+/BoYGRsIw02D33Z4FjlRjZuyP7mUBXFvpoPAZdDomQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 10:31:42 +0200
Message-Id: <DLEWE65BFU3W.A4IWZNKSX1NU@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 <richard.purdie@linuxfoundation.org>
Subject: Re: [docs] Does Ubuntu 24.04 and newer still require AppArmor
 tweaking to run bitbake?
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
References: <ec2658dc-005e-f6cc-d64e-0a1c15e992a7@crashcourse.ca>
 <DLCBCIBSXUHT.2SR3V23FN8VPD@bootlin.com>
 <f983a674-d30d-7659-45f8-ac32a1187c41@crashcourse.ca>
 <a1ade29f24430238de77852ca5a8045e774a7d75.camel@linuxfoundation.org>
 <e2e6840c-d972-d4d4-4c67-ba54cae6dce4@crashcourse.ca>
In-Reply-To: <e2e6840c-d972-d4d4-4c67-ba54cae6dce4@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 08:31:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10483

On Fri Sep 11, 2026 at 7:41 PM CEST, Robert P. J. Day wrote:
> On Fri, 11 Sep 2026, Richard Purdie via lists.yoctoproject.org wrote:
>
>> On Fri, 2026-09-11 at 05:16 -0400, Robert P. J. Day via
>> lists.yoctoproject.org wrote:
>> > On Fri, 11 Sep 2026, Antonin Godard via lists.yoctoproject.org wrote:
>> >
>> > > Hi,
>> > >
>> > > On Thu Sep 10, 2026 at 2:57 PM CEST, Robert P. J. Day wrote:
>> > > >
>> > > > =C2=A0 I use stock Debian so I haven't needed to mess with this, b=
ut
>> > > > Ubuntu
>> > > > once had this issue with AppArmor:
>> > > >
>> > > > https://developerwiki.proventusnova.com/Error:_BitBake_+_AppArmor_=
User_Namespace_Restriction_Fix
>> > > >
>> > > > If that's still a problem, it doesn't seem to be mentioned in the
>> > > > docs.
>> > >
>> > > I don't have a running Ubuntu 26.04 distribution but I would say it
>> > > is still the
>> > > case if 26.04 is still running AppArmor.
>> > >
>> > > Users will face the same error as before which is:
>> > >
>> > > =C2=A0 bb.fatal("User namespaces are not usable by BitBake, possibly=
 due
>> > > to AppArmor.\n"
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "See
>> > > https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-release=
-notes/39890#unprivileged-user-namespace-restrictions
>> > > =C2=A0for more information.")
>> > >
>> > > In OE-Core's meta/lib/oe/sanity.py.
>> > >
>> > > This sounds like something we could say in the docs. Would you mind
>> > > sending a
>> > > patch for that?
>> >
>> > =C2=A0 seems to me that the proper place for this would be a "warning"
>> > admonition at the tail end of this section:
>> >
>> > https://docs.yoctoproject.org/ref-manual/system-requirements.html#supp=
orted-linux-distributions
>> >
>> > i wouldn't want to get into incredible detail there, just point out
>> > that starting with ubuntu 24.04, you would get that namespaces error,
>> > then refer the reader to that discourse link for the solution. does
>> > that sound adequate? i don't think the YP docs need to reproduce the
>> > solution in its entirety.
>>
>> This is important enough I think we should have it documented
>> ourselves, not externally where it could disappear.
>
>   So where should it go, and is anyone else keen on doing it? :-)

I think it should go under the "Ubuntu and Debian" section in a "warning"
admonition, as you suggested:
https://docs.yoctoproject.org/ref-manual/system-requirements.html#ubuntu-an=
d-debian

Thanks!
Antonin

