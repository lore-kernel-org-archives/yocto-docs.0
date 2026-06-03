Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE78FCD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 14:27:09 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21653.1780496827344733298
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 07:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=zb39z9RU;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9iEawKiGpoZ0WjOIPOEHJfOQwOsao97V7zqwcCELmnw=; b=zb39z9RUjopx3FHyhPoLocEOYc
	VJszJVMz0397fhaLYxXTYYZXrDZZA4+LDAhYC5pzQj187kqpcShNhgv0DTQzYULmne3PuPtlCB2Pi
	9LxuhdK2uRlidzajJ67oXiP3CGRc+pArD3Y+VwsFdDYBBJRFKQTJ1ihb5O1NQqETfg2zGUlBwPUI/
	oPWIP8UGycOe3fIR1fZO5w1342f/GOMtEG1Xy7+0BLS0f4zPXaDwv0ROFfH5KQPbuZr1qDPJzX0d9
	+6tkr4h7kpvhXQQahLqjaGM5cG5Z507Zrtdxfz56a892kaArU/aj6oSb8gNlgkYDi6FPe8/4HVVQl
	wVDZdMuA==;
Received: from [147.129.179.166] (port=36766 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wUmYi-00000008nbB-1GAd;
	Wed, 03 Jun 2026 10:27:06 -0400
Date: Wed, 3 Jun 2026 10:26:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] why is CROPS listed under "Archived Components"?
In-Reply-To: <CANNYZj8eVskSFhvbtuzkQ6ACE1fTnuBpxvHFQS-Rh6RFMbeJWA@mail.gmail.com>
Message-ID: <ad7a1c06-a9fd-2efa-c283-fef8905ecd12@crashcourse.ca>
References: <bc5c1023-203b-aa92-b799-3c5fd584d2bc@crashcourse.ca> <CANNYZj8eVskSFhvbtuzkQ6ACE1fTnuBpxvHFQS-Rh6RFMbeJWA@mail.gmail.com>
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
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 14:27:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9562

On Wed, 3 Jun 2026, Alexander Kanavin wrote:

> On Wed, 3 Jun 2026 at 15:20, Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
> > here:
> >
> > https://docs.yoctoproject.org/overview-manual/yp-intro.html#archived-components
> >
> > the title "Archived Components" strongly suggests stuff that is
> > deprecated or no longer under active development, but that list
> > includes CROPS, which is clearly described as the current best vehicle
> > for doing builds on a non-Linux system.
> >
> >   that seems to be sending mixed messages.
>
> Something can be unmaintained, and also the best currently available
> option. These are not mutually exclusive characteristics. How would
> you change the text? Is there a better option available?

  OK, we can just leave it as is.

rday

