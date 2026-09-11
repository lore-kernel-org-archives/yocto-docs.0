Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B05C88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 17:44:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45413.1789148664935123368
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 10:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=tRqUtbnK;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=iG/nP+m0LpoJQX75X8mCO4CDm+BDiOgKbtQbRgXmxTo=; b=t
	RqUtbnK/R8In3s0A8ZqCHcIy4OMMEi5LnpbBbHQv+2oc4ks6xJFCkgfh84nA7eKBgD2F7KscJwkJ3
	RuPSCr/7fyOehzG4TUjt7P/kv3pmzg2ZWm3D8BGtQG6QtZbh3rqAlZtxFlslfK0UEYfdyIlnTnAGq
	4hlNAwDIEe3T///saaIVNv1du03YXUcFoE4rIW2whMOLAQCYi9mmFZwj70BQSP7v1cI6UkhtnSXqh
	T4UiWDFuO2GIohyccihgcqE7e+EhO9tdWEo4usLH6tOuLG1rKwWPAUekGUVrXiOVH70r040NFl+Ew
	lbF4v5p7e7F+LUXDOXe1tdaecUVqhAPyg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:42072 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x55IP-00000003m8z-18yY;
	Fri, 11 Sep 2026 13:44:23 -0400
Date: Fri, 11 Sep 2026 13:41:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: richard.purdie@linuxfoundation.org
cc: antonin.godard@bootlin.com, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Does Ubuntu 24.04 and newer still require AppArmor tweaking
 to run bitbake?
In-Reply-To: <a1ade29f24430238de77852ca5a8045e774a7d75.camel@linuxfoundation.org>
Message-ID: <e2e6840c-d972-d4d4-4c67-ba54cae6dce4@crashcourse.ca>
References: <ec2658dc-005e-f6cc-d64e-0a1c15e992a7@crashcourse.ca>  <DLCBCIBSXUHT.2SR3V23FN8VPD@bootlin.com>  <f983a674-d30d-7659-45f8-ac32a1187c41@crashcourse.ca> <a1ade29f24430238de77852ca5a8045e774a7d75.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2039890354-1789148538=:1950000"
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
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 17:44:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10478

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2039890354-1789148538=:1950000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 11 Sep 2026, Richard Purdie via lists.yoctoproject.org wrote:

> On Fri, 2026-09-11 at 05:16 -0400, Robert P. J. Day via
> lists.yoctoproject.org wrote:
> > On Fri, 11 Sep 2026, Antonin Godard via lists.yoctoproject.org wrote:
> >
> > > Hi,
> > >
> > > On Thu Sep 10, 2026 at 2:57 PM CEST, Robert P. J. Day wrote:
> > > >
> > > >   I use stock Debian so I haven't needed to mess with this, but
> > > > Ubuntu
> > > > once had this issue with AppArmor:
> > > >
> > > > https://developerwiki.proventusnova.com/Error:_BitBake_+_AppArmor_User_Namespace_Restriction_Fix
> > > >
> > > > If that's still a problem, it doesn't seem to be mentioned in the
> > > > docs.
> > >
> > > I don't have a running Ubuntu 26.04 distribution but I would say it
> > > is still the
> > > case if 26.04 is still running AppArmor.
> > >
> > > Users will face the same error as before which is:
> > >
> > >   bb.fatal("User namespaces are not usable by BitBake, possibly due
> > > to AppArmor.\n"
> > >            "See
> > > https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-release-notes/39890#unprivileged-user-namespace-restrictions
> > >  for more information.")
> > >
> > > In OE-Core's meta/lib/oe/sanity.py.
> > >
> > > This sounds like something we could say in the docs. Would you mind
> > > sending a
> > > patch for that?
> >
> >   seems to me that the proper place for this would be a "warning"
> > admonition at the tail end of this section:
> >
> > https://docs.yoctoproject.org/ref-manual/system-requirements.html#supported-linux-distributions
> >
> > i wouldn't want to get into incredible detail there, just point out
> > that starting with ubuntu 24.04, you would get that namespaces error,
> > then refer the reader to that discourse link for the solution. does
> > that sound adequate? i don't think the YP docs need to reproduce the
> > solution in its entirety.
>
> This is important enough I think we should have it documented
> ourselves, not externally where it could disappear.

  So where should it go, and is anyone else keen on doing it? :-)

rday
--8323329-2039890354-1789148538=:1950000--

