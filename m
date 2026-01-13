Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE56D0C842
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:29:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55910.1768300188471215071
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 02:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=E8zc9crm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6B1404E4209F;
	Tue, 13 Jan 2026 10:29:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B1CE60732;
	Tue, 13 Jan 2026 10:29:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B61F7103C8A57;
	Tue, 13 Jan 2026 11:29:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768300185; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E1yBV5sE4FktwFjG2c9iV5v9CEsNlUFoYJxz2CHc7vw=;
	b=E8zc9crmIHrBESJRxDuWMUcnCdAMcvzm1MP++pdMjwDYqkmN5InV9UEuk/8AT2i2+4Ss5A
	PiJ6ErqWbkMmbxaj2Ey6msv4EDhMMNLf71DIR5p5nq6UVPHIYD/RwarML5F954gdjVl8rk
	piOZ2OMyhjkTuKRIpuCMiuEWWg8dhy63hTQYNWpFa5RnvDhwx0mtyPDc3vwgdG84mLjM0I
	NbiufmRj+oxOwU2kXRxR/MElK9dp0n4b7FnFyDxoclxxHqtRzrmB08F9ZLeiBmKd5CKq2V
	USe/oiYdV8Q0Znk7FuaeEmj73WQVeVO++SOKGZ5Jd5swPPg8zWiQSGoYi2lkQQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 11:29:44 +0100
Message-Id: <DFNE3LZGWR7Z.296DD6XD8Y4ZK@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, <quentin.schulz@cherry.de>
Subject: Re: [docs] why is "configuration fragments" in monospaced font?
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <7dbf2502-1403-3451-ea27-45aeae758032@crashcourse.ca>
 <4c7492bc-177f-4bb4-a8f4-cc19323fd242@cherry.de>
 <d59faeb3-8e61-7023-cc26-3918de5f0ab0@crashcourse.ca>
 <e118a38e-0e45-49f2-9010-01c1a4d7d1ad@cherry.de>
 <21105206-6e15-da26-2da0-de604fc4c905@crashcourse.ca>
 <f98abd3b-78da-4d20-886a-a08284d88641@cherry.de>
 <c72f1d20-7006-e705-8674-12133dfcd1db@crashcourse.ca>
In-Reply-To: <c72f1d20-7006-e705-8674-12133dfcd1db@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 10:29:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8480

Hi,

On Mon Jan 12, 2026 at 6:57 PM CET, Robert P. J. Day wrote:
> On Mon, 12 Jan 2026, Quentin Schulz via lists.yoctoproject.org wrote:
>
>>
>>
>> On 1/12/26 6:21 PM, Robert P. J. Day wrote:
>> > On Mon, 12 Jan 2026, Quentin Schulz via lists.yoctoproject.org wrote:
>> >
>> > > Hi Robert,
>> > >
>> > > On 1/12/26 5:50 PM, Robert P. J. Day wrote:
>> > > > On Mon, 12 Jan 2026, Quentin Schulz wrote:
>> > > >
>> > > > > Hi Robert,
>> > > > >
>> > > > > On 1/9/26 12:45 PM, Robert P. J. Day via lists.yoctoproject.org =
wrote:
>> > > > > >
>> > > > > >      more nitpick ... here:
>> > > > > >
>> > > > > > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitb=
ake-user-manual-metadata.html#sharing-functionality
>> > > > > >
>> > > > > > last line in that opening section, why is the phrase "configur=
ation
>> > > > > > fragments" rendered in monospaced? is that meant to be an actu=
al
>> > > > >
>> > > > > So it doesn't feel left out with addfragments right after being
>> > > > > monospaced
>> > > > > too? More seriously, I don't know, but I wager the intent was to=
 make
>> > > > > the
>> > > > > text
>> > > > > italic as to highlight that it's a two-word term?
>> > > > >
>> > > > > Would you mind sending a patch for it?
>> > > > >
>> > > > > While at it, I think it makes sense to modify the "``addfragment=
s``
>> > > > > directive"
>> > > > > part with a link to the section in the docs. Maybe another patch=
 to
>> > > > > send?
>> > > > >
>> > > > > Also, this pertains to bitbake user manual, so I think it'd make=
 sense
>> > > > > to
>> > > > > add
>> > > > > the bitbake ML when asking about bitbake-specific docs (both BB =
and
>> > > > > YP-docs ML
>> > > > > that is).
>> > > >
>> > > >     I notice you just posted a set of patches to fix a bunch of th=
e
>> > > > references, but it also seems that there are different syntaxes be=
ing
>> > > > used for some of those references. What is the blessed way to name=
 and
>> > > > set references across the YP docs, and the proper way to then acce=
ss
>> > > > them? There seems to be a lack of consistency.
>> > > >
>> > >
>> > > Can you write down those inconsistencies so we can discuss them?
>> >
>> >    let me check if i didn't just misunderstand. it might be that i was
>> > confusing how one refers to am implicit ref associated with any
>> > section/subsection, and the longer form associated with an explicit
>> > ref definition.
>> >
>>
>> I guess you mean
>>
>> :ref:`inherit_defer
>> <ref-bitbake-user-manual-metadata-inherit-defer>`
>>
>> versus
>>
>> :ref:`inherit_defer
>> <bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit_defer\`\`
>> Directive>`
>>
>> and why we have a mix sometimes for the same cross-reference, or for dif=
ferent
>> directives.
>
>  yup, that is exactly what i was talking about.
>
>> The answer is likely "we forgot/didn't know we had autosectionlabel
>> Sphinx plugin enabled and added labels by hand". I would be for
>> getting rid of the manual labels in favor of the autosectionlabel
>> wherever applicable and mentioning this in some README (I believe we
>> have standards.md in yocto-docs that would be more appropriate?).
>>
>> Can I interest you in sending patches to make this consistent across
>> both BB and YP docs? (Barring Antonin disagreeing of course :) ).
>
>   i'll take a shot at that, won't be today, though. and let's hear
> what antonin has to say first.

The autosectionlabel plugin works until a certain section depth, IIRC, so
deeply nested sections won't be automatically labeled. In that case fallbac=
k to
custom references. And you can't really increase that level otherwise you g=
et
the same label multiple times in some documents, making Sphinx unhappy.

I personally prefer a mix of both. One one hand, high-level sections are ni=
ce to
have autolabeled. But on the other hand, a well chosen naming convention is=
 also
very useful. For example: if I want to reference a class by its name, I kno=
w
I'll just have to write ":ref:`ref-classes-<name>`". Same goes for tasks an=
d
fragments.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


