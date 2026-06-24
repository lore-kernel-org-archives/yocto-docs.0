Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30281CDB471
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:54:37 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6343.1782305675059072840
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 05:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=WnBxmn2g;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M5VREOzpPxBefA0fkv2r1+S9jXLdUkcWR2eUX+8oAPI=; b=WnBxmn2ge9ocem9xS2gMcDo8x3
	mLytw66PA+5hUdZN9W7tkLRpgWCQjDFekIotqSOgGb+cXxXmoInqL+H86UUoqI5DFc/Km0uazL+yt
	uP5SqLbFAlPZTA+e4qKFjkm3xbWrlHI8o1FuvXMbouLgrCRt5YoJJ8o5sgdLry8oK2HbTaY+gvU2X
	nC1KK2gyXXmAL+Zh87uQ99/ceOkDBvDKyMFxIrrY1inCjx9fb2S5ksVsjoySi6C79oYuPwAz9Q6Sj
	PUB5gXJjZNUdE0RUyjG4ocMmNtICWnGbL6rBWoXHOcu/5HfXCrLdWkLhwHIGMhZUdYjiXUflM/5t/
	DpyA6u+w==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:33092 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcN7b-0000000FXFD-3NKy;
	Wed, 24 Jun 2026 08:54:33 -0400
Date: Wed, 24 Jun 2026 08:54:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: under meta/files, mention Wic files
In-Reply-To: <f2a68e35-0218-41f3-b589-a1b75e392093@cherry.de>
Message-ID: <7db876ce-0f2b-d0dc-0f1e-220acb44c972@crashcourse.ca>
References: <97f6205e-b80d-d845-717b-8a71bfca415f@crashcourse.ca> <f2a68e35-0218-41f3-b589-a1b75e392093@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 12:54:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9866

On Wed, 24 Jun 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/22/26 9:44 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Add a reference to image Wic files under meta/files.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/ref-manual/structure.rst
> > b/documentation/ref-manual/structure.rst
> > index ff84b250b..a55b3ba56 100644
> > --- a/documentation/ref-manual/structure.rst
> > +++ b/documentation/ref-manual/structure.rst
> > @@ -868,7 +868,8 @@ layer.
> >   ---------------
> >
> >   This directory contains common license files and several text files used
> > -by the build system. The text files contain minimal device information
> > +by the build system, as well as Wic files that define generated image
> > layouts.
>
> Please always try to find cross-references we could use.
>
> Here at the very least the wic dedicated page /dev-manual/wic or
> possibly rather the WKS /ref-manual/kickstart.rst since I'm assuming
> it's what we store there?

  good point, will fix.

> The wording is a bit odd to me too, it could be understood as wic
> files being a representation of image we generate but it's actually
> the opposite! wic files are used to generate image binaries!

  as i'm waiting for a lengthy compile, i will wax poetic about this
very point as the choice of words can be interpreted very differently.
in the above, the word "define" would normally be interpreted as a
driver of a process while, if i meant in the other direction, i would
have used the word "represented".

  "a" defines "b": the content of "a" in some way produces "b"
  "a" represents "b": "a" is a result of processing the contents of "b"

the best literary example of this is mark twain's savage evisceration
of the works of american author james fenimore cooper:

https://www.gutenberg.org/files/3172/3172-h/3172-h.htm

i would read the whole thing but the relevant part here is near the
bottom, where twain points out that cooper's "word-sense" is flawed
in that he regularly chooses the wrong word so, yes, one has to be
careful about word choice.

rday

