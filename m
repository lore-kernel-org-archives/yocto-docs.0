Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F34EC83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 14:20:35 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.17124.1752070830525461321
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 07:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=a8o5AIyc;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IaDpm6AgZRLO6YFkRInLKdKGvzbcX6MfyIPETgPdf7Y=; b=a8o5AIycDfHPnc0oyBmwP/OTRP
	pvd5oI1A3Ttie+vD9RhS4fEdmlvGhXG1Ih7Ix46TdXmP93OZMl5Vkg20yOZy+qmocZVfWAxDsAl2c
	SSi10aYkkHna4Gys7XE7bo97EZsXh+d2Fw6p1x3DiinZl4z/Whkbu1LX8r7ZrMU+BtOJQZlWtMpB8
	6zfJzpvcxS7sepozKYeaFfzYA100YqVdGmQmIeWp2YE+AJn03ezl3ANgNZFw7W6O21HkElJp0Hoq7
	7/VygJ2NMAcJnzWwmVJpy/vrUxTX5JdchLqMVeW/yeTJCzTglNB101na8uZHr9sqdgjT3d1pzrz/v
	d/zikf0g==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:48988 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uZVeq-0000000AxJz-2paB;
	Wed, 09 Jul 2025 10:20:28 -0400
Date: Wed, 9 Jul 2025 10:20:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] more docs curiosity: "inherit_defer" in the BB manual
In-Reply-To: <63ac037ab19af1c1fa58290261318bebcc2db6be.camel@linuxfoundation.org>
Message-ID: <53128fdc-ad85-ec69-b5f8-ff70664e883e@crashcourse.ca>
References: <764e27fc-0e53-777a-3427-4989e8d79403@crashcourse.ca> <63ac037ab19af1c1fa58290261318bebcc2db6be.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1561329181-1752070826=:787305"
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 14:20:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7297

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1561329181-1752070826=:787305
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 9 Jul 2025, Richard Purdie wrote:

> On Wed, 2025-07-09 at 09:31 -0400, Robert P. J. Day via
> lists.yoctoproject.org wrote:
> >
> > here:
> >
> > https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#inherit-defer-directive
> >
> > that section strongly suggests that the sole reason to use
> > "inherit_defer" is that you want to inherit some class, but you're
> > not
> > sure which class *yet*, so you use a variable that will, at some
> > point, be set before parsing is complete. or possibly it will involve
> > a programmatic condition.
> >
> >   so what is the purpose of using "inherit_defer" on a fixed bbclass
> > name such as this?
> >
> > https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/qemu/qemu-native.inc#n3
> >
> > what is the rationale of inherit_defer'ing a fixed class name? or is
> > there more to this that i'm missing?
>
> native has to be last. That means it has to be deferred.
>
> I think bitbake now happens to handle this magically after more recent
> changes, just to complicate the story.

  i had assumed the first bit, i am unfamiliar with the second bit, so
here's my thinking.

  the section on plain "inherit":

https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#inherit-directive

already explains (in the Note) that the placement of "inherit"
directives is important as that might affect what you will and will
not be allowed to override, so that part seems fine.

  the last line in that section, though:

"For inheriting classes conditionally, using the inherit_defer
directive is advised ..."

is now clearly(?) misleading since it suggests it is to be used solely
for conditional inheriting, which is not entirely true.

  i think a clearer way to explain this is to just drop that last
sentence from that section and then, in the following "inherit_defer"
section, explain that it is *mostly* used for conditional inheritance
(involving variables), but *might* be seen in cases like that "inherit
native" example (unless that last part is such a corner case that it
can remain unexplained, and not over-complicate the explanaton).

  thoughts?

rday
--8323329-1561329181-1752070826=:787305--

