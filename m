Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0454EC1449
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:36:18 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18332.1772544968583691078
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 05:36:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=sRDV3CyB;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SHyqRjWmjm0rFHDF+n5McY3L1SzBTjCCaNnrIOHf/a8=; b=sRDV3CyB7/vx+sZB3kOieXtlvO
	BzcGNE9kMV19nRCU0niCmVhu0/KNHFibxw4HzgTEZUN6v9f5DecBlW4WsVa/RWV4syOjyo0JX35Hn
	dLSPR32WZEDsMX5LjV3FpTduTrqY6Ej0+t9IvJBqOsir8WhrKoWRo1VwgBX6G4cFYNXc9D6/8mnj5
	tUH2H8/UydKpDQ6HsFp23c4Smem402LJGrdmd/GOzcmgZ9as7WCIPMKq5+yaNrQXxMvwJrT9ksRMs
	ZZqPePIp/ZJ4BcgO2sSFWx7EZShf74pI+QFSKYsxRoJm/hq/wYqNFWqITAYQ2vI6Y+AmpZ+5WZvBT
	EpC/y7qA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:54226 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vxPut-00000001F0G-0RdJ;
	Tue, 03 Mar 2026 08:36:07 -0500
Date: Tue, 3 Mar 2026 08:35:35 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] does PACKAGE_EXCLUDE not handle .deb packages?
In-Reply-To: <DGT6MOLXE6N0.121PL435E6W89@bootlin.com>
Message-ID: <33361f96-fc60-50a9-4aaf-efb34c3418e3@crashcourse.ca>
References: <929b18be-e9ac-ad9-b8b2-36f95834834a@crashcourse.ca> <1a48de66-a431-451f-ad28-70879392ffe9@bootlin.com> <ea6a195a-ac68-ffb3-5a52-a1af97e3356b@crashcourse.ca> <DGT6MOLXE6N0.121PL435E6W89@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Tue, 03 Mar 2026 13:36:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9049

On Tue, 3 Mar 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Mon Mar 2, 2026 at 1:38 PM CET, Robert P. J. Day wrote:
> > On Tue, 10 Oct 2023, Michael Opdenacker wrote:
> >
> >> Hi Robert
> >>
> >> On 09.10.23 at 07:33, Robert P. J. Day wrote:
> >> >    from
> >> > https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_EXCLUDE:
> >> >
> >> > "This variable is supported only when using the IPK and RPM packaging
> >> > backends. DEB is not supported."
> >> >
> >> >    i just tried it with .deb packages and it *appears* to work.
> >> > thoughts?
> >>
> >>
> >> Funny, I came across this paragraph last week. Thanks for testing!
> >> Indeed, the code seems to support this.
> >> Shall we change the docs if nobody objects?
> >
> >   From *way* back in 2023, I just noticed this ... the docs still
> > suggest that PACKAGE_EXCLUDE does not support .deb packaging:
> >
> > https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_EXCLUDE
> >
> > can someone clarify this?
>
> Yes, I could also verify that deb packages can be excluded through
> this variable. Can you send a patch to remove the sentence?

  i literally, just this minute, verified the same. will send patch
shortly.

rday

