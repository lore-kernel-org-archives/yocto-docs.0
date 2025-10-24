Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF286CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 09:50:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.6607.1761299453956974128
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 02:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=eEIunele;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=brlvWB85bG8vT7TgzxZJlWZQZFFhdlsGQj/SPQ9EUAY=; b=eEIunelek/ofxdt5foqu3/s5K/
	QD5JzptNrSRrC+eASUAn/YTVSzbpcCwjUVCcA2lNAfnx+GehME3QGwfl2g7yb9rnHe9QHfXWLsG6n
	/nUcG7XUIqCc/sayaDQBuzBDHSY7LRRkxsiJGezDay4fguwse2FgsUOCixs8Nw5jOzOiGm2gD+5PC
	KmoNnPBlkMpMjZV67rG1Sz8klHAOnjvaO4No0GQrWSPwh3w9gD+W+7DgdpFBemeofjbYlpdt+Rrag
	9xK3sEHkzrb2t+aMPTxLKfWXCqhWskW48dcJKCSZ5dqOr4i30Xqi6rHL49ycT4c/xrv8K8DNFNu7r
	IjeScN1g==;
Received: from [147.129.179.166] (port=59226 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vCERY-0000000FrE5-49v9;
	Fri, 24 Oct 2025 05:50:52 -0400
Date: Fri, 24 Oct 2025 05:53:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Paul Barker <paul@pbarker.dev>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: summary of observations for overview manual, chapter 2
In-Reply-To: <5b81132d588a9220cb13cd5b683d32a8c332010b.camel@pbarker.dev>
Message-ID: <00c6101d-0fa6-6d58-a8fd-ef702cba70d7@crashcourse.ca>
References: <1994ea5f-2ea1-094c-66ee-faf26f0d5791@crashcourse.ca> <5b81132d588a9220cb13cd5b683d32a8c332010b.camel@pbarker.dev>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 09:50:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7811

On Fri, 24 Oct 2025, Paul Barker wrote:

> On Thu, 2025-10-23 at 07:46 -0400, Robert P. J. Day wrote:
> >   full list of observations for:
> >
> > https://docs.yoctoproject.org/overview-manual/yp-intro.html#
> >
> > (including ones i posted yesterday, just so it's all in one place).
> >
> > * typo in first graphic, "YP-Comptible"
> >
> > * reference to "ECOSYSTEM" tab on YP home page, but i don't see such a
> > tab at that page
> >
> > * "commercial Linux vendors such as Wind River, Mentor Graphics,
> > Timesys, and ENEA could take it and provide ongoing support." That
> > list of vendors certainly looks like it could use updating, perhaps
> > with a link to a more current page.
> >
> > * i believe "ENEA" is properly rendered as "Enea".
> >
> > * there is a reference to Clutter, but Clutter's own web site suggests
> > it's being retired: https://blogs.gnome.org/clutter/. should that list
> > of available system components, "X11, Wayland, GTK+, Qt, Clutter, and
> > SDL" include XWayland as well? or be updated in any other way?
> >
> > * "produces packages in standard formats (i.e. RPM, DEB, IPK, and
> > TAR)" ... i through tar format was obsoleted a while back. also, right
> > after that, "by using utilities on the target such as rpm or ipk" ...
> > i thought the ipk-related utility was opkg. is that not what that
> > should say? and add "apt".
>
> There is no package_tar bbclass nowadays, so we should drop TAR from that list
> and update the list of utilities to rpm, apt and opkg.
>
> Are you able to send patches for these changes?

  i can send patches for some of it. regarding the packaging, it seems
the list should include "dpkg/apt" to show that both of those will be
installed.

  the other observations should be handled by people who deal with the
graphics and who can make a policy decision as to which companies to
list as YP members or supporters.

rday

