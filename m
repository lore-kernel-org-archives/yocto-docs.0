Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3D7C61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 08:02:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31131.1787817761610933681
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 01:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kulYXftr;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 868681A1848;
	Thu, 27 Aug 2026 08:02:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59A08602B8;
	Thu, 27 Aug 2026 08:02:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E76BB11C782C2;
	Thu, 27 Aug 2026 10:02:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787817754; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LvX19whs+nKQDpuZkEQVq6Q+neaxj5heiAHasOZ7mPY=;
	b=kulYXftrXNzVqj4VtsrjqOcUx/YOAtIQZKVt4G0PnmPZRIX8SVPShYcR0L0c6SapjLJb3R
	Wi7JhpOF16pBW+R+Oa58eLQHMvpnfX6Y+KXYmE7kxmFXuzfcPKOE9Di7jhlU0hVb1fkniq
	5vXpaa4HLJn4dWSdoJUHZ5bsqVNXhEWwTP+9eHFzH/8/5BZCIsb5tMq42w2cIfcU3YtMOb
	7stMPYGtdUaEYlH1e7gqGBlA2VS8GMEHZn1uVtLvuM4L0Hp1qQFKS6og1drZZWB4T0EO46
	PpAYrrHpY7ygfoclRKqPuojcDRdtAruhVBfN33FdLwA5gGBvYliPkq6KNCZapw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 10:02:33 +0200
Message-Id: <DKZKI1KXQX7L.3G2TJYPXYINTD@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <twoerner@gmail.com>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
 <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
 <78a29634-d64c-48ed-a012-71fff5efcb75@cherry.de>
 <DKYYZ48110MA.28EKFR3DVIU9C@bootlin.com>
 <6f60c33e-17aa-45c9-b23a-dd46baa1a207@cherry.de>
In-Reply-To: <6f60c33e-17aa-45c9-b23a-dd46baa1a207@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 08:02:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10377

On Wed Aug 26, 2026 at 5:43 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
>
>
> On 8/26/26 5:10 PM, Antonin Godard wrote:
>> Hi,
>>=20
>> On Wed Aug 26, 2026 at 4:34 PM CEST, Quentin Schulz via lists.yoctoproje=
ct.org wrote:
>>>
>>>
>>> On 8/26/26 3:09 PM, Antonin Godard wrote:
>> [...]
>>>>> I think this is going the wrong direction. We should actually make
>>>>> explicit the language of every :: that is NOT to be understood as
>>>>> BitBake code and then make the default highlight language be BitBake.
>>>>
>>>> But then this might get forgotten? How about having the default highli=
ghted as
>>>> "none", and make _everything_ use explicit code-blocks?
>>>>
>>>
>>> """
>>> The direct benefit is the ability to still backport whatever needs to b=
e
>>> backported without having to care about the highlight language being
>>> explicitly bitbake (which won't be available in every branch but master=
).
>>> """
>>>
>>> *exactly* the sentence after what you quoted.
>>>
>>> It's bound to happen someone will want to backport a patch with
>>>
>>> .. code-block:: bitbake
>>>
>>> Either we'll forget during review and it'll break the docs build, or we
>>> need to adapt each and every patch/commit for stable branches.
>>>
>>> I'm usually the one trying to add friction to processes, but I don't
>>> think the above is a good idea.
>>>
>>> I'm trying to avoid having code-blocks set to use the bitbake lexer so
>>> we can easily backport without having to care.
>>=20
>> Our current active releases where we backport patches are Wrynose and Sc=
arthgap.
>> Both use the same buildtools tarball on the Autobuilder, and contain the=
 same
>
> But should they? Aren't we supposed to build the docs with an SDK we=20
> build from the same branch as the one from the docs?

It's been like this for a while now, and has not caused issues. I'm afraid
maintaining several SDKs for each branch would be a bit painful, although i=
t's
probably the "right" thing to do.

[...]
>> This is interesting! If it behaves the same way with whatever highlight_=
language
>> you set in conf.py, then this would be less of an issue I guess.
>>=20
>
> I don't know for sure without looking at Sphinx's source code but my=20
> reading of the docs says "no", this is specific to "default"=20
> (highlight_language =3D "default", which is the default value if absent).
>
> highlight_block() in sphinx/highlighting.py has a check when there's a=20
> parsing error to use none if the language is currently "default".=20
> Reading a bit further down, there's a check on the force flag. I'm=20
> assuming this comes from :force: from rST, so I'm not sure whether we=20
> can actually pass it by default (and in any case, we would still have a=
=20
> big fat warning, which we don't with the "default" value).
>
> "default" seems to be a synonym of Python in get_lexer() as well, so not=
=20
> sure we can simply decide "actually, no rather bitbake instead of python=
=20
> lexer".
>
> I haven't had a deeper look than that into Sphinx source code.

I've tested it directly: setting highlight_language to "bitbake" would prod=
uce
errors in case Sphinx fails to highlight a code-block.

Antonin

