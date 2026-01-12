Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AFCCF45BF
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 17:57:45 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39384.1768240659380501352
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 09:57:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=cGueRZuV;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z365gEoJLx04/DrYlzpdWt1yb3o8gyPwem7Sdjtcd7w=; b=cGueRZuVN6FDbTkGbIGp4H1nMJ
	Z+5sKaGGScFfUc6voHxEJfaYMHi8a/cOH1LS5EYICmmyNZ03g1XGe2n7FWHebm0Vb0ArMZe22k2O/
	WIVkJ5H0mYdzfWvXFo8dUOdF5KRLZYkDznovvFy4C4EWK3VguL23nX/3SV5DUcQN9ft40eRhSZPfr
	Cw0KmKFmR9ooivcs9Kn+wwmie3rKIOxYxbUFFebA4dDG/9f971xXusdHN6qqYIJTEVeGhIiL91pLg
	iE5+aM+HsDvH3Ef9g/37cyAt814Qm2HYOOq4b/JLfxB/8YOeXv9u1qpgFq9wwyIZrwgtBUAzaJUJC
	3vqLUpdw==;
Received: from [147.129.179.166] (port=37558 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vfMAb-0000000Gjwj-1OfS;
	Mon, 12 Jan 2026 12:57:37 -0500
Date: Mon, 12 Jan 2026 13:00:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: quentin.schulz@cherry.de
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] why is "configuration fragments" in monospaced font?
In-Reply-To: <f98abd3b-78da-4d20-886a-a08284d88641@cherry.de>
Message-ID: <c72f1d20-7006-e705-8674-12133dfcd1db@crashcourse.ca>
References: <7dbf2502-1403-3451-ea27-45aeae758032@crashcourse.ca> <4c7492bc-177f-4bb4-a8f4-cc19323fd242@cherry.de> <d59faeb3-8e61-7023-cc26-3918de5f0ab0@crashcourse.ca> <e118a38e-0e45-49f2-9010-01c1a4d7d1ad@cherry.de> <21105206-6e15-da26-2da0-de604fc4c905@crashcourse.ca>
 <f98abd3b-78da-4d20-886a-a08284d88641@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Jan 2026 17:57:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8473

On Mon, 12 Jan 2026, Quentin Schulz via lists.yoctoproject.org wrote:

>
>
> On 1/12/26 6:21 PM, Robert P. J. Day wrote:
> > On Mon, 12 Jan 2026, Quentin Schulz via lists.yoctoproject.org wrote:
> >
> > > Hi Robert,
> > >
> > > On 1/12/26 5:50 PM, Robert P. J. Day wrote:
> > > > On Mon, 12 Jan 2026, Quentin Schulz wrote:
> > > >
> > > > > Hi Robert,
> > > > >
> > > > > On 1/9/26 12:45 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> > > > > >
> > > > > >      more nitpick ... here:
> > > > > >
> > > > > > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#sharing-functionality
> > > > > >
> > > > > > last line in that opening section, why is the phrase "configuration
> > > > > > fragments" rendered in monospaced? is that meant to be an actual
> > > > >
> > > > > So it doesn't feel left out with addfragments right after being
> > > > > monospaced
> > > > > too? More seriously, I don't know, but I wager the intent was to make
> > > > > the
> > > > > text
> > > > > italic as to highlight that it's a two-word term?
> > > > >
> > > > > Would you mind sending a patch for it?
> > > > >
> > > > > While at it, I think it makes sense to modify the "``addfragments``
> > > > > directive"
> > > > > part with a link to the section in the docs. Maybe another patch to
> > > > > send?
> > > > >
> > > > > Also, this pertains to bitbake user manual, so I think it'd make sense
> > > > > to
> > > > > add
> > > > > the bitbake ML when asking about bitbake-specific docs (both BB and
> > > > > YP-docs ML
> > > > > that is).
> > > >
> > > >     I notice you just posted a set of patches to fix a bunch of the
> > > > references, but it also seems that there are different syntaxes being
> > > > used for some of those references. What is the blessed way to name and
> > > > set references across the YP docs, and the proper way to then access
> > > > them? There seems to be a lack of consistency.
> > > >
> > >
> > > Can you write down those inconsistencies so we can discuss them?
> >
> >    let me check if i didn't just misunderstand. it might be that i was
> > confusing how one refers to am implicit ref associated with any
> > section/subsection, and the longer form associated with an explicit
> > ref definition.
> >
>
> I guess you mean
>
> :ref:`inherit_defer
> <ref-bitbake-user-manual-metadata-inherit-defer>`
>
> versus
>
> :ref:`inherit_defer
> <bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit_defer\`\`
> Directive>`
>
> and why we have a mix sometimes for the same cross-reference, or for different
> directives.

 yup, that is exactly what i was talking about.

> The answer is likely "we forgot/didn't know we had autosectionlabel
> Sphinx plugin enabled and added labels by hand". I would be for
> getting rid of the manual labels in favor of the autosectionlabel
> wherever applicable and mentioning this in some README (I believe we
> have standards.md in yocto-docs that would be more appropriate?).
>
> Can I interest you in sending patches to make this consistent across
> both BB and YP docs? (Barring Antonin disagreeing of course :) ).

  i'll take a shot at that, won't be today, though. and let's hear
what antonin has to say first.

rday

