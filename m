Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9FDCD8CB9
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 16:38:39 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84527.1781023111499744198
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 09:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=XaNOPmVr;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YLMfdThpV3pIaIBrK54aXa+niyzN2iPqVJiPrE3vy3A=; b=XaNOPmVrtK7GNKPKFgRGeqTIHt
	zr5q5hxt8hxTgkO20Dapx55J/ehbCvtHvawtFzp9qEA9bjVcbivdtXAXF2B3rMXKwvcfl2yjvmMKa
	TXr6hR7VX+ro/eOsIY0NtZVfUscqCRcApslg4QsO6Wuj4zNXzgCcXQiqFJSIw7+nLm2Dwa2UZFHhG
	hnvniJTuN5PBF5K6l2fjHaudcgR16aeG9uXbyTjhj4c+qY6S097pByg+f8SF/ZyrAjIcWD0E1tJs1
	HRwh1Eq3o2Lrvgh6sAo/QBr3dxb8HAfEagSzNmbBf1diRhtJkre9c5zgdu4i363/SrUywoEdB+cHP
	eKmu2ejg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:37214 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wWzTB-00000006axH-0IAg;
	Tue, 09 Jun 2026 12:38:30 -0400
Date: Tue, 9 Jun 2026 12:38:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] some questions about "Post-Installation Scripts"
 section
In-Reply-To: <dc7c0897403cdbcf8cd3cc81d846b005a0d6744c.camel@linuxfoundation.org>
Message-ID: <7432f7bd-bbcb-12f5-a922-39fcb68e889c@crashcourse.ca>
References: <1a3cabf4-b125-abd1-ac52-a45007cc9103@crashcourse.ca> <dc7c0897403cdbcf8cd3cc81d846b005a0d6744c.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-645812123-1781023109=:3168622"
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
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 16:38:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9666

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-645812123-1781023109=:3168622
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 9 Jun 2026, Richard Purdie wrote:

> On Tue, 2026-06-09 at 11:37 -0400, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > i'm curious about the content of this section:
> >
> > https://docs.yoctoproject.org/dev-manual/new-recipe.html#post-installation-scripts
> >
> >   let's start with the first sentence:
> >
> > "Post-installation scripts run immediately after installing a package
> > on the target or during image creation when a package is included in
> > an image."
> >
> >   my understanding until now is that scripts defined with
> > "pkg_postinst" can run at one of two times:
> >
> >   1) on the build host when a package is installed in the image, or
> >   2) on the target *during first boot*
> >
> > that first sentence suggests it can be run "after installing a package
> > on the target". that doesn't sound right, is that supposed to mean at
> > first boot? it seems confusing.
>
> The sentence is correct and post install scripts can be run after
> installing a package on target. You're missing a "3) a package is
> installed on a target".

  ah, so that opening sentence is also missing a scenario -- first
boot time. so the list of possible invocations of pkg_postinst() is:

  1) on build host when installed in image
  2) at first boot time
  3) when installed on a running target

and a judicious testing of "$D" should cover all sorts of combinations
of these choices.

> >   consider a fairly straightforward example from the alsa-state.bb
> > recipe:
> >
> >   pkg_postinst:${PN}() {
> >     if test -z "$D"
> >     then
> >       if test -x ${sbindir}/alsactl
> >       then
> >         ${sbindir}/alsactl -g -f ${localstatedir}/lib/alsa/asound.state restore
> >       fi
> >     fi
> >   }
> >
> > this is clearly(?) meant to run only at first boot as the entire body
> > of the function is surrounded by the test for empty $D, so this one's
> > easy.
> >
> >   (side question: should that routine simply have used
> > pkg_postinst_ontarget? would that have been exactly equivalent?)

  so is pkg_postinst_ontarget() just a clearer way of wrapping the
entire function in a test of:

  if test -z "$D"?


and, logically, either of those approaches should invoke the function
if the package is installed from a package feed.

  i'll ponder this more and perhaps submit a rewrite of that section,
unless someone wants to jump in and do it first. thanks for
clarifying.

rday
--8323329-645812123-1781023109=:3168622--

