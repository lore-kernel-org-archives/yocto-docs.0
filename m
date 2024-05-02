Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF20FC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 19:45:10 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.4080.1714679103089169261
 for <docs@lists.yoctoproject.org>;
 Thu, 02 May 2024 12:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IExXKsZJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA2091BF205;
	Thu,  2 May 2024 19:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714679101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XKVqaKVE2uNu58A/g9EpDoAYZjytXIqnm1oBtgIwSxY=;
	b=IExXKsZJNReNhHDoS7CFVmFSDegYeTGg1a9PEiHPhnCXxnpQH4lc++PIrQscmykUeSYgUP
	2H1BwJ/Hlq6CJ2e/CK+HYGpXlQhqkztJtdTiaH+dTEKmlDT7lrCIoElCs3tfEeRVcV/Nxz
	EN4xbgGNAs6I/wN2y2yxGBbuayuiPE5iem0xDFP2sKiDHlAW+qNKV+kBs6ZY8cTieYf7NR
	jGehj+8HCpsEd5fMIVtK+GBVJISFJZpFHzpemZc2rtVB25/g+5yy1AdyS9ed0XF+eMx7MD
	RonCiheqF98YGhDLPdbW0t3t5VUcpEqC4yoYx2EKsucF0RD1R9FyqfEqM/kQpw==
Date: Thu, 2 May 2024 21:45:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Tim Orling <tim.orling@konsulko.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] contributor-guide: recommend
 format.forceInBodyFrom
Message-ID: <202405021945001e34cffa@mail.local>
References: <20240502152701.1798568-2-tim.orling@konsulko.com>
 <20240502191839a351b43b@mail.local>
 <CAJdd5GbY+WkMHOsMnv0U+WOLfOk=FM0OFH=yxqRNMGwxV5cDDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJdd5GbY+WkMHOsMnv0U+WOLfOk=FM0OFH=yxqRNMGwxV5cDDg@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 19:45:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5207

On 02/05/2024 13:25:54-0600, Joshua Watt wrote:
> On Thu, May 2, 2024 at 1:18 PM Alexandre Belloni via
> lists.yoctoproject.org
> <alexandre.belloni=bootlin.com@lists.yoctoproject.org> wrote:
> >
> > On 02/05/2024 08:27:02-0700, Tim Orling wrote:
> > > We are seeing a lot of patches failing when the From:
> > > line is not contained in the message body. It is probably
> > > better to just recommend to force the in-body From: to be
> > > present globally.
> > >
> > > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > > ---
> > >  documentation/contributor-guide/submit-changes.rst | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> > > index 47a416b24..c292a143a 100644
> > > --- a/documentation/contributor-guide/submit-changes.rst
> > > +++ b/documentation/contributor-guide/submit-changes.rst
> > > @@ -65,6 +65,11 @@ use to identify your commits::
> > >     git config --global user.name "Ada Lovelace"
> > >     git config --global user.email "ada.lovelace@gmail.com"
> > >
> > > +To ensure that your patches are formatted properly, it is also
> > > +recommended to set::
> > > +
> > > +   git config --global format.forceInBodyFrom true
> > > +
> >
> > I do believe the current documentation already points to a working
> > solution:
> >
> > https://docs.yoctoproject.org/contributor-guide/submit-changes.html#fixing-your-from-identity
> >
> > Doesn't that work for you?
> 
> Empirically, that is insufficient. I've had that set and it mangled my
> From line anyway. I beleive that only affects the SMTP header From,
> when you actually need the "correct" From in the message body as a Git
> header (which is what format.forceInBodyFrom does). Besides, most
> people probably already set that anyway because I think it prompts if
> you don't have it set

I'm pretty sure this has ensured the From: was in the body for us at
Bootlin.

> 
> >
> > >  Clone the Git repository for the component to modify
> > >  ----------------------------------------------------
> > >
> > > --
> > > 2.43.2
> > >
> > >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#5205): https://lists.yoctoproject.org/g/docs/message/5205
> > Mute This Topic: https://lists.yoctoproject.org/mt/105864996/3616693
> > Group Owner: docs+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [JPEWhacker@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

