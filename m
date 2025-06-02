Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B65C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 13:17:46 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.49605.1748870259442375074
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 06:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=GeNBzo6S;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hgh2+8NTzRuyXD6FD6hpmZ40yVbwYsXSScZhKPkA4co=; b=GeNBzo6SCIpHwTTVOd/s+W0XHA
	5a9IsXXabolrxZ730eTM65AkT9PuCgO39K/mxp/Bof6uIyKCfIvxLDNkfivD4AHzblPrGO+8+KxAX
	fpQtu/RZcfv0mXXrYms6/xoQSeiOUEpNkgqirf23REd9QsWSQczHhbnlK5+GId/4HyA4I9ibypkDu
	wGMsjOz2ZEdEQIUYC2nYQa9TUPW3E5572QODjGWASpLnxWfA7v19hlCzMynEqYt+BOzOhdKqw+2TO
	PPS8aMYXTVzdzYxDDcjZYAgn6TVTrHWU9g/5BWJqe7qwOfRPqVSVZ1lfCtwkK9+xAp2tZmpvf1/Xg
	+xitDdjA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:39390 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uM52m-0000000HDDj-1Wma;
	Mon, 02 Jun 2025 09:17:37 -0400
Date: Mon, 2 Jun 2025 09:17:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: richard.purdie@linuxfoundation.org
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] Update Ubuntu essentials list, replace liblz4-tool
 with lz4
In-Reply-To: <565461c8bbac11ca798213c50c0e3ab6eee575ef.camel@linuxfoundation.org>
Message-ID: <5c9a3bab-b96e-bacc-beb7-1f0341b4bcb3@crashcourse.ca>
References: <6f93430f-7953-39b6-caf7-b144f37ab657@crashcourse.ca> <565461c8bbac11ca798213c50c0e3ab6eee575ef.camel@linuxfoundation.org>
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
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 13:17:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6974

On Mon, 2 Jun 2025, Richard Purdie via lists.yoctoproject.org wrote:

> On Mon, 2025-06-02 at 09:02 -0400, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Update the "Ubuntu Essentials package list" by replacing the obsolete
> > liblz4-tool package name with the current lz4 package name.
> >
> > According to Quentin Schulz:
> >
> > "According to pkgs.org, 20.04 lz4 replaces/provides liblz4-tool, same
> > for 22.04 and 24.04 and for some reason, liblz4-tool requires lz4
> > package, so I think it should be fine to replace it yes.
> >
> > "Debian seems to have the same packaging in Bookworm and Bullseye, so
> > probably fine to do the change. They only seem to be adding a
> > changelog and copyright, and require lz4 package in any case."
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/tools/host_packages_scripts/ubuntu_essential.sh b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
> > index f3388c88c..c4231188b 100644
> > --- a/documentation/tools/host_packages_scripts/ubuntu_essential.sh
> > +++ b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
> > @@ -1 +1 @@
> > -sudo apt-get install build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 liblz4-tool locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd
> > +sudo apt-get install build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 lz4 locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd
> >
>
> Do we actually need lz4 on the system to run a build? This seems a
> little strange to me...

  Good question ... HOSTTOOLS definitely insists that it be there.

rday

