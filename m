Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DB1CD98F6
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 15:51:54 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22617.1781797912322736163
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 08:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=HhQQS99M;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M4sX01RLM405z8EloIOBavE4544EllOg+LlR8slqWhs=; b=HhQQS99MWfHZkWfIzepg0qSSLw
	xshOiC5Yzz3MO6Hh+RPGPmbDO5Bq+mmikLyLs4WCXwdwTryJaDPpJOafpG0iI4Bbk5wb3ekiMjpcn
	g5VY998p09HcsVRO8tFoTC5FOBqLnLGCA31J7cC16GGMMLc3ytlj+x7v2zqXTl0d6qQkoZfyctJnC
	qw3auPhmcxz86P6j8DyXjl6XDAd1KaQs+BSOZxqUYZOg5UxiHs68vamN+t3Xb14/oRc17ZjRVYOWz
	h0xIIPoftoKcBcxQ8zt8ltJRhM47lpvWOW+IQyUMgfC3VYNZTqElHnAeMYv35oNt6up0A5sc5Xd9z
	QxdZQaXg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:58372 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1waF1y-00000000YjN-0eVn;
	Thu, 18 Jun 2026 11:51:50 -0400
Date: Thu, 18 Jun 2026 11:51:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] security-manual: warn about "root-login-with-empty-password"
 fragment
In-Reply-To: <DJCAGY65HVKN.1IHCE1K9T6NJ@bootlin.com>
Message-ID: <f01f3416-7877-ae16-66bb-18efe616e701@crashcourse.ca>
References: <c6714d6e-8855-6c07-3c7e-2841d7f314f8@crashcourse.ca> <DJCAGY65HVKN.1IHCE1K9T6NJ@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Thu, 18 Jun 2026 15:51:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9784

On Thu, 18 Jun 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Thu Jun 18, 2026 at 3:09 PM CEST, Robert P. J. Day wrote:
> >
> > Mention that the development-related features that make an image less
> > secure might have also been added via a configuration fragment.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/security-manual/securing-images.rst b/documentation/security-manual/securing-images.rst
> > index 952808f3b..5493b32aa 100644
> > --- a/documentation/security-manual/securing-images.rst
> > +++ b/documentation/security-manual/securing-images.rst
> > @@ -108,6 +108,13 @@ system to make your images more secure:
> >     logging in for debugging or inspection easy during development but
> >     also means anyone can easily log in during production.
> >
> > +   .. note::
> > +
> > +      It is also possible to set those same image features by including the
> > +      :term:`OpenEmbedded-Core (OE-Core)` configuration fragment
> > +      ``root-login-with-empty-password.conf``, so make sure that that
> > +      fragment has not been activated for your build configuration.
> > +
> >  -  It is possible to set a root password for the image and also to set
> >     passwords for any extra users you might add (e.g. administrative or
> >     service type users). When you set up passwords for multiple images or
>
> I'd rather replace the paragraph with an instruction on how to enable this
> fragment, instead of an additional note. What do you think?

  except that the point of that section is to caution the developer as
to how to *not* have those image features selected. i can rewrite it
to explain the two ways that those features can be selected, then
caution against them. does that sound reasonable? or did you mean
something else?

rday

